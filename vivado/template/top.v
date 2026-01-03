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

    output [2:0] HDMI_D_P,
    output [2:0] HDMI_D_N,
    output HDMI_CK_P,
    output HDMI_CK_N,
    output HDMI_SCL,
    inout HDMI_SDA,
    input HDMI_HPD_N,

    inout [31:0] DDR3_DQ,
    output [3:0] DDR3_DM,
    inout [3:0] DDR3_DQS_P,
    inout [3:0] DDR3_DQS_N,
    output [14:0] DDR3_ADDR,
    output [2:0] DDR3_BA,
    output DDR3_CK_P,
    output DDR3_CK_N,
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

endmodule
