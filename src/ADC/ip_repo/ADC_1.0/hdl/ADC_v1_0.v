
`timescale 1 ns / 1 ps

	module ADC_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface ADC_AXI
		parameter integer C_ADC_AXI_DATA_WIDTH	= 32,
		parameter integer C_ADC_AXI_ADDR_WIDTH	= 5
	)
	(
		// Users to add ports here
        input wire vauxp11,
        input wire vauxn11,
        output wire [15:0] LED,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface ADC_AXI
		input wire  adc_axi_aclk,
		input wire  adc_axi_aresetn,
		input wire [C_ADC_AXI_ADDR_WIDTH-1 : 0] adc_axi_awaddr,
		input wire [2 : 0] adc_axi_awprot,
		input wire  adc_axi_awvalid,
		output wire  adc_axi_awready,
		input wire [C_ADC_AXI_DATA_WIDTH-1 : 0] adc_axi_wdata,
		input wire [(C_ADC_AXI_DATA_WIDTH/8)-1 : 0] adc_axi_wstrb,
		input wire  adc_axi_wvalid,
		output wire  adc_axi_wready,
		output wire [1 : 0] adc_axi_bresp,
		output wire  adc_axi_bvalid,
		input wire  adc_axi_bready,
		input wire [C_ADC_AXI_ADDR_WIDTH-1 : 0] adc_axi_araddr,
		input wire [2 : 0] adc_axi_arprot,
		input wire  adc_axi_arvalid,
		output wire  adc_axi_arready,
		output wire [C_ADC_AXI_DATA_WIDTH-1 : 0] adc_axi_rdata,
		output wire [1 : 0] adc_axi_rresp,
		output wire  adc_axi_rvalid,
		input wire  adc_axi_rready
	);
// Instantiation of Axi Bus Interface ADC_AXI
	ADC_v1_0_ADC_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_ADC_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_ADC_AXI_ADDR_WIDTH)
	) ADC_v1_0_ADC_AXI_inst (
		.S_AXI_ACLK(adc_axi_aclk),
		.S_AXI_ARESETN(adc_axi_aresetn),
		.S_AXI_AWADDR(adc_axi_awaddr),
		.S_AXI_AWPROT(adc_axi_awprot),
		.S_AXI_AWVALID(adc_axi_awvalid),
		.S_AXI_AWREADY(adc_axi_awready),
		.S_AXI_WDATA(adc_axi_wdata),
		.S_AXI_WSTRB(adc_axi_wstrb),
		.S_AXI_WVALID(adc_axi_wvalid),
		.S_AXI_WREADY(adc_axi_wready),
		.S_AXI_BRESP(adc_axi_bresp),
		.S_AXI_BVALID(adc_axi_bvalid),
		.S_AXI_BREADY(adc_axi_bready),
		.S_AXI_ARADDR(adc_axi_araddr),
		.S_AXI_ARPROT(adc_axi_arprot),
		.S_AXI_ARVALID(adc_axi_arvalid),
		.S_AXI_ARREADY(adc_axi_arready),
		.S_AXI_RDATA(adc_axi_rdata),
		.S_AXI_RRESP(adc_axi_rresp),
		.S_AXI_RVALID(adc_axi_rvalid),
		.S_AXI_RREADY(adc_axi_rready),
		.vauxp11(vauxp11),
        .vauxn11(vauxn11),
        .LED(LED)
	);

	// Add user logic here

	// User logic ends

	endmodule
