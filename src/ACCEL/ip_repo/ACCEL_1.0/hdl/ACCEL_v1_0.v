
`timescale 1 ns / 1 ps

	module ACCEL_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface ACCEL_AXI
		parameter integer C_ACCEL_AXI_DATA_WIDTH	= 32,
		parameter integer C_ACCEL_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
        output wire SCLK, //     : out STD_LOGIC;
        output wire MOSI, //      : out STD_LOGIC;
        input wire MISO, //      : in STD_LOGIC;
        output wire SS, //        : out STD_LOGIC;
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface ACCEL_AXI
		input wire  accel_axi_aclk,
		input wire  accel_axi_aresetn,
		input wire [C_ACCEL_AXI_ADDR_WIDTH-1 : 0] accel_axi_awaddr,
		input wire [2 : 0] accel_axi_awprot,
		input wire  accel_axi_awvalid,
		output wire  accel_axi_awready,
		input wire [C_ACCEL_AXI_DATA_WIDTH-1 : 0] accel_axi_wdata,
		input wire [(C_ACCEL_AXI_DATA_WIDTH/8)-1 : 0] accel_axi_wstrb,
		input wire  accel_axi_wvalid,
		output wire  accel_axi_wready,
		output wire [1 : 0] accel_axi_bresp,
		output wire  accel_axi_bvalid,
		input wire  accel_axi_bready,
		input wire [C_ACCEL_AXI_ADDR_WIDTH-1 : 0] accel_axi_araddr,
		input wire [2 : 0] accel_axi_arprot,
		input wire  accel_axi_arvalid,
		output wire  accel_axi_arready,
		output wire [C_ACCEL_AXI_DATA_WIDTH-1 : 0] accel_axi_rdata,
		output wire [1 : 0] accel_axi_rresp,
		output wire  accel_axi_rvalid,
		input wire  accel_axi_rready
	);
// Instantiation of Axi Bus Interface ACCEL_AXI
	ACCEL_v1_0_ACCEL_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_ACCEL_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_ACCEL_AXI_ADDR_WIDTH)
	) ACCEL_v1_0_ACCEL_AXI_inst (
		.S_AXI_ACLK(accel_axi_aclk),
		.S_AXI_ARESETN(accel_axi_aresetn),
		.S_AXI_AWADDR(accel_axi_awaddr),
		.S_AXI_AWPROT(accel_axi_awprot),
		.S_AXI_AWVALID(accel_axi_awvalid),
		.S_AXI_AWREADY(accel_axi_awready),
		.S_AXI_WDATA(accel_axi_wdata),
		.S_AXI_WSTRB(accel_axi_wstrb),
		.S_AXI_WVALID(accel_axi_wvalid),
		.S_AXI_WREADY(accel_axi_wready),
		.S_AXI_BRESP(accel_axi_bresp),
		.S_AXI_BVALID(accel_axi_bvalid),
		.S_AXI_BREADY(accel_axi_bready),
		.S_AXI_ARADDR(accel_axi_araddr),
		.S_AXI_ARPROT(accel_axi_arprot),
		.S_AXI_ARVALID(accel_axi_arvalid),
		.S_AXI_ARREADY(accel_axi_arready),
		.S_AXI_RDATA(accel_axi_rdata),
		.S_AXI_RRESP(accel_axi_rresp),
		.S_AXI_RVALID(accel_axi_rvalid),
		.S_AXI_RREADY(accel_axi_rready),
	    .SCLK (SCLK), //     : out STD_LOGIC;
        .MOSI (MOSI), //      : out STD_LOGIC;
        .MISO (MISO), //      : in STD_LOGIC;
        .SS (SS) //        : out STD_LOGIC;
	);

	// Add user logic here

	// User logic ends

	endmodule
