#================================================================
#        Búsqueda de archivos y configuración de biblioteca
#================================================================

set DESIGN "ALU_Top"
set PDK "gf180nm"


set_app_var search_path "$search_path . ../rtl /srv/shared_directory/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/db"
#se establecen la carpeta rtl (un nivel arriba) y la carpeta compartida donde esta la librería


set_app_var target_library "gf180mcu_fd_sc_mcu7t5v0__tt_025C_1v80.db"
#selección de libreria con valores típicos

set_app_var link_library "* $target_library"




#================================================================
#                    Lectura de archivos RTL
#================================================================


#analyze -format sverilog {top.v mux4_registered.v mux4.v register_bank.v}

analyze -format sverilog ${DESIGN}.sv
elaborate ALU_Top
link

#================================================================
#                Configuración de restricciones
#================================================================

set clk_val 100
create_clock -period [expr $clk_val] [get_ports clk]
set_clock_uncertainty -setup [expr $clk_val*0.1] [get_clocks clk]
set_clock_transition -max [expr $clk_val*0.1] [get_clocks clk]
set_clock_latency -source -max [expr $clk_val*0.05] [get_clocks clk]
set_clock_latency -max [expr $clk_val*0.03] [get_clocks clk]
set_input_delay -max [expr $clk_val*0.05] -clock clk [remove_from_collection [all_inputs] clk]
set_input_delay -min [expr $clk_val*0.01] -clock clk [remove_from_collection [all_inputs] clk]
set_output_delay -max [expr $clk_val*0.05] -clock clk [all_outputs]
set_load -max [expr {40.0 / 1000.0}] [all_outputs]
set_input_transition -min [expr $clk_val*0.01] [all_inputs]
set_input_transition -max [expr $clk_val*0.1] [all_inputs]

#================================================================
#                     Reportes pre-compilación
#================================================================

report_clock > reports/report_clock_${PDK}.rpt
report_clock -skew > reports/report_clock_${PDK}.rpt
report_port -verbose > reports/report_port_${PDK}.rpt
check_timing
check_design

#================================================================
#                           Síntesis
#================================================================

compile_ultra -no_autoungroup -incremental
optimize_netlist -area

#================================================================
#                    Reportes post-compilación
#================================================================

report_area > reports/report_area_${PDK}.rpt
report_qor > reports/report_qor_${PDK}.rpt
report_constraint -all_violators > reports/report_constraints_${PDK}.rpt
report_timing > reports/report_timing_${PDK}.rpt
report_power > reports/report_power_${PDK}.rpt

#================================================================
#                       Guardar diseño
#================================================================

write_file -format verilog -hier -out outputs/mapped_${DESIGN}_${PDK}.v
write_file -format ddc -hier -out outputs/mapped_${DESIGN}_${PDK}.ddc

write_sdf -version 2.1 ../constraints/mapped_${DESIGN}_${PDK}.sdf
write_sdc -version 2.2 ../constraints/mapped_${DESIGN}_${PDK}.sdc


check_design

return
