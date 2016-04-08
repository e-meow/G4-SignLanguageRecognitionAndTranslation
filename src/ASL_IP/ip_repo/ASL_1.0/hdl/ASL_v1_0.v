
`timescale 1 ns / 1 ps

	module ASL_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface ASL_AXI
		parameter integer C_ASL_AXI_DATA_WIDTH	= 32,
		parameter integer C_ASL_AXI_ADDR_WIDTH	= 5
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface ASL_AXI
		input wire  asl_axi_aclk,
		input wire  asl_axi_aresetn,
		input wire [C_ASL_AXI_ADDR_WIDTH-1 : 0] asl_axi_awaddr,
		input wire [2 : 0] asl_axi_awprot,
		input wire  asl_axi_awvalid,
		output wire  asl_axi_awready,
		input wire [C_ASL_AXI_DATA_WIDTH-1 : 0] asl_axi_wdata,
		input wire [(C_ASL_AXI_DATA_WIDTH/8)-1 : 0] asl_axi_wstrb,
		input wire  asl_axi_wvalid,
		output wire  asl_axi_wready,
		output wire [1 : 0] asl_axi_bresp,
		output wire  asl_axi_bvalid,
		input wire  asl_axi_bready,
		input wire [C_ASL_AXI_ADDR_WIDTH-1 : 0] asl_axi_araddr,
		input wire [2 : 0] asl_axi_arprot,
		input wire  asl_axi_arvalid,
		output wire  asl_axi_arready,
		output wire [C_ASL_AXI_DATA_WIDTH-1 : 0] asl_axi_rdata,
		output wire [1 : 0] asl_axi_rresp,
		output wire  asl_axi_rvalid,
		input wire  asl_axi_rready
	);
// Instantiation of Axi Bus Interface ASL_AXI
	ASL_v1_0_ASL_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_ASL_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_ASL_AXI_ADDR_WIDTH)
	) ASL_v1_0_ASL_AXI_inst (
		.S_AXI_ACLK(asl_axi_aclk),
		.S_AXI_ARESETN(asl_axi_aresetn),
		.S_AXI_AWADDR(asl_axi_awaddr),
		.S_AXI_AWPROT(asl_axi_awprot),
		.S_AXI_AWVALID(asl_axi_awvalid),
		.S_AXI_AWREADY(asl_axi_awready),
		.S_AXI_WDATA(asl_axi_wdata),
		.S_AXI_WSTRB(asl_axi_wstrb),
		.S_AXI_WVALID(asl_axi_wvalid),
		.S_AXI_WREADY(asl_axi_wready),
		.S_AXI_BRESP(asl_axi_bresp),
		.S_AXI_BVALID(asl_axi_bvalid),
		.S_AXI_BREADY(asl_axi_bready),
		.S_AXI_ARADDR(asl_axi_araddr),
		.S_AXI_ARPROT(asl_axi_arprot),
		.S_AXI_ARVALID(asl_axi_arvalid),
		.S_AXI_ARREADY(asl_axi_arready),
		.S_AXI_RDATA(asl_axi_rdata),
		.S_AXI_RRESP(asl_axi_rresp),
		.S_AXI_RVALID(asl_axi_rvalid),
		.S_AXI_RREADY(asl_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule