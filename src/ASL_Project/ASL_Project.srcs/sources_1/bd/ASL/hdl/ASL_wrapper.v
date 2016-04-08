//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.1 (win64) Build 1215546 Mon Apr 27 19:22:08 MDT 2015
//Date        : Mon Apr 04 11:37:48 2016
//Host        : Emily-PC running 64-bit major release  (build 9200)
//Command     : generate_target ASL_wrapper.bd
//Design      : ASL_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ASL_wrapper
   (DDR2_addr,
    DDR2_ba,
    DDR2_cas_n,
    DDR2_ck_n,
    DDR2_ck_p,
    DDR2_cke,
    DDR2_cs_n,
    DDR2_dm,
    DDR2_dq,
    DDR2_dqs_n,
    DDR2_dqs_p,
    DDR2_odt,
    DDR2_ras_n,
    DDR2_we_n,
    JB,
    LED,
    MISO,
    MOSI,
    SCLK,
    SS,
    an,
    dp,
    reset,
    seg,
    sw,
    sys_clock,
    tft_hsync,
    tft_vga_b,
    tft_vga_g,
    tft_vga_r,
    tft_vsync,
    uart_rtl_rxd,
    uart_rtl_txd,
    vauxn11,
    vauxp11);
  output [12:0]DDR2_addr;
  output [2:0]DDR2_ba;
  output DDR2_cas_n;
  output [0:0]DDR2_ck_n;
  output [0:0]DDR2_ck_p;
  output [0:0]DDR2_cke;
  output [0:0]DDR2_cs_n;
  output [1:0]DDR2_dm;
  inout [15:0]DDR2_dq;
  inout [1:0]DDR2_dqs_n;
  inout [1:0]DDR2_dqs_p;
  output [0:0]DDR2_odt;
  output DDR2_ras_n;
  output DDR2_we_n;
  input [3:0]JB;
  output [15:0]LED;
  input MISO;
  output MOSI;
  output SCLK;
  output SS;
  output [7:0]an;
  output dp;
  input reset;
  output [6:0]seg;
  input [6:0]sw;
  input sys_clock;
  output tft_hsync;
  output [3:0]tft_vga_b;
  output [3:0]tft_vga_g;
  output [3:0]tft_vga_r;
  output tft_vsync;
  input uart_rtl_rxd;
  output uart_rtl_txd;
  input vauxn11;
  input vauxp11;

  wire [12:0]DDR2_addr;
  wire [2:0]DDR2_ba;
  wire DDR2_cas_n;
  wire [0:0]DDR2_ck_n;
  wire [0:0]DDR2_ck_p;
  wire [0:0]DDR2_cke;
  wire [0:0]DDR2_cs_n;
  wire [1:0]DDR2_dm;
  wire [15:0]DDR2_dq;
  wire [1:0]DDR2_dqs_n;
  wire [1:0]DDR2_dqs_p;
  wire [0:0]DDR2_odt;
  wire DDR2_ras_n;
  wire DDR2_we_n;
  wire [3:0]JB;
  wire [15:0]LED;
  wire MISO;
  wire MOSI;
  wire SCLK;
  wire SS;
  wire [7:0]an;
  wire dp;
  wire reset;
  wire [6:0]seg;
  wire [6:0]sw;
  wire sys_clock;
  wire tft_hsync;
  wire [3:0]tft_vga_b;
  wire [3:0]tft_vga_g;
  wire [3:0]tft_vga_r;
  wire tft_vsync;
  wire uart_rtl_rxd;
  wire uart_rtl_txd;
  wire vauxn11;
  wire vauxp11;

  ASL ASL_i
       (.DDR2_addr(DDR2_addr),
        .DDR2_ba(DDR2_ba),
        .DDR2_cas_n(DDR2_cas_n),
        .DDR2_ck_n(DDR2_ck_n),
        .DDR2_ck_p(DDR2_ck_p),
        .DDR2_cke(DDR2_cke),
        .DDR2_cs_n(DDR2_cs_n),
        .DDR2_dm(DDR2_dm),
        .DDR2_dq(DDR2_dq),
        .DDR2_dqs_n(DDR2_dqs_n),
        .DDR2_dqs_p(DDR2_dqs_p),
        .DDR2_odt(DDR2_odt),
        .DDR2_ras_n(DDR2_ras_n),
        .DDR2_we_n(DDR2_we_n),
        .JB(JB),
        .LED(LED),
        .MISO(MISO),
        .MOSI(MOSI),
        .SCLK(SCLK),
        .SS(SS),
        .an(an),
        .dp(dp),
        .reset(reset),
        .seg(seg),
        .sw(sw),
        .sys_clock(sys_clock),
        .tft_hsync(tft_hsync),
        .tft_vga_b(tft_vga_b),
        .tft_vga_g(tft_vga_g),
        .tft_vga_r(tft_vga_r),
        .tft_vsync(tft_vsync),
        .uart_rtl_rxd(uart_rtl_rxd),
        .uart_rtl_txd(uart_rtl_txd),
        .vauxn11(vauxn11),
        .vauxp11(vauxp11));
endmodule
