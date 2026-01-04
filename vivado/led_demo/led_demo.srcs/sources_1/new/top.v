`timescale 1ns / 1ps

module top (
    input CLK50M,
    input CLK27M,
    input CLK50M1V5,

    input [2:0] SW,
    input KEY,
    output [1:0] LED,
    output RGB_DAT,

    inout [63:0] GPIO,

    input  UART_RX,
    output UART_TX,
    input  UART_RTS_N,
    output UART_CTS_N,

    // output [2:0] HDMI_D_P,
    // output [2:0] HDMI_D_N,
    // output HDMI_CK_P,
    // output HDMI_CK_N,
    output HDMI_SCL,
    inout  HDMI_SDA,
    input  HDMI_HPD_N,

    inout [31:0] DDR3_DQ,
    output [3:0] DDR3_DM,
    // inout [3:0] DDR3_DQS_P,
    // inout [3:0] DDR3_DQS_N,
    output [14:0] DDR3_ADDR,
    output [2:0] DDR3_BA,
    // output DDR3_CK_P,
    // output DDR3_CK_N,
    output DDR3_RAS_N,
    output DDR3_CAS_N,
    output DDR3_WE_N,
    output DDR3_RST_N,
    output DDR3_CKE,
    output DDR3_ODT,
    output DDR3_CS_N,

    inout [3:0] QSPI_DQ,
    output QSPI_CS_N
);
    integer i;
    genvar j;

    wire RST = KEY;

    // modes
    localparam SCANNER_TRAIL = 0, RGB_BINARY_COUNTER = 1;

    // constants
    reg [31:0] TICK_PERIODS[3:0];
    initial begin
        TICK_PERIODS[SCANNER_TRAIL] = 7142857 - 1;  // 7142857.14286 cycles @ 50MHz = 7Hz
        TICK_PERIODS[RGB_BINARY_COUNTER] = 488281 - 1;  // 488281.25 cycles @ 50MHz = 512/5 Hz
    end

    // sequential
    reg [1:0] mode;
    reg [31:0] tick_counter;  // overflowing counter
    reg [2:0] led_index;
    reg [15:0] counter;  // counts every tick
    reg rgb_updating;
    reg [23:0] scanner_fading[7:0];
    reg scanner_direction;

    // combinational
    reg [1:0] next_mode;
    wire tick_signal = tick_counter == 0;
    wire rgb_update_signal = rgb_updating && led_index == 7;
    reg [7:0] phases[2:0];
    reg zero_led_index;
    reg zero_counter;
    reg increment_led_index;
    reg next_rgb_updating;
    reg [23:0] rgb_data;
    reg rgb_we;
    reg [23:0] next_scanner_fading[7:0];

    // interconnects
    wire rgb_busy;
    wire [7:0] lut_data[2:0];

    ws2812 #(
        .INPUT_CLK_FREQ(50000000),
        .PWM_CLK_FREQ(800000),
        .US_RESET(300),
        .LED_COUNT(8)
    ) ws2812_inst (
        .CLK(CLK50M),
        .RST(RST),
        .WR_DATA(rgb_data),
        .WR_ADDR(led_index),
        .WR_EN(rgb_we),
        .START(rgb_update_signal),
        .BUSY(rgb_busy),
        .RGB_DAT(RGB_DAT)
    );

    generate
        for (j = 0; j < 3; j = j + 1) begin
            sin_lut sin_lut_inst (
                .PHASE(phases[j]),
                .VALUE(lut_data[j])
            );
        end
    endgenerate

    always @(posedge CLK50M or posedge RST) begin
        if (RST) begin
            mode <= SCANNER_TRAIL;
        end else if (tick_signal) begin
            mode <= next_mode;
        end
    end

    always @(posedge CLK50M or posedge RST) begin
        if (RST) begin
            tick_counter <= 0;
        end else begin
            if (tick_counter >= TICK_PERIODS[mode]) begin
                tick_counter <= 0;
            end else begin
                tick_counter <= tick_counter + 1;
            end
        end
    end

    always @(posedge CLK50M or posedge RST) begin
        if (RST) begin
            counter <= 0;
        end else begin
            if (tick_signal) begin
                if (zero_counter) begin
                    counter <= 0;
                end else begin
                    counter <= counter + 1;
                end
            end
        end
    end

    always @(posedge CLK50M or posedge RST) begin
        if (RST) begin
            led_index <= 0;
            rgb_updating <= 0;
        end else begin
            if (zero_led_index) begin
                led_index <= 0;
            end else if (increment_led_index) begin
                led_index <= led_index + 1;
            end
            rgb_updating <= next_rgb_updating;
        end
    end

    always @(posedge CLK50M or posedge RST) begin
        if (RST) begin
            scanner_direction <= 1;
            for (i = 0; i < 8; i = i + 1) begin
                scanner_fading[i] <= 0;
            end
        end else begin
            if (mode == SCANNER_TRAIL) begin
                if (tick_signal) begin
                    if (counter[2:0] == 3'd7) scanner_direction <= ~scanner_direction;
                    for (i = 0; i < 8; i = i + 1) begin
                        scanner_fading[i] <= next_scanner_fading[i];
                    end
                end
            end else begin
                scanner_direction <= 1;
                for (i = 0; i < 8; i = i + 1) begin
                    scanner_fading[i] <= 0;
                end
            end
        end
    end

    always @(*) begin
        next_rgb_updating = rgb_updating;
        increment_led_index = 0;
        zero_led_index = 0;
        rgb_we = 0;

        if (rgb_updating) begin
            increment_led_index = 1;
            rgb_we = 1;
            if (led_index >= 7) begin
                next_rgb_updating = 0;
                zero_led_index = 1;
            end
        end else begin
            if (tick_signal) begin
                next_rgb_updating = 1;
                zero_led_index = 1;
            end
        end
    end

    always @(*) begin
        next_mode = mode;
        zero_counter = 0;
        rgb_data = 24'd0;
        phases[0] = 0;
        phases[1] = 0;
        phases[2] = 0;
        for (i = 0; i < 8; i = i + 1) begin
            next_scanner_fading[i] = 0;
        end

        case (mode)
            SCANNER_TRAIL: begin
                phases[0] = {counter[4:0], 3'd0};
                phases[1] = {counter[4:0], 3'd0} + 7'd85;
                phases[2] = {counter[4:0], 3'd0} - 7'd85;
                rgb_data  = scanner_fading[led_index];

                if (scanner_direction) begin
                    for (i = 0; i < 8; i = i + 1) begin
                        if (counter[2:0] == i) begin
                            next_scanner_fading[i] = {
                                {3'd0, lut_data[0][7:3]},
                                {3'd0, lut_data[1][7:3]},
                                {3'd0, lut_data[2][7:3]}
                            };
                        end else begin
                            next_scanner_fading[i] = {
                                scanner_fading[i][23:16] >> 1,
                                scanner_fading[i][15:8] >> 1,
                                scanner_fading[i][7:0] >> 1
                            };
                        end
                    end
                end else begin
                    for (i = 0; i < 8; i = i + 1) begin
                        if (counter[2:0] == 7 - i) begin
                            next_scanner_fading[i] = {
                                {3'd0, lut_data[0][7:3]},
                                {3'd0, lut_data[1][7:3]},
                                {3'd0, lut_data[2][7:3]}
                            };
                        end else begin
                            next_scanner_fading[i] = {
                                scanner_fading[i][23:16] >> 1,
                                scanner_fading[i][15:8] >> 1,
                                scanner_fading[i][7:0] >> 1
                            };
                        end
                    end
                end

                if (counter >= 32) begin
                    next_mode = RGB_BINARY_COUNTER;
                    zero_counter = 1;
                end
            end
            RGB_BINARY_COUNTER: begin
                phases[0] = counter[7:0] + {led_index, 5'd0};
                phases[1] = counter[7:0] + {led_index, 5'd0} + 7'd85;
                phases[2] = counter[7:0] + {led_index, 5'd0} - 7'd85;

                if (counter[(7-led_index)+1])
                    rgb_data = {
                        {3'd0, lut_data[0][7:3]}, {3'd0, lut_data[1][7:3]}, {3'd0, lut_data[2][7:3]}
                    };
                if (counter >= 511) begin
                    next_mode = SCANNER_TRAIL;
                    zero_counter = 1;
                end
            end
            default: next_mode = SCANNER_TRAIL;
        endcase
    end

endmodule
