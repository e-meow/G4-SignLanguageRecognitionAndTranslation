

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "ASL" "NUM_INSTANCES" "DEVICE_ID"  "C_ASL_AXI_BASEADDR" "C_ASL_AXI_HIGHADDR"
}
