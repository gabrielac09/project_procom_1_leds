vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+C:/AMDDesignTools/2025.2/Vivado/data/rsb/busdef" \
"../../../project_procom_1_leds.srcs/sources_1/new/count.v" \
"../../../project_procom_1_leds.srcs/sources_1/new/shiftreg.v" \
"../../../project_procom_1_leds.srcs/sources_1/new/top.v" \
"../../../project_procom_1_leds.srcs/sim_1/new/tb_top.v" \


vlog -work xil_defaultlib \
"glbl.v"

