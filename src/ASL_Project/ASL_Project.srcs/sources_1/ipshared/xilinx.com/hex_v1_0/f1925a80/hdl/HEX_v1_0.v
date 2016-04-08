
`timescale 1 ns / 1 ps

	module HEX_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface HEX_AXI
		parameter integer C_HEX_AXI_DATA_WIDTH	= 32,
		parameter integer C_HEX_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
        output wire [7:0] an,
        output wire dp,
        output wire [6:0] seg,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface HEX_AXI
		input wire  hex_axi_aclk,
		input wire  hex_axi_aresetn,
		input wire [C_HEX_AXI_ADDR_WIDTH-1 : 0] hex_axi_awaddr,
		input wire [2 : 0] hex_axi_awprot,
		input wire  hex_axi_awvalid,
		output wire  hex_axi_awready,
		input wire [C_HEX_AXI_DATA_WIDTH-1 : 0] hex_axi_wdata,
		input wire [(C_HEX_AXI_DATA_WIDTH/8)-1 : 0] hex_axi_wstrb,
		input wire  hex_axi_wvalid,
		output wire  hex_axi_wready,
		output wire [1 : 0] hex_axi_bresp,
		output wire  hex_axi_bvalid,
		input wire  hex_axi_bready,
		input wire [C_HEX_AXI_ADDR_WIDTH-1 : 0] hex_axi_araddr,
		input wire [2 : 0] hex_axi_arprot,
		input wire  hex_axi_arvalid,
		output wire  hex_axi_arready,
		output wire [C_HEX_AXI_DATA_WIDTH-1 : 0] hex_axi_rdata,
		output wire [1 : 0] hex_axi_rresp,
		output wire  hex_axi_rvalid,
		input wire  hex_axi_rready
	);
// Instantiation of Axi Bus Interface HEX_AXI
	HEX_v1_0_HEX_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_HEX_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_HEX_AXI_ADDR_WIDTH)
	) HEX_v1_0_HEX_AXI_inst (
		.S_AXI_ACLK(hex_axi_aclk),
		.S_AXI_ARESETN(hex_axi_aresetn),
		.S_AXI_AWADDR(hex_axi_awaddr),
		.S_AXI_AWPROT(hex_axi_awprot),
		.S_AXI_AWVALID(hex_axi_awvalid),
		.S_AXI_AWREADY(hex_axi_awready),
		.S_AXI_WDATA(hex_axi_wdata),
		.S_AXI_WSTRB(hex_axi_wstrb),
		.S_AXI_WVALID(hex_axi_wvalid),
		.S_AXI_WREADY(hex_axi_wready),
		.S_AXI_BRESP(hex_axi_bresp),
		.S_AXI_BVALID(hex_axi_bvalid),
		.S_AXI_BREADY(hex_axi_bready),
		.S_AXI_ARADDR(hex_axi_araddr),
		.S_AXI_ARPROT(hex_axi_arprot),
		.S_AXI_ARVALID(hex_axi_arvalid),
		.S_AXI_ARREADY(hex_axi_arready),
		.S_AXI_RDATA(hex_axi_rdata),
		.S_AXI_RRESP(hex_axi_rresp),
		.S_AXI_RVALID(hex_axi_rvalid),
		.S_AXI_RREADY(hex_axi_rready),
		.an(an),
        .dp(dp),
        .seg(seg) 
	);

	// Add user logic here

	// User logic ends

	endmodule
