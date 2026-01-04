`timescale 1ns / 100ps

module tb_top ();

    reg CLK50M;
    wire [1:0] LED;
    wire RGB_DAT;
    reg [2:0] SW;
    reg KEY;

    genvar k;
    integer i;

    // wire [31:0] tick_counter = dut.tick_counter;
    // wire [2:0] rgb_counter = dut.rgb_counter;
    wire [15:0] counter = dut.counter;
    // wire is_counting = dut.is_counting;

    wire tick_signal = dut.tick_signal;
    // wire zero_counter = dut.zero_counter;
    // wire en_counter = dut.en_counter;
    // wire next_is_counting = dut.next_is_counting;
    wire [1:0] mode = dut.mode;
    // wire [23:0] rgb_data = dut.rgb_data;
    // wire rgb_we = dut.rgb_we;
    // wire rgb_start = dut.rgb_start;
    // wire rgb_busy = dut.rgb_busy;

    wire [23:0] scanner_fading[7:0];
    wire [7:0] mem0[7:0];
    wire [7:0] mem1[7:0];
    wire [7:0] mem2[7:0];
    wire scanner_direction = dut.scanner_direction;
    for (k = 0; k < 8; k = k + 1) begin
        assign scanner_fading[k] = dut.scanner_fading[k];
        assign mem0[k] = dut.ws2812_inst.rgb_mem_inst.mem[k][23:16];
        assign mem1[k] = dut.ws2812_inst.rgb_mem_inst.mem[k][15:8];
        assign mem2[k] = dut.ws2812_inst.rgb_mem_inst.mem[k][7:0];
    end

    top dut (
        .CLK50M (CLK50M),
        .LED    (LED),
        .RGB_DAT(RGB_DAT),
        .SW     (SW),
        .KEY    (KEY)
    );

    initial begin
        CLK50M = 1;
        forever #10 CLK50M = ~CLK50M;
    end

    initial begin
        KEY = 1;
        SW  = 3'b000;

        #21;
        KEY = 0;

        // wait (counter == 8'd255);
        #50000000;  // 1 sec
        $stop;

    end

endmodule
