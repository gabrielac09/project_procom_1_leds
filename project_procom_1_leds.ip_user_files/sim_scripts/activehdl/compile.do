transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/rsb/busdef" -l xil_defaultlib \
"../../../project_procom_1_leds.srcs/sources_1/new/count.v" \
"../../../project_procom_1_leds.srcs/sources_1/new/shiftreg.v" \
"../../../project_procom_1_leds.srcs/sources_1/new/top.v" \
"../../../project_procom_1_leds.srcs/sim_1/new/tb_top.v" \


vlog -work xil_defaultlib \
"glbl.v"

