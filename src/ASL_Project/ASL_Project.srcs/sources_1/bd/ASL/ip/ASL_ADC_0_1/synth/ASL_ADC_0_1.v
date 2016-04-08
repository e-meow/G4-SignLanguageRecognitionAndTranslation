// (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:ADC:1.0
// IP Revision: 1

(* X_CORE_INFO = "ADC_v1_0,Vivado 2015.1" *)
(* CHECK_LICENSE_TYPE = "ASL_ADC_0_1,ADC_v1_0,{}" *)
(* CORE_GENERATION_INFO = "ASL_ADC_0_1,ADC_v1_0,{x_ipProduct=Vivado 2015.1,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=ADC,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_ADC_AXI_DATA_WIDTH=32,C_ADC_AXI_ADDR_WIDTH=5}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module ASL_ADC_0_1 (
  vauxp11,
  vauxn11,
  LED,
  adc_axi_awaddr,
  adc_axi_awprot,
  adc_axi_awvalid,
  adc_axi_awready,
  adc_axi_wdata,
  adc_axi_wstrb,
  adc_axi_wvalid,
  adc_axi_wready,
  adc_axi_bresp,
  adc_axi_bvalid,
  adc_axi_bready,
  adc_axi_araddr,
  adc_axi_arprot,
  adc_axi_arvalid,
  adc_axi_arready,
  adc_axi_rdata,
  adc_axi_rresp,
  adc_axi_rvalid,
  adc_axi_rready,
  adc_axi_aclk,
  adc_axi_aresetn
);

input wire vauxp11;
input wire vauxn11;
output wire [15 : 0] LED;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI AWADDR" *)
input wire [4 : 0] adc_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI AWPROT" *)
input wire [2 : 0] adc_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI AWVALID" *)
input wire adc_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI AWREADY" *)
output wire adc_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI WDATA" *)
input wire [31 : 0] adc_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI WSTRB" *)
input wire [3 : 0] adc_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI WVALID" *)
input wire adc_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI WREADY" *)
output wire adc_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI BRESP" *)
output wire [1 : 0] adc_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI BVALID" *)
output wire adc_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI BREADY" *)
input wire adc_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI ARADDR" *)
input wire [4 : 0] adc_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI ARPROT" *)
input wire [2 : 0] adc_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI ARVALID" *)
input wire adc_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI ARREADY" *)
output wire adc_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI RDATA" *)
output wire [31 : 0] adc_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI RRESP" *)
output wire [1 : 0] adc_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI RVALID" *)
output wire adc_axi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 ADC_AXI RREADY" *)
input wire adc_axi_rready;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_AXI_CLK CLK" *)
input wire adc_axi_aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ADC_AXI_RST RST" *)
input wire adc_axi_aresetn;

  ADC_v1_0 #(
    .C_ADC_AXI_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_ADC_AXI_ADDR_WIDTH(5)  // Width of S_AXI address bus
  ) inst (
    .vauxp11(vauxp11),
    .vauxn11(vauxn11),
    .LED(LED),
    .adc_axi_awaddr(adc_axi_awaddr),
    .adc_axi_awprot(adc_axi_awprot),
    .adc_axi_awvalid(adc_axi_awvalid),
    .adc_axi_awready(adc_axi_awready),
    .adc_axi_wdata(adc_axi_wdata),
    .adc_axi_wstrb(adc_axi_wstrb),
    .adc_axi_wvalid(adc_axi_wvalid),
    .adc_axi_wready(adc_axi_wready),
    .adc_axi_bresp(adc_axi_bresp),
    .adc_axi_bvalid(adc_axi_bvalid),
    .adc_axi_bready(adc_axi_bready),
    .adc_axi_araddr(adc_axi_araddr),
    .adc_axi_arprot(adc_axi_arprot),
    .adc_axi_arvalid(adc_axi_arvalid),
    .adc_axi_arready(adc_axi_arready),
    .adc_axi_rdata(adc_axi_rdata),
    .adc_axi_rresp(adc_axi_rresp),
    .adc_axi_rvalid(adc_axi_rvalid),
    .adc_axi_rready(adc_axi_rready),
    .adc_axi_aclk(adc_axi_aclk),
    .adc_axi_aresetn(adc_axi_aresetn)
  );
endmodule
