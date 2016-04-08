

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "HEX" "NUM_INSTANCES" "DEVICE_ID"  "C_HEX_AXI_BASEADDR" "C_HEX_AXI_HIGHADDR"
}
