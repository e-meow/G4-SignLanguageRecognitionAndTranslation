

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "ACCEL" "NUM_INSTANCES" "DEVICE_ID"  "C_ACCEL_AXI_BASEADDR" "C_ACCEL_AXI_HIGHADDR"
}
