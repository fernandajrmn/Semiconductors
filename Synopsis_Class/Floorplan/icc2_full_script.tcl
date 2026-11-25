#································································
#           Tecnológico de Monterrey
# Project:  16-bit Counter
# File: 	Physical Synthesis TCL Script
# Author:	Dr. Benito Granados Rojas
# Edition:  Dr. Gustavo Hernández Melgarejo 
#································································


#································································
# -----------------------Libreria y Carpetas---------------------                                 
#································································

set REPORTS_DIR "reports"
set INPUTS_DIR "../synthesis/outputs"
set CONSTRAINTS_DIR "../constraints"
set OUTPUTS_DIR "outputs"
set DESIGN_NAME "aluwreg"

#Mandar a llamar script de configuración de libreria
source scripts/setup.tcl -echo


# No muestres todos los mensajes de error (recomendación de synopsys)
set_msg -limit 1 ZRT-030
suppress_message {TECH-002 TECH-026 TECH-034}
suppress_message {TLUP-011}
suppress_message {ATTR-12}
suppress_message {NDMUI-136}

#Crea la biblioteca "DM_DESIGN_LIBRARY" (biblioteca de blibliotecas)
create_lib -technology $TECH_FILE -ref_libs $NDM_REFERENCE_LIBRARY $NDM_DESIGN_LIBRARY



#································································
# -------------------Configuración del Diseño--------------------                                     
#································································

#Lee el archivo verilog resultante de la síntesis
read_verilog ${INPUTS_DIR}/mapped_aluwreg_gf180nm.v




#································································
# -------------------Configuración del escenario-----------------                                  
#································································

create_corner "typical"

#lee algunos elementos parásitos de los archivos 
read_parasitic_tech -tlup ${TLUPLUS_FILE} -layermap ${MAP_FILE} -name nominal
set_parasitic_parameters -early_spec nominal -late_spec nominal -corner typical

set_process_label "tt"
set_voltage 3.3
set_temperature 25
#redirect -file ./reports/connect_pg.rpt {connect_pg_net -auto -verbose}
create_mode functional
create_scenario -mode "functional" -name "functional_typical" -corner typical
report_pvt

set_msg -limit 1 CSTR-021

#lee las constraints generadas durante la síntesis
read_sdc ${CONSTRAINTS_DIR}/mapped_aluwreg_gf180nm.sdc

#································································
# ----------------------------Floorplan--------------------------                                        
#································································

#Llama al script para realizar el floorplan
source scripts/floorplan.tcl -echo
check_physical_constraints
save_block -as floorplan_done

#································································
# Placement                                        📦 📦 📦
#································································

#source scripts/placement.tcl -echo
#save_block -as placement_done

#································································
# CTS                                               ⌛️  ⌛️  ⌛️
#································································

#source scripts/cts.tcl -echo
#save_block -as cts_done

#································································
# Route                                             🔀 🔀 🔀
#································································

#source scripts/route.tcl -echo
#save_block -as route_done

#································································
# Chip Finish                                       🔍 🔍 🔍
#································································

#source scripts/finish.tcl -echo
#save_block -as finish_done

#································································
# Check Design                                      ✅  ✅  ✅
#································································

#check_legality
#check_routes

#································································
# Write GDSII                                      💾 💾 💾
#································································

#write_gds -library lib_icc2 -design finish_done -units 1000 outputs/${DESIGN_NAME}_finish_done.gds
#write_verilog -exclude {cover_cells well_tap_cells filler_cells end_cap_cells} \
#    outputs/${DESIGN_NAME}_finish_done.v
