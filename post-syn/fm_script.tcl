

########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true
set verification_verify_directly_undriven_output false

set_svf "/home/IC/Projects/System/Syn/SYS_TOP.svf"


set SSLIB "/home/IC/Projects/System/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/Projects/System/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/Projects/System/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

######################### Reference Container ############################

## Read Reference Design Files
read_verilog -container r "/home/IC/Projects/System/RTL/ALU/ALU.v"
read_verilog -container r "/home/IC/Projects/System/RTL/ASYNC_FIFO/ASYNC_FIFO.v"
read_verilog -container r "/home/IC/Projects/System/RTL/ASYNC_FIFO/df_sync.v"
read_verilog -container r "/home/IC/Projects/System/RTL/ASYNC_FIFO/FIFO_MEM_CNTRL.v"
read_verilog -container r "/home/IC/Projects/System/RTL/ASYNC_FIFO/FIFO_RD.v"
read_verilog -container r "/home/IC/Projects/System/RTL/ASYNC_FIFO/FIFO_WR.v"
read_verilog -container r "/home/IC/Projects/System/RTL/CLOCK_DIV/CLK_DIV.v"
read_verilog -container r "/home/IC/Projects/System/RTL/Clock_gating/Clock_gating.v"
read_verilog -container r "/home/IC/Projects/System/RTL/DATA_SYNC/bit_sync.v"
read_verilog -container r "/home/IC/Projects/System/RTL/DATA_SYNC/puls_gen.v"
read_verilog -container r "/home/IC/Projects/System/RTL/DATA_SYNC/DATA_SYNC.v"
read_verilog -container r "/home/IC/Projects/System/RTL/Prescale/Prescale.v"
read_verilog -container r "/home/IC/Projects/System/RTL/PULS_GEN/puls_gen.v"
read_verilog -container r "/home/IC/Projects/System/RTL/REG_FILE/Reg_File.v"
read_verilog -container r "/home/IC/Projects/System/RTL/RST_SYNC/RST_SYNC.v"
read_verilog -container r "/home/IC/Projects/System/RTL/SYS_CTRL/SYS_CTRL.v"
read_verilog -container r "/home/IC/Projects/System/RTL/UART/data_sampling.v"
read_verilog -container r "/home/IC/Projects/System/RTL/UART/deserializer.v"
read_verilog -container r "/home/IC/Projects/System/RTL/UART/edge_bit_counter.v"
read_verilog -container r "/home/IC/Projects/System/RTL/UART/FSM_UART_RX.v"
read_verilog -container r "/home/IC/Projects/System/RTL/UART/FSM_UART_TX.v"
read_verilog -container r "/home/IC/Projects/System/RTL/UART/MUX.v"
read_verilog -container r "/home/IC/Projects/System/RTL/UART/Parity_Calc.v"
read_verilog -container r "/home/IC/Projects/System/RTL/UART/PARITY_CHECK.v"
read_verilog -container r "/home/IC/Projects/System/RTL/UART/serializer.v"
read_verilog -container r "/home/IC/Projects/System/RTL/UART/START_CHECK.v"
read_verilog -container r "/home/IC/Projects/System/RTL/UART/STOP_CHECK.v"
read_verilog -container r "/home/IC/Projects/System/RTL/UART/UART_RX.v"
read_verilog -container r "/home/IC/Projects/System/RTL/UART/UART_TX.v"
read_verilog -container r "/home/IC/Projects/System/RTL/UART/UART.v"
read_verilog -container r "/home/IC/Projects/System/RTL/SYS_TOP.v"


## Read Reference technology libraries
read_db -container r $TTLIB

## set the top Reference Design 
set_reference_design SYS_TOP
set_top SYS_TOP

######################## Implementation Container #########################


## Read Implementation Design Files
read_verilog -netlist -container i "/home/IC/Projects/System/Syn/netlists/SYS_TOP.v"


## Read Implementation technology libraries
read_db -container i $TTLIB

## set the top Implementation Design
set_implementation_design SYS_TOP
set_top SYS_TOP

## matching Compare points
match

## verify
set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


start_gui
