

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "ADC" "NUM_INSTANCES" "DEVICE_ID"  "C_ADC_AXI_BASEADDR" "C_ADC_AXI_HIGHADDR"
}
