## Clock Signals
# input CLK50M,
# input CLK27M,
# input CLK50M1V5,
set_property -dict { PACKAGE_PIN P17 IOSTANDARD LVCMOS33 } [get_ports { CLK50M }];
set_property -dict { PACKAGE_PIN H16 IOSTANDARD LVCMOS33 } [get_ports { CLK27M }];
set_property -dict { PACKAGE_PIN F4  IOSTANDARD LVCMOS15 } [get_ports { CLK50M1V5 }];
create_clock -add -name CLK50M    -period 20.00  -waveform {0 5} [get_ports { CLK50M }];
create_clock -add -name CLK27M    -period 37.037 -waveform {0 5} [get_ports { CLK27M }];
create_clock -add -name CLK50M1V5 -period 20.00  -waveform {0 5} [get_ports { CLK50M1V5 }];

## Switches
# input [2:0] SW,
set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 } [get_ports { SW[0] }];
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports { SW[1] }];
set_property -dict { PACKAGE_PIN V15 IOSTANDARD LVCMOS33 } [get_ports { SW[2] }];

## Button
# input KEY,
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports { KEY }];

## LEDs
# output [1:0] LED,
set_property -dict { PACKAGE_PIN L18 IOSTANDARD LVCMOS33 } [get_ports { LED[0] }];
set_property -dict { PACKAGE_PIN M18 IOSTANDARD LVCMOS33 } [get_ports { LED[1] }];

## RGB LEDs
# output RGB_DAT,
set_property -dict { PACKAGE_PIN B11 IOSTANDARD LVCMOS33 } [get_ports { RGB_DAT }];

## GPIO
# inout [63:0] GPIO,
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports { GPIO[0] }];
set_property -dict { PACKAGE_PIN J18 IOSTANDARD LVCMOS33 } [get_ports { GPIO[1] }];
set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports { GPIO[2] }];
set_property -dict { PACKAGE_PIN G18 IOSTANDARD LVCMOS33 } [get_ports { GPIO[3] }];
set_property -dict { PACKAGE_PIN F18 IOSTANDARD LVCMOS33 } [get_ports { GPIO[4] }];
set_property -dict { PACKAGE_PIN D17 IOSTANDARD LVCMOS33 } [get_ports { GPIO[5] }];
set_property -dict { PACKAGE_PIN E16 IOSTANDARD LVCMOS33 } [get_ports { GPIO[6] }];
set_property -dict { PACKAGE_PIN E15 IOSTANDARD LVCMOS33 } [get_ports { GPIO[7] }];

set_property -dict { PACKAGE_PIN F13 IOSTANDARD LVCMOS33 } [get_ports { GPIO[8] }];
set_property -dict { PACKAGE_PIN F14 IOSTANDARD LVCMOS33 } [get_ports { GPIO[9] }];
set_property -dict { PACKAGE_PIN G14 IOSTANDARD LVCMOS33 } [get_ports { GPIO[10] }];
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports { GPIO[11] }];
set_property -dict { PACKAGE_PIN J14 IOSTANDARD LVCMOS33 } [get_ports { GPIO[12] }];
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports { GPIO[13] }];
set_property -dict { PACKAGE_PIN B14 IOSTANDARD LVCMOS33 } [get_ports { GPIO[14] }];
set_property -dict { PACKAGE_PIN B13 IOSTANDARD LVCMOS33 } [get_ports { GPIO[15] }];

set_property -dict { PACKAGE_PIN M17 IOSTANDARD LVCMOS33 } [get_ports { GPIO[16] }];
set_property -dict { PACKAGE_PIN K16 IOSTANDARD LVCMOS33 } [get_ports { GPIO[17] }];
set_property -dict { PACKAGE_PIN J17 IOSTANDARD LVCMOS33 } [get_ports { GPIO[18] }];
set_property -dict { PACKAGE_PIN G16 IOSTANDARD LVCMOS33 } [get_ports { GPIO[19] }];
set_property -dict { PACKAGE_PIN F15 IOSTANDARD LVCMOS33 } [get_ports { GPIO[20] }];
set_property -dict { PACKAGE_PIN F16 IOSTANDARD LVCMOS33 } [get_ports { GPIO[21] }];
set_property -dict { PACKAGE_PIN E17 IOSTANDARD LVCMOS33 } [get_ports { GPIO[22] }];
set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS33 } [get_ports { GPIO[23] }];

set_property -dict { PACKAGE_PIN H14 IOSTANDARD LVCMOS33 } [get_ports { GPIO[24] }];
set_property -dict { PACKAGE_PIN H15 IOSTANDARD LVCMOS33 } [get_ports { GPIO[25] }];
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [get_ports { GPIO[26] }];
set_property -dict { PACKAGE_PIN K13 IOSTANDARD LVCMOS33 } [get_ports { GPIO[27] }];
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [get_ports { GPIO[28] }];
set_property -dict { PACKAGE_PIN R12 IOSTANDARD LVCMOS33 } [get_ports { GPIO[29] }];
set_property -dict { PACKAGE_PIN A14 IOSTANDARD LVCMOS33 } [get_ports { GPIO[30] }];
set_property -dict { PACKAGE_PIN A13 IOSTANDARD LVCMOS33 } [get_ports { GPIO[31] }];

set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports { GPIO[32] }];
set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [get_ports { GPIO[33] }];
set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports { GPIO[34] }];
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports { GPIO[35] }];
set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports { GPIO[36] }];
set_property -dict { PACKAGE_PIN P14 IOSTANDARD LVCMOS33 } [get_ports { GPIO[37] }];
set_property -dict { PACKAGE_PIN T14 IOSTANDARD LVCMOS33 } [get_ports { GPIO[38] }];
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [get_ports { GPIO[39] }];

set_property -dict { PACKAGE_PIN V11 IOSTANDARD LVCMOS33 } [get_ports { GPIO[40] }];
set_property -dict { PACKAGE_PIN T11 IOSTANDARD LVCMOS33 } [get_ports { GPIO[41] }];
set_property -dict { PACKAGE_PIN T10 IOSTANDARD LVCMOS33 } [get_ports { GPIO[42] }];
set_property -dict { PACKAGE_PIN R10 IOSTANDARD LVCMOS33 } [get_ports { GPIO[43] }];
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33 } [get_ports { GPIO[44] }];
set_property -dict { PACKAGE_PIN R13 IOSTANDARD LVCMOS33 } [get_ports { GPIO[45] }];
set_property -dict { PACKAGE_PIN U13 IOSTANDARD LVCMOS33 } [get_ports { GPIO[46] }];
set_property -dict { PACKAGE_PIN R11 IOSTANDARD LVCMOS33 } [get_ports { GPIO[47] }];

set_property -dict { PACKAGE_PIN N17 IOSTANDARD LVCMOS33 } [get_ports { GPIO[48] }];
set_property -dict { PACKAGE_PIN M16 IOSTANDARD LVCMOS33 } [get_ports { GPIO[49] }];
set_property -dict { PACKAGE_PIN N16 IOSTANDARD LVCMOS33 } [get_ports { GPIO[50] }];
set_property -dict { PACKAGE_PIN N15 IOSTANDARD LVCMOS33 } [get_ports { GPIO[51] }];
set_property -dict { PACKAGE_PIN R16 IOSTANDARD LVCMOS33 } [get_ports { GPIO[52] }];
set_property -dict { PACKAGE_PIN T16 IOSTANDARD LVCMOS33 } [get_ports { GPIO[53] }];
set_property -dict { PACKAGE_PIN P15 IOSTANDARD LVCMOS33 } [get_ports { GPIO[54] }];
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports { GPIO[55] }];

set_property -dict { PACKAGE_PIN U12 IOSTANDARD LVCMOS33 } [get_ports { GPIO[56] }];
set_property -dict { PACKAGE_PIN V12 IOSTANDARD LVCMOS33 } [get_ports { GPIO[57] }];
set_property -dict { PACKAGE_PIN U11 IOSTANDARD LVCMOS33 } [get_ports { GPIO[58] }];
set_property -dict { PACKAGE_PIN V10 IOSTANDARD LVCMOS33 } [get_ports { GPIO[59] }];
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports { GPIO[60] }];
set_property -dict { PACKAGE_PIN T15 IOSTANDARD LVCMOS33 } [get_ports { GPIO[61] }];
set_property -dict { PACKAGE_PIN V14 IOSTANDARD LVCMOS33 } [get_ports { GPIO[62] }];
set_property -dict { PACKAGE_PIN T13 IOSTANDARD LVCMOS33 } [get_ports { GPIO[63] }];

## USB-RS232 Interface
# input  UART_RX,
# output UART_TX,
# input  UART_RTS_N,
# output UART_CTS_N,
set_property -dict { PACKAGE_PIN A18 IOSTANDARD LVCMOS33 } [get_ports { UART_RX }];
set_property -dict { PACKAGE_PIN B17 IOSTANDARD LVCMOS33 } [get_ports { UART_TX }];
set_property -dict { PACKAGE_PIN B18 IOSTANDARD LVCMOS33 } [get_ports { UART_RTS_N }];
set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports { UART_CTS_N }];

## HDMI out
# output [2:0] HDMI_D_P,
# output [2:0] HDMI_D_N,
# output HDMI_CK_P,
# output HDMI_CK_N,
# output HDMI_SCL,
# inout  HDMI_SDA,
# input  HDMI_HPD_N,
set_property -dict { PACKAGE_PIN A15 IOSTANDARD TMDS_33  } [get_ports { HDMI_D_P[0] }];
set_property -dict { PACKAGE_PIN A16 IOSTANDARD TMDS_33  } [get_ports { HDMI_D_N[0] }];
set_property -dict { PACKAGE_PIN D14 IOSTANDARD TMDS_33  } [get_ports { HDMI_D_P[1] }];
set_property -dict { PACKAGE_PIN C14 IOSTANDARD TMDS_33  } [get_ports { HDMI_D_N[1] }];
set_property -dict { PACKAGE_PIN C12 IOSTANDARD TMDS_33  } [get_ports { HDMI_D_P[2] }];
set_property -dict { PACKAGE_PIN B12 IOSTANDARD TMDS_33  } [get_ports { HDMI_D_N[2] }];
set_property -dict { PACKAGE_PIN C16 IOSTANDARD TMDS_33  } [get_ports { HDMI_CK_P }];
set_property -dict { PACKAGE_PIN C17 IOSTANDARD TMDS_33  } [get_ports { HDMI_CK_N }];
set_property -dict { PACKAGE_PIN C15 IOSTANDARD LVCMOS33 } [get_ports { HDMI_SCL }];
set_property -dict { PACKAGE_PIN D15 IOSTANDARD LVCMOS33 } [get_ports { HDMI_SDA }];
set_property -dict { PACKAGE_PIN G13 IOSTANDARD LVCMOS33 } [get_ports { HDMI_HPD_N }];

## DDR3
# inout [31:0] DDR3_DQ,
# output [3:0] DDR3_DM,
# inout [3:0] DDR3_DQS_P,
# inout [3:0] DDR3_DQS_N,
# output [14:0] DDR3_ADDR,
# output [2:0] DDR3_BA,
# output DDR3_CK_P,
# output DDR3_CK_N,
# output {DDR3_RAS_N},
# output {DDR3_CAS_N},
# output {DDR3_WE_N},
# output {DDR3_RST_N},
# output DDR3_CKE,
# output DDR3_ODT,
# output DDR3_CS_N
# PadFunction: IO_L1N_T0_34
set_property SLEW FAST [get_ports {DDR3_DQ[0]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[0]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[0]}]
set_property PACKAGE_PIN M1 [get_ports {DDR3_DQ[0]}]

# PadFunction: IO_L5N_T0_34
set_property SLEW FAST [get_ports {DDR3_DQ[1]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[1]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[1]}]
set_property PACKAGE_PIN L4 [get_ports {DDR3_DQ[1]}]

# PadFunction: IO_L1P_T0_34
set_property SLEW FAST [get_ports {DDR3_DQ[2]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[2]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[2]}]
set_property PACKAGE_PIN L1 [get_ports {DDR3_DQ[2]}]

# PadFunction: IO_L6N_T0_VREF_34
set_property SLEW FAST [get_ports {DDR3_DQ[3]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[3]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[3]}]
set_property PACKAGE_PIN L5 [get_ports {DDR3_DQ[3]}]

# PadFunction: IO_L4P_T0_34
set_property SLEW FAST [get_ports {DDR3_DQ[4]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[4]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[4]}]
set_property PACKAGE_PIN M3 [get_ports {DDR3_DQ[4]}]

# PadFunction: IO_L5P_T0_34
set_property SLEW FAST [get_ports {DDR3_DQ[5]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[5]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[5]}]
set_property PACKAGE_PIN K5 [get_ports {DDR3_DQ[5]}]

# PadFunction: IO_L4N_T0_34
set_property SLEW FAST [get_ports {DDR3_DQ[6]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[6]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[6]}]
set_property PACKAGE_PIN M2 [get_ports {DDR3_DQ[6]}]

# PadFunction: IO_L2P_T0_34
set_property SLEW FAST [get_ports {DDR3_DQ[7]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[7]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[7]}]
set_property PACKAGE_PIN K3 [get_ports {DDR3_DQ[7]}]

# PadFunction: IO_L16P_T2_34
set_property SLEW FAST [get_ports {DDR3_DQ[8]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[8]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[8]}]
set_property PACKAGE_PIN M4 [get_ports {DDR3_DQ[8]}]

# PadFunction: IO_L14N_T2_SRCC_34
set_property SLEW FAST [get_ports {DDR3_DQ[9]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[9]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[9]}]
set_property PACKAGE_PIN P3 [get_ports {DDR3_DQ[9]}]

# PadFunction: IO_L13P_T2_MRCC_34
set_property SLEW FAST [get_ports {DDR3_DQ[10]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[10]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[10]}]
set_property PACKAGE_PIN N5 [get_ports {DDR3_DQ[10]}]

# PadFunction: IO_L14P_T2_SRCC_34
set_property SLEW FAST [get_ports {DDR3_DQ[11]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[11]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[11]}]
set_property PACKAGE_PIN P4 [get_ports {DDR3_DQ[11]}]

# PadFunction: IO_L13N_T2_MRCC_34
set_property SLEW FAST [get_ports {DDR3_DQ[12]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[12]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[12]}]
set_property PACKAGE_PIN P5 [get_ports {DDR3_DQ[12]}]

# PadFunction: IO_L17P_T2_34
set_property SLEW FAST [get_ports {DDR3_DQ[13]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[13]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[13]}]
set_property PACKAGE_PIN R1 [get_ports {DDR3_DQ[13]}]

# PadFunction: IO_L18P_T2_34
set_property SLEW FAST [get_ports {DDR3_DQ[14]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[14]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[14]}]
set_property PACKAGE_PIN M6 [get_ports {DDR3_DQ[14]}]

# PadFunction: IO_L17N_T2_34
set_property SLEW FAST [get_ports {DDR3_DQ[15]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[15]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[15]}]
set_property PACKAGE_PIN T1 [get_ports {DDR3_DQ[15]}]

# PadFunction: IO_L10P_T1_34
set_property SLEW FAST [get_ports {DDR3_DQ[16]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[16]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[16]}]
set_property PACKAGE_PIN V5 [get_ports {DDR3_DQ[16]}]

# PadFunction: IO_L8N_T1_34
set_property SLEW FAST [get_ports {DDR3_DQ[17]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[17]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[17]}]
set_property PACKAGE_PIN U3 [get_ports {DDR3_DQ[17]}]

# PadFunction: IO_L11P_T1_SRCC_34
set_property SLEW FAST [get_ports {DDR3_DQ[18]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[18]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[18]}]
set_property PACKAGE_PIN R3 [get_ports {DDR3_DQ[18]}]

# PadFunction: IO_L8P_T1_34
set_property SLEW FAST [get_ports {DDR3_DQ[19]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[19]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[19]}]
set_property PACKAGE_PIN U4 [get_ports {DDR3_DQ[19]}]

# PadFunction: IO_L11N_T1_SRCC_34
set_property SLEW FAST [get_ports {DDR3_DQ[20]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[20]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[20]}]
set_property PACKAGE_PIN T3 [get_ports {DDR3_DQ[20]}]

# PadFunction: IO_L7P_T1_34
set_property SLEW FAST [get_ports {DDR3_DQ[21]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[21]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[21]}]
set_property PACKAGE_PIN U1 [get_ports {DDR3_DQ[21]}]

# PadFunction: IO_L12N_T1_MRCC_34
set_property SLEW FAST [get_ports {DDR3_DQ[22]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[22]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[22]}]
set_property PACKAGE_PIN T4 [get_ports {DDR3_DQ[22]}]

# PadFunction: IO_L7N_T1_34
set_property SLEW FAST [get_ports {DDR3_DQ[23]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[23]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[23]}]
set_property PACKAGE_PIN V1 [get_ports {DDR3_DQ[23]}]

# PadFunction: IO_L22N_T3_34
set_property SLEW FAST [get_ports {DDR3_DQ[24]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[24]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[24]}]
set_property PACKAGE_PIN U6 [get_ports {DDR3_DQ[24]}]

# PadFunction: IO_L19P_T3_34
set_property SLEW FAST [get_ports {DDR3_DQ[25]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[25]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[25]}]
set_property PACKAGE_PIN R6 [get_ports {DDR3_DQ[25]}]

# PadFunction: IO_L23N_T3_34
set_property SLEW FAST [get_ports {DDR3_DQ[26]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[26]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[26]}]
set_property PACKAGE_PIN T6 [get_ports {DDR3_DQ[26]}]

# PadFunction: IO_L24N_T3_34
set_property SLEW FAST [get_ports {DDR3_DQ[27]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[27]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[27]}]
set_property PACKAGE_PIN T8 [get_ports {DDR3_DQ[27]}]

# PadFunction: IO_L20N_T3_34
set_property SLEW FAST [get_ports {DDR3_DQ[28]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[28]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[28]}]
set_property PACKAGE_PIN V6 [get_ports {DDR3_DQ[28]}]

# PadFunction: IO_L20P_T3_34
set_property SLEW FAST [get_ports {DDR3_DQ[29]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[29]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[29]}]
set_property PACKAGE_PIN V7 [get_ports {DDR3_DQ[29]}]

# PadFunction: IO_L19N_T3_VREF_34
set_property SLEW FAST [get_ports {DDR3_DQ[30]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[30]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[30]}]
set_property PACKAGE_PIN R5 [get_ports {DDR3_DQ[30]}]

# PadFunction: IO_L22P_T3_34
set_property SLEW FAST [get_ports {DDR3_DQ[31]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQ[31]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[31]}]
set_property PACKAGE_PIN U7 [get_ports {DDR3_DQ[31]}]

# PadFunction: IO_L12N_T1_MRCC_35
set_property SLEW FAST [get_ports {DDR3_ADDR[14]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[14]}]
set_property PACKAGE_PIN D3 [get_ports {DDR3_ADDR[14]}]

# PadFunction: IO_L16N_T2_35
set_property SLEW FAST [get_ports {DDR3_ADDR[13]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[13]}]
set_property PACKAGE_PIN C1 [get_ports {DDR3_ADDR[13]}]

# PadFunction: IO_L1N_T0_AD4N_35
set_property SLEW FAST [get_ports {DDR3_ADDR[12]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[12]}]
set_property PACKAGE_PIN C5 [get_ports {DDR3_ADDR[12]}]

# PadFunction: IO_L14N_T2_SRCC_35
set_property SLEW FAST [get_ports {DDR3_ADDR[11]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[11]}]
set_property PACKAGE_PIN D2 [get_ports {DDR3_ADDR[11]}]

# PadFunction: IO_L20N_T3_35
set_property SLEW FAST [get_ports {DDR3_ADDR[10]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[10]}]
set_property PACKAGE_PIN G3 [get_ports {DDR3_ADDR[10]}]

# PadFunction: IO_L16P_T2_35
set_property SLEW FAST [get_ports {DDR3_ADDR[9]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[9]}]
set_property PACKAGE_PIN C2 [get_ports {DDR3_ADDR[9]}]

# PadFunction: IO_L17N_T2_35
set_property SLEW FAST [get_ports {DDR3_ADDR[8]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[8]}]
set_property PACKAGE_PIN G1 [get_ports {DDR3_ADDR[8]}]

# PadFunction: IO_L5N_T0_AD13N_35
set_property SLEW FAST [get_ports {DDR3_ADDR[7]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[7]}]
set_property PACKAGE_PIN E5 [get_ports {DDR3_ADDR[7]}]

# PadFunction: IO_L15N_T2_DQS_35
set_property SLEW FAST [get_ports {DDR3_ADDR[6]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[6]}]
set_property PACKAGE_PIN G2 [get_ports {DDR3_ADDR[6]}]

# PadFunction: IO_L7N_T1_AD6N_35
set_property SLEW FAST [get_ports {DDR3_ADDR[5]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[5]}]
set_property PACKAGE_PIN B4 [get_ports {DDR3_ADDR[5]}]

# PadFunction: IO_L18P_T2_35
set_property SLEW FAST [get_ports {DDR3_ADDR[4]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[4]}]
set_property PACKAGE_PIN F1 [get_ports {DDR3_ADDR[4]}]

# PadFunction: IO_L8P_T1_AD14P_35
set_property SLEW FAST [get_ports {DDR3_ADDR[3]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[3]}]
set_property PACKAGE_PIN A4 [get_ports {DDR3_ADDR[3]}]

# PadFunction: IO_L5P_T0_AD13P_35
set_property SLEW FAST [get_ports {DDR3_ADDR[2]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[2]}]
set_property PACKAGE_PIN E6 [get_ports {DDR3_ADDR[2]}]

# PadFunction: IO_L2N_T0_AD12N_35
set_property SLEW FAST [get_ports {DDR3_ADDR[1]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[1]}]
set_property PACKAGE_PIN B6 [get_ports {DDR3_ADDR[1]}]

# PadFunction: IO_L20P_T3_35
set_property SLEW FAST [get_ports {DDR3_ADDR[0]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[0]}]
set_property PACKAGE_PIN G4 [get_ports {DDR3_ADDR[0]}]

# PadFunction: IO_L13N_T2_MRCC_35
set_property SLEW FAST [get_ports {DDR3_BA[2]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_BA[2]}]
set_property PACKAGE_PIN F3 [get_ports {DDR3_BA[2]}]

# PadFunction: IO_L14P_T2_SRCC_35
set_property SLEW FAST [get_ports {DDR3_BA[1]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_BA[1]}]
set_property PACKAGE_PIN E2 [get_ports {DDR3_BA[1]}]

# PadFunction: IO_L10P_T1_AD15P_35
set_property SLEW FAST [get_ports {DDR3_BA[0]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_BA[0]}]
set_property PACKAGE_PIN B3 [get_ports {DDR3_BA[0]}]

# PadFunction: IO_L12P_T1_MRCC_35
set_property SLEW FAST [get_ports {DDR3_RAS_N}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_RAS_N}]
set_property PACKAGE_PIN E3 [get_ports {DDR3_RAS_N}]

# PadFunction: IO_L11N_T1_SRCC_35
set_property SLEW FAST [get_ports {DDR3_CAS_N}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_CAS_N}]
set_property PACKAGE_PIN D4 [get_ports {DDR3_CAS_N}]

# PadFunction: IO_L7P_T1_AD6P_35
set_property SLEW FAST [get_ports {DDR3_WE_N}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_WE_N}]
set_property PACKAGE_PIN C4 [get_ports {DDR3_WE_N}]

# PadFunction: IO_L11P_T1_SRCC_35
set_property SLEW FAST [get_ports {DDR3_RST_N}]
set_property IOSTANDARD LVCMOS15 [get_ports {DDR3_RST_N}]
set_property PACKAGE_PIN D5 [get_ports {DDR3_RST_N}]

# PadFunction: IO_L18N_T2_35
set_property SLEW FAST [get_ports {DDR3_CKE}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_CKE}]
set_property PACKAGE_PIN E1 [get_ports {DDR3_CKE}]

# PadFunction: IO_L10N_T1_AD15N_35
set_property SLEW FAST [get_ports {DDR3_ODT}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ODT}]
set_property PACKAGE_PIN B2 [get_ports {DDR3_ODT}]

# PadFunction: IO_L8N_T1_AD14N_35
set_property SLEW FAST [get_ports {DDR3_CS_N}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_CS_N}]
set_property PACKAGE_PIN A3 [get_ports {DDR3_CS_N}]

# PadFunction: IO_L2N_T0_34
set_property SLEW FAST [get_ports {DDR3_DM[0]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DM[0]}]
set_property PACKAGE_PIN L3 [get_ports {DDR3_DM[0]}]

# PadFunction: IO_L16N_T2_34
set_property SLEW FAST [get_ports {DDR3_DM[1]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DM[1]}]
set_property PACKAGE_PIN N4 [get_ports {DDR3_DM[1]}]

# PadFunction: IO_L10N_T1_34
set_property SLEW FAST [get_ports {DDR3_DM[2]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DM[2]}]
set_property PACKAGE_PIN V4 [get_ports {DDR3_DM[2]}]

# PadFunction: IO_L23P_T3_34
set_property SLEW FAST [get_ports {DDR3_DM[3]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DM[3]}]
set_property PACKAGE_PIN R7 [get_ports {DDR3_DM[3]}]

# PadFunction: IO_L3P_T0_DQS_34
set_property SLEW FAST [get_ports {DDR3_DQS_P[0]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQS_P[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_P[0]}]

# PadFunction: IO_L3N_T0_DQS_34
set_property SLEW FAST [get_ports {DDR3_DQS_N[0]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQS_N[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_N[0]}]
set_property PACKAGE_PIN N2 [get_ports {DDR3_DQS_P[0]}]
set_property PACKAGE_PIN N1 [get_ports {DDR3_DQS_N[0]}]

# PadFunction: IO_L15P_T2_DQS_34
set_property SLEW FAST [get_ports {DDR3_DQS_P[1]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQS_P[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_P[1]}]

# PadFunction: IO_L15N_T2_DQS_34
set_property SLEW FAST [get_ports {DDR3_DQS_N[1]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQS_N[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_N[1]}]
set_property PACKAGE_PIN P2 [get_ports {DDR3_DQS_P[1]}]
set_property PACKAGE_PIN R2 [get_ports {DDR3_DQS_N[1]}]

# PadFunction: IO_L9P_T1_DQS_34
set_property SLEW FAST [get_ports {DDR3_DQS_P[2]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQS_P[2]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_P[2]}]

# PadFunction: IO_L9N_T1_DQS_34
set_property SLEW FAST [get_ports {DDR3_DQS_N[2]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQS_N[2]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_N[2]}]
set_property PACKAGE_PIN U2 [get_ports {DDR3_DQS_P[2]}]
set_property PACKAGE_PIN V2 [get_ports {DDR3_DQS_N[2]}]

# PadFunction: IO_L21P_T3_DQS_34
set_property SLEW FAST [get_ports {DDR3_DQS_P[3]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQS_P[3]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_P[3]}]

# PadFunction: IO_L21N_T3_DQS_34
set_property SLEW FAST [get_ports {DDR3_DQS_N[3]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {DDR3_DQS_N[3]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_N[3]}]
set_property PACKAGE_PIN U9 [get_ports {DDR3_DQS_P[3]}]
set_property PACKAGE_PIN V9 [get_ports {DDR3_DQS_N[3]}]

# PadFunction: IO_L9P_T1_DQS_AD7P_35
set_property SLEW FAST [get_ports {DDR3_CK_P}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_CK_P}]

# PadFunction: IO_L9N_T1_DQS_AD7N_35
set_property SLEW FAST [get_ports {DDR3_CK_N}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_CK_N}]
set_property PACKAGE_PIN B1 [get_ports {DDR3_CK_P}]
set_property PACKAGE_PIN A1 [get_ports {DDR3_CK_N}]

set_property INTERNAL_VREF 0.75 [get_iobanks 34]

## Quad SPI Flash
# inout [3:0] QSPI_DQ,
# output QSPI_CS_N
set_property -dict { PACKAGE_PIN K17 IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[0] }];
set_property -dict { PACKAGE_PIN K18 IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[1] }];
set_property -dict { PACKAGE_PIN L14 IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[2] }];
set_property -dict { PACKAGE_PIN M14 IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[3] }];
set_property -dict { PACKAGE_PIN L13 IOSTANDARD LVCMOS33 } [get_ports { QSPI_CS_N }];

set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
