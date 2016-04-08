## Clock signal
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { sys_clock }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {sys_clock}];

#reset
set_property PACKAGE_PIN J15 [get_ports { reset }];
set_property IOSTANDARD LVCMOS33 [get_ports { reset }];

#set_property PACKAGE_PIN J15 [get_ports { reset_rtl_0 }];
#set_property IOSTANDARD LVCMOS33 [get_ports { reset_rtl_0 }];
#IO_L24N_T3_RS0_15 Sch=sw0
#set_property PACKAGE_PIN L16 [get_ports { reset_rtl }];
#set_property IOSTANDARD LVCMOS33 [get_ports { reset_rtl }];
#IO_L3N_T0_DQS_EMCCLK_14 Sch=sw7

#Switches
#set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { sw[0] }];
#IO_L24N_T3_RS0_15 Sch=sw[0]
#set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }];
#IO_L3N_T0_DQS_EMCCLK_14 Sch=sw[1]
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { sw[0] }];
#IO_L6N_T0_D08_VREF_14 Sch=sw[2]
#set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }];
#IO_L13N_T2_MRCC_14 Sch=sw[3]
#set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { sw[2] }];
#IO_L12N_T1_MRCC_14 Sch=sw[4]
#set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { sw[3] }];
#IO_L7N_T1_D10_14 Sch=sw[5]
#set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { sw[4] }];
#IO_L17N_T2_A13_D29_14 Sch=sw[6]
#set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { sw[5] }];
#IO_L5N_T0_D07_14 Sch=sw[7]/sw[1]
#set_property -dict { PACKAGE_PIN T8    IOSTANDARD LVCMOS18 } [get_ports { sw[6] }];
#IO_L24N_T3_34 Sch=sw[8]
#set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS18 } [get_ports { sw[7] }];
#IO_25_34 Sch=sw[9]
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }];
#IO_L15P_T2_DQS_RDWR_B_14 Sch=sw[10]
set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports { sw[2] }];
#IO_L23P_T3_A03_D19_14 Sch=sw[11]
set_property -dict { PACKAGE_PIN H6    IOSTANDARD LVCMOS33 } [get_ports { sw[3] }];
#IO_L24P_T3_35 Sch=sw[12]
set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { sw[4] }];
#IO_L20P_T3_A08_D24_14 Sch=sw[13]
set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 } [get_ports { sw[5] }];
#IO_L19N_T3_A09_D25_VREF_14 Sch=sw[14]
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { sw[6] }];
#IO_L21P_T3_DQS_14 Sch=sw[15]

# LEDs
set_property PACKAGE_PIN H17 [get_ports {LED[0]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}];
set_property PACKAGE_PIN K15 [get_ports {LED[1]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}];
set_property PACKAGE_PIN J13 [get_ports {LED[2]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}];
set_property PACKAGE_PIN N14 [get_ports {LED[3]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}];
set_property PACKAGE_PIN R18 [get_ports {LED[4]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}];
set_property PACKAGE_PIN V17 [get_ports {LED[5]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[5]}];
set_property PACKAGE_PIN U17 [get_ports {LED[6]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[6]}];
set_property PACKAGE_PIN U16 [get_ports {LED[7]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[7]}];
set_property PACKAGE_PIN V16 [get_ports {LED[8]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[8]}];
set_property PACKAGE_PIN T15 [get_ports {LED[9]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[9]}];
set_property PACKAGE_PIN U14 [get_ports {LED[10]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[10]}];
set_property PACKAGE_PIN T16 [get_ports {LED[11]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[11]}];
set_property PACKAGE_PIN V15 [get_ports {LED[12]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[12]}];
set_property PACKAGE_PIN V14 [get_ports {LED[13]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[13]}];
set_property PACKAGE_PIN V12 [get_ports {LED[14]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[14]}];
set_property PACKAGE_PIN V11 [get_ports {LED[15]}];
set_property IOSTANDARD LVCMOS33 [get_ports {LED[15]}];

#7 segment display
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { seg[0] }];
#IO_L24N_T3_A00_D16_14 Sch=ca
set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { seg[1] }];
#IO_25_14 Sch=cb
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { seg[2] }];
#IO_25_15 Sch=cc
set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports { seg[3] }];
#IO_L17P_T2_A26_15 Sch=cd
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { seg[4] }];
#IO_L13P_T2_MRCC_14 Sch=ce
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { seg[5] }];
#IO_L19P_T3_A10_D26_14 Sch=cf
set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { seg[6] }];
#IO_L4P_T0_D04_14 Sch=cg
set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { dp }];
#IO_L19N_T3_A21_VREF_15 Sch=dp
set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports { an[0] }];
#IO_L23P_T3_FOE_B_15 Sch=an[0]
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { an[1] }];
#IO_L23N_T3_FWE_B_15 Sch=an[1]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { an[2] }];
#IO_L24P_T3_A01_D17_14 Sch=an[2]
set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { an[3] }];
#IO_L19P_T3_A22_15 Sch=an[3]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { an[4] }];
#IO_L8N_T1_D12_14 Sch=an[4]
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { an[5] }];
#IO_L14P_T2_SRCC_14 Sch=an[5]
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { an[6] }];
#IO_L23P_T3_35 Sch=an[6]
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { an[7] }];
#IO_L23N_T3_A02_D18_14 Sch=an[7]

#VGA Connector
set_property -dict { PACKAGE_PIN A3    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_r[0] }]; #IO_L8N_T1_AD14N_35 Sch=vga_r[0]
set_property -dict { PACKAGE_PIN B4    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_r[1] }]; #IO_L7N_T1_AD6N_35 Sch=vga_r[1]
set_property -dict { PACKAGE_PIN C5    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_r[2] }]; #IO_L1N_T0_AD4N_35 Sch=vga_r[2]
set_property -dict { PACKAGE_PIN A4    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_r[3] }]; #IO_L8P_T1_AD14P_35 Sch=vga_r[3]
set_property -dict { PACKAGE_PIN C6    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_g[0] }]; #IO_L1P_T0_AD4P_35 Sch=vga_g[0]
set_property -dict { PACKAGE_PIN A5    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_g[1] }]; #IO_L3N_T0_DQS_AD5N_35 Sch=vga_g[1]
set_property -dict { PACKAGE_PIN B6    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_g[2] }]; #IO_L2N_T0_AD12N_35 Sch=vga_g[2]
set_property -dict { PACKAGE_PIN A6    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_g[3] }]; #IO_L3P_T0_DQS_AD5P_35 Sch=vga_g[3]
set_property -dict { PACKAGE_PIN B7    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_b[0] }]; #IO_L2P_T0_AD12P_35 Sch=vga_b[0]
set_property -dict { PACKAGE_PIN C7    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_b[1] }]; #IO_L4N_T0_35 Sch=vga_b[1]
set_property -dict { PACKAGE_PIN D7    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_b[2] }]; #IO_L6N_T0_VREF_35 Sch=vga_b[2]
set_property -dict { PACKAGE_PIN D8    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_b[3] }]; #IO_L4P_T0_35 Sch=vga_b[3]
set_property -dict { PACKAGE_PIN B11   IOSTANDARD LVCMOS33 } [get_ports { tft_hsync }]; #IO_L4P_T0_15 Sch=vga_hs
set_property -dict { PACKAGE_PIN B12   IOSTANDARD LVCMOS33 } [get_ports { tft_vsync }]; #IO_L3N_T0_DQS_AD1N_15 Sch=vga_vs

##Pmod Header JXADC
#set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33     } [get_ports { high_P] }] #IO_L9N_T1_DQS_AD3N_15 Sch=xa_n[1]
#set_property -dict { PACKAGE_PIN A13   IOSTANDARD LVCMOS33     } [get_ports { low_N }] #IO_L9P_T1_DQS_AD3P_15 Sch=xa_p[1]
#set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVDS     } [get_ports { XA_N[2] }] #IO_L8N_T1_AD10N_15 Sch=xa_n[2]
#set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVDS     } [get_ports { XA_P[2] }] #IO_L8P_T1_AD10P_15 Sch=xa_p[2]
#set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVDS     } [get_ports { XA_N[3] }] #IO_L7N_T1_AD2N_15 Sch=xa_n[3]
#set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVDS     } [get_ports { XA_P[3] }] #IO_L7P_T1_AD2P_15 Sch=xa_p[3]
set_property -dict {PACKAGE_PIN A18 IOSTANDARD LVCMOS33} [get_ports {vauxn11}]
set_property -dict {PACKAGE_PIN B18 IOSTANDARD LVCMOS33} [get_ports {vauxp11}]

##Accelerometer on PMOD JA

set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { SS }]; #IO_L20N_T3_A19_15 Sch=ja[1]
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { MOSI }]; #IO_L21N_T3_DQS_A18_15 Sch=ja[2]
set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { MISO }]; #IO_L21P_T3_DQS_15 Sch=ja[3]
set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { SCLK }]; #IO_L18N_T2_A23_15 Sch=ja[4]

###Pmod Header JB

set_property -dict { PACKAGE_PIN D14   IOSTANDARD LVCMOS33 } [get_ports { JB[0] }];
#IO_L1P_T0_AD0P_15 Sch=jb[1]
set_property -dict { PACKAGE_PIN F16   IOSTANDARD LVCMOS33 } [get_ports { JB[1] }];
#IO_L14N_T2_SRCC_15 Sch=jb[2]
set_property -dict { PACKAGE_PIN G16   IOSTANDARD LVCMOS33 } [get_ports { JB[2] }];
#IO_L13N_T2_MRCC_15 Sch=jb[3]
set_property -dict { PACKAGE_PIN H14   IOSTANDARD LVCMOS33 } [get_ports { JB[3] }];
#IO_L15P_T2_DQS_15 Sch=jb[4]
#set_property -dict { PACKAGE_PIN E16   IOSTANDARD LVCMOS33 } [get_ports { JB[7] }] #IO_L11N_T1_SRCC_15 Sch=jb[7]
#set_property -dict { PACKAGE_PIN F13   IOSTANDARD LVCMOS33 } [get_ports { JB[8] }] #IO_L5P_T0_AD9P_15 Sch=jb[8]
#set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS33 } [get_ports { JB[9] }] #IO_0_15 Sch=jb[9]
#set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { JB[10] }] #IO_L13P_T2_MRCC_15 Sch=jb[10]

##USB-RS232 Interface
set_property -dict { PACKAGE_PIN C4    IOSTANDARD LVCMOS33 } [get_ports { uart_rtl_txd }]
#IO_L7P_T1_AD6P_35 Sch=uart_txd_in
set_property -dict { PACKAGE_PIN D4    IOSTANDARD LVCMOS33 } [get_ports { uart_rtl_rxd }]
#IO_L11N_T1_SRCC_35 Sch=uart_rxd_out


set_property IOSTANDARD LVCMOS33 [get_ports {an[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports { uart_rtl_txd }]
set_property IOSTANDARD LVCMOS33 [get_ports { uart_rtl_rxd }]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]
#set_property IOSTANDARD LVCMOS33 [get_ports vauxn10]
#set_property IOSTANDARD LVCMOS33 [get_ports vauxn3]
set_property IOSTANDARD LVCMOS33 [get_ports dp]
#set_property IOSTANDARD LVCMOS33 [get_ports vauxn2]
#set_property IOSTANDARD LVCMOS33 [get_ports vauxp2]
#set_property IOSTANDARD LVCMOS33 [get_ports vauxp3]
#set_property IOSTANDARD LVCMOS33 [get_ports vauxp10]
set_property LOC XADC_X0Y0 [get_cells XLXI_7/inst]
#set_property PACKAGE_PIN A16 [get_ports vauxn10]
#set_property PACKAGE_PIN B17 [get_ports vauxn2]
#set_property PACKAGE_PIN A14 [get_ports vauxn3]
#set_property PACKAGE_PIN A15 [get_ports vauxp10]
#set_property PACKAGE_PIN B16 [get_ports vauxp2]
#set_property PACKAGE_PIN A13 [get_ports vauxp3]
set_property  IOSTANDARD LVCMOS33 [get_ports { JB[0] }]
set_property IOSTANDARD LVCMOS33 [get_ports { JB[1] }]
set_property  IOSTANDARD LVCMOS33 [get_ports { JB[2] }]
set_property IOSTANDARD LVCMOS33 [get_ports { JB[3] }]