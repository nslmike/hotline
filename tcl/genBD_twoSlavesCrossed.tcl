# This is a generated script based on design: design_1
#
# Though there are limitaions about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
#
# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7vx485tffg1157-1 -force

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design design_1

# Creating design if needed
if { [get_files *.bd] eq "" } {
   puts "INFO: Currently there are no designs in project, so creating one..."
   create_bd_design design_1
}


# Top level instance
current_bd_instance

# Create interface ports
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gmii_rtl:1.0 gmii
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 sys1
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 sys0_clk
set_property CONFIG.FREQ_HZ {200000000} [get_bd_intf_ports /sys0_clk]

# Create ports
set gmii_rstn [ create_bd_port -dir O -type rst gmii_rstn ]
set sys0_rst [ create_bd_port -dir I -type rst sys0_rst ]
set sys1_rstn [ create_bd_port -dir I sys1_rstn ]

# Create instance: mkA4LS_1, and set properties
set mkA4LS_1 [ create_bd_cell -type ip -vlnv atomicrules.com:hotline:mkA4LS:1.0 mkA4LS_1 ]

# Create instance: mkL2HCrt_1, and set properties
set mkL2HCrt_1 [ create_bd_cell -type ip -vlnv atomicrules.com:hotline:mkL2HCrt:1.0 mkL2HCrt_1 ]

# Create instance: mkA4LS_2, and set properties
set mkA4LS_2 [ create_bd_cell -type ip -vlnv atomicrules.com:hotline:mkA4LS:1.0 mkA4LS_2 ]

# Create instance: axi_interconnect_1, and set properties
set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.0 axi_interconnect_1 ]
set_property -dict [ list CONFIG.NUM_SI {1} CONFIG.NUM_MI {2}  ] $axi_interconnect_1

# Create instance: clk_wiz_1, and set properties
set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:4.5 clk_wiz_1 ]
set_property -dict [ list CONFIG.Prim_In_Freq {200.0} CONFIG.Prim_Source {Differential_clock_capable_pin} CONFIG.Reset_Type {ACTIVE_LOW} CONFIG.USE_BOARD_FLOW {false}  ] $clk_wiz_1

# Create interface connections
connect_bd_intf_net -intf_net mkl2hcrt_1_m_axi [get_bd_intf_pins /mkL2HCrt_1/m_axi] [get_bd_intf_pins /axi_interconnect_1/S00_AXI]
connect_bd_intf_net -intf_net axi_interconnect_1_m00_axi [get_bd_intf_pins /axi_interconnect_1/M00_AXI] [get_bd_intf_pins /mkA4LS_2/s_axi]
connect_bd_intf_net -intf_net axi_interconnect_1_m01_axi [get_bd_intf_pins /axi_interconnect_1/M01_AXI] [get_bd_intf_pins /mkA4LS_1/s_axi]
connect_bd_intf_net -intf_net mkl2hcrt_1_gmii [get_bd_intf_ports /gmii] [get_bd_intf_pins /mkL2HCrt_1/gmii]
connect_bd_intf_net -intf_net sys1_1 [get_bd_intf_ports /sys1] [get_bd_intf_pins /mkL2HCrt_1/sys1]
connect_bd_intf_net -intf_net clk_in1_d_1 [get_bd_intf_ports /sys0_clk] [get_bd_intf_pins /clk_wiz_1/CLK_IN1_D]

# Create port connections
connect_bd_net -net mkl2hcrt_1_gmii_rstn [get_bd_ports /gmii_rstn] [get_bd_pins /mkL2HCrt_1/gmii_rstn]
connect_bd_net -net sys0_clk_1 [get_bd_pins /clk_wiz_1/clk_out1] [get_bd_pins /axi_interconnect_1/ACLK] [get_bd_pins /mkA4LS_2/s_axi_aclk] [get_bd_pins /mkA4LS_1/s_axi_aclk] [get_bd_pins /axi_interconnect_1/M00_ACLK] [get_bd_pins /axi_interconnect_1/M01_ACLK]
connect_bd_net -net sys0_rst_1 [get_bd_ports /sys0_rst] [get_bd_pins /axi_interconnect_1/ARESETN] [get_bd_pins /mkA4LS_1/s_axi_aresetn] [get_bd_pins /mkA4LS_2/s_axi_aresetn] [get_bd_pins /axi_interconnect_1/M00_ARESETN] [get_bd_pins /axi_interconnect_1/M01_ARESETN] [get_bd_pins /clk_wiz_1/resetn]
connect_bd_net -net mkl2hcrt_1_m_axi_aclk [get_bd_pins /mkL2HCrt_1/m_axi_aclk] [get_bd_pins /axi_interconnect_1/S00_ACLK]
connect_bd_net -net mkl2hcrt_1_m_axi_aresetn [get_bd_pins /mkL2HCrt_1/m_axi_aresetn] [get_bd_pins /axi_interconnect_1/S00_ARESETN]
connect_bd_net -net sys1_rstn_1 [get_bd_ports /sys1_rstn] [get_bd_pins /mkL2HCrt_1/sys1_rstn]

# Create address segments
create_bd_addr_seg -range 0x1000 -offset 0x10000000 [get_bd_addr_spaces /mkL2HCrt_1/m_axi] [get_bd_addr_segs /mkA4LS_1/s_axi/reg0] SEG1
create_bd_addr_seg -range 0x1000 -offset 0x10010000 [get_bd_addr_spaces /mkL2HCrt_1/m_axi] [get_bd_addr_segs /mkA4LS_2/s_axi/reg0] SEG2

regenerate_bd_layout
save_bd_design