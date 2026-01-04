`timescale 1ns / 100ps

module tb_ws2812 ();
    localparam CLK_FREQ = 50000000;
    localparam PWM_CLK_FREQ = 800000;
    localparam US_RESET = 250;
    localparam LED_COUNT = 8;

    reg CLK;
    reg RST;
    reg [23:0] WR_DATA;
    reg [((LED_COUNT <= 1) ? 1 : $clog2(LED_COUNT))-1:0] WR_ADDR;
    reg WR_EN;
    reg START;
    wire BUSY;
    wire RGB_DAT;

    integer i;

    ws2812 #(
        .INPUT_CLK_FREQ(CLK_FREQ),
        .PWM_CLK_FREQ(PWM_CLK_FREQ),
        .US_RESET(US_RESET),
        .LED_COUNT(LED_COUNT)
    ) dut (
        .CLK(CLK),
        .RST(RST),
        // to controller side
        .WR_DATA(WR_DATA),
        .WR_ADDR(WR_ADDR),
        .WR_EN(WR_EN),
        .START(START),
        .BUSY(BUSY),
        // to led
        .RGB_DAT(RGB_DAT)
    );

    // internal signals
    // wire [4:0] internal_bit_index = dut.bit_index;
    // wire [2:0] internal_led_index = dut.led_index;

    // tb input
    reg [23:0] sample_data[0:7];

    initial begin
        CLK = 1;
        forever #10 CLK = ~CLK;  // 50MHz clock
    end

    initial begin
        RST   = 1;
        WR_EN = 0;
        START = 0;

        #21;
        RST = 0;
        #20;

        sample_data[0] = 24'h010307;
        sample_data[1] = 24'haa55aa;
        sample_data[2] = 24'hf0f0f0;
        sample_data[3] = 24'h0f0f0f;
        sample_data[4] = 24'hff0000;
        sample_data[5] = 24'h00ff00;
        sample_data[6] = 24'h0000ff;
        sample_data[7] = 24'h124812;

        WR_EN = 1;
        for (i = 0; i < LED_COUNT; i = i + 1) begin
            WR_ADDR = i;
            WR_DATA = sample_data[i];
            #20;
        end
        WR_EN = 0;

        #20;
        START = 1;
        #20;
        START = 0;
        wait (!BUSY);
        #1;

        #500;

        sample_data[0] = 24'hffffff;
        sample_data[1] = 24'h000000;
        sample_data[2] = 24'haaaaaa;
        sample_data[3] = 24'h555555;
        sample_data[4] = 24'h123456;
        sample_data[5] = 24'h00ff00;
        sample_data[6] = 24'h0000ff;
        sample_data[7] = 24'h321321;

        WR_EN = 1;
        for (i = 0; i < LED_COUNT; i = i + 1) begin
            WR_ADDR = i;
            WR_DATA = sample_data[i];
            #20;
        end
        WR_EN = 0;

        #20;
        START = 1;
        #20;
        START = 0;
        wait (!BUSY);

        #100;
        $stop;
    end

endmodule
