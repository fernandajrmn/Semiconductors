# Configuracion de los elementos de diseño físico de gf180nm

# La carpeta en donde está el PDK--Especificación de bibliotecas
set DESIGN_REF_PATH "/srv/shared_directory/gf180mcuD"
set NDM_REFERENCE_LIBRARY [list \
    "${DESIGN_REF_PATH}/libs/ndm/gf180mcu_fd_sc_mcu7t5v0.ndm" \
    "${DESIGN_REF_PATH}/libs/ndm/gf180mcu_fd_io_1P5M_1TM.ndm"]

set TECH_FILE "${DESIGN_REF_PATH}/libs/tf/gf180mcu_1P5M_1TM.tf"
set MAP_FILE "${DESIGN_REF_PATH}/libs/tluplus/gf180mcu_1P5M_11K.layermap"
set TLUPLUS_FILE "${DESIGN_REF_PATH}/libs/tluplus/gf180mcu_1P5M_11K_nom.nxtgrd"

set POWER_NET "VDD"
set POWER_PORT "VDD"
set GROUND_NET "VSS"
set GROUND_PORT "VSS"

set MIN_ROUTING_LAYER "Metal2"
set MAX_ROUTING_LAYER "Metal5"

lappend search_path $NDM_REFERENCE_LIBRARY ${DESIGN_REF_PATH}/libs.ref/gf180mcu_fd_sc_mcu7t5v0/db

set_host_options -max_cores 16
set NDM_DESIGN_LIBRARY lib_icc2


#set NDM_REFERENCE_LIBRARY [list \
 #   "${DESIGN_REF_PATH}/libs/ndm/gf180mcu_fd_sc_mcu7t5v0.ndm" \
 #   "${DESIGN_REF_PATH}/libs/ndm/gf180mcu_fd_io_1P5M_1TM.ndm"]