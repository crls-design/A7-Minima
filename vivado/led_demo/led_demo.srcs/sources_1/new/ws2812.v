module ws2812 #(
    parameter INPUT_CLK_FREQ = 50000000,
    parameter PWM_CLK_FREQ = 800000,
    parameter US_RESET = 250,
    parameter LED_COUNT = 8
) (
    input wire CLK,
    input wire RST,
    // to controller side
    input wire [23:0] WR_DATA,
    input wire [((LED_COUNT <= 1) ? 1 : $clog2(LED_COUNT))-1:0] WR_ADDR,
    input wire WR_EN,
    input wire START,
    output BUSY,
    // to led
    output reg RGB_DAT
);
    // state encoding
    localparam STATE_IDLE = 2'b00;
    localparam STATE_BUSY = 2'b10;
    localparam STATE_RESET = 2'b11;

    localparam BIT_CYCLES = INPUT_CLK_FREQ / PWM_CLK_FREQ - 1;

    // sequential
    reg [1:0] state;
    reg [((LED_COUNT <= 1) ? 1 : $clog2(LED_COUNT))-1:0] led_index;
    reg [4:0] bit_index;
    reg [31:0] counter;

    // combinational
    reg [1:0] next_state;
    reg increment_led_index;
    reg increment_bit_index;
    reg zero_counter;
    reg en_counter;
    reg out_high;
    reg out_low;
    reg reset_index;

    // interconnects
    wire [23:0] mem_rd_data;

    assign BUSY = state != STATE_IDLE;

    rgb_mem #(
        .DATA_WIDTH(24),
        .NUM_WORD  (LED_COUNT)
    ) rgb_mem_inst (
        .CLK(CLK),
        .WR_DATA(WR_DATA),
        .WR_ADDR(WR_ADDR),
        .WR_EN(WR_EN),
        .RD_DATA(mem_rd_data),
        .RD_ADDR(led_index)
    );

    // counter logic
    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            counter <= 0;
        end else begin
            if (zero_counter) begin
                counter <= 0;
            end else if (en_counter) begin
                counter <= counter + 1;
            end
        end
    end

    // output logic
    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            RGB_DAT <= 0;
        end else begin
            case ({
                out_high, out_low
            })
                2'b10: RGB_DAT <= 1;
                2'b01: RGB_DAT <= 0;
            endcase
        end
    end

    // index logic
    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            led_index <= 0;
            bit_index <= 23;
        end else begin
            if (reset_index) begin
                led_index <= 0;
                bit_index <= 23;
            end else begin
                if (increment_led_index) begin
                    led_index <= led_index + 1;
                    bit_index <= 23;
                end else if (increment_bit_index) begin
                    if (bit_index != 0) bit_index <= bit_index - 1;
                end
            end
        end
    end

    // state logic
    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            state <= STATE_IDLE;
        end else begin
            state <= next_state;
        end
    end

    // state transition
    always @(*) begin
        next_state = state;
        increment_led_index = 0;
        increment_bit_index = 0;
        zero_counter = 0;
        en_counter = 0;
        out_high = 0;
        out_low = 0;
        reset_index = 0;

        case (state)
            STATE_IDLE: begin
                if (START) begin
                    next_state   = STATE_BUSY;
                    zero_counter = 1;
                    out_high     = 1;
                    reset_index  = 1;
                end
            end
            STATE_BUSY: begin
                en_counter = 1;
                if (led_index >= LED_COUNT - 1 && bit_index == 0 && counter >= BIT_CYCLES) begin
                    next_state   = STATE_RESET;
                    zero_counter = 1;
                end else begin
                    if (counter >= BIT_CYCLES) begin
                        zero_counter = 1;
                        out_high = 1;
                        if (bit_index == 0) begin
                            increment_led_index = 1;
                        end else begin
                            increment_bit_index = 1;
                        end
                    end else if (counter >= BIT_CYCLES / 4 && ~mem_rd_data[bit_index]) begin
                        out_low = 1;
                    end else if (counter >= 3 * BIT_CYCLES / 4 && mem_rd_data[bit_index]) begin
                        out_low = 1;
                    end
                end
            end
            STATE_RESET: begin
                en_counter = 1;
                if (counter >= US_RESET * (INPUT_CLK_FREQ / 1000000) - 1) begin
                    if (START) begin
                        next_state   = STATE_BUSY;
                        zero_counter = 1;
                        out_high     = 1;
                        reset_index  = 1;
                    end else next_state = STATE_IDLE;
                end
            end
            default: begin
                next_state = STATE_IDLE;
            end
        endcase
    end

endmodule

module rgb_mem #(
    parameter DATA_WIDTH = 24,
    parameter NUM_WORD   = 8
) (
    input CLK,
    input [DATA_WIDTH-1:0] WR_DATA,
    input [(NUM_WORD <= 1) ? 0 : $clog2(NUM_WORD)-1:0] WR_ADDR,
    input WR_EN,
    output reg [DATA_WIDTH-1:0] RD_DATA,
    input [(NUM_WORD <= 1) ? 0 : $clog2(NUM_WORD)-1:0] RD_ADDR
);
    reg [DATA_WIDTH-1:0] mem[0:NUM_WORD-1];

    always @(posedge CLK) begin
        if (WR_EN) begin
            mem[WR_ADDR] <= WR_DATA;
        end
    end

    always @(*) begin
        RD_DATA = mem[RD_ADDR];
    end

endmodule
