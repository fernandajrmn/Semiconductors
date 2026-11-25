#Definir las capas de metal y su dirección 
set_attribute -name routing_direction [get_layer Poly2] -value vertical
set_attribute -name routing_direction [get_layer Metal1] -value horizontal
set_attribute -name routing_direction [get_layer Metal2] -value vertical
set_attribute -name routing_direction [get_layer Metal3] -value horizontal
set_attribute -name routing_direction [get_layer Metal4] -value vertical
set_attribute -name routing_direction [get_layer Metal5] -value horizontal

# Tamaño de celda estándar
set SITE_DEF unit7t
remove_tracks -all


#Algunas separaciones entre los metales (previamente probados)
create_track -layer Metal1 -dir X -coord 0.0 -space 0.56
create_track -layer Metal2 -dir Y -coord 0.0 -space 0.56
create_track -layer Metal3 -dir X -coord 0.0 -space 0.56
create_track -layer Metal4 -dir Y -coord 0.0 -space 0.56
create_track -layer Metal5 -dir X -coord 0.0 -space 0.90
report_tracks


#initialize_floorplan -control_type core -site_def $SITE_DEF \-core_utilization 0.1 -shape R \
#-orientation N -side_ratio {2 1} -core_offset {400} -flip_first_row true -coincident_boundary true

#### Planificación del floorplan basado en el tamaño del "die" (área en micras)
initialize_floorplan \
    -control_type die -side_length {1200 1200} \
    -core_offset {300.14 300.23} -site_def $SITE_DEF

    #1.2mm por lado
    #Offset de 100 micras por lado


set_ignored_layers -min_routing_layer Metal1
set_block_pin_constraints -self -allowed_layers {Metal2 Metal3 Metal4 Metal5}
place_pins -self


create_io_ring -name io_ring -corner_height 355

#### Specify the power pads related to the library cells
set_power_io_constraints \
    -reference_cell {gf180mcu_fd_io__dvdd gf180mcu_fd_io__dvss} \
    -ratio {{4 gf180mcu_fd_io__dvdd} {4 gf180mcu_fd_io__dvss}}
set BOUNDARY_CELL [get_lib_cells *mcu7t5v0__endcap]


set_boundary_cell_rules -left_boundary_cell $BOUNDARY_CELL -right_boundary_cell $BOUNDARY_CELL
compile_targeted_boundary_cells -all_targets

#### This option resolves placement conflics, for example overlaps of cells, problems with align etc
set_app_options -name place.legalize.enable_advanced_legalizer -value true

### Insert tap cells in the current block to form a two-dimensional array structure
set TAP_CELL [get_lib_cells *mcu7t5v0__filltie]
create_tap_cells -lib_cell $TAP_CELL -pattern stagger -distance 39.72

# Mandar llamar el Script Power planning
source scripts/pg.tcl -echo

#set_app_options -name plan.place.place_inside_blocks -value true
set_app_options -name place.coarse.fix_hard_macros -value false
set_app_options -name plan.place.auto_create_blockages -value auto
create_placement -effort medium -floorplan

set_app_options -name plan.pgroute.ignore_signal_route -value true
compile_pg
#
set_app_options -name plan.pins.incremental -value false -block [current_block]
set_app_options -name plan.pins.layer_range -value 2 -block [current_block]
set_app_options -name plan.pins.pin_range -value 10 -block [current_block]
write_floorplan -output ./floorplan -format icc -force -nosplit -include \
    { die_area  rows  tracks  vias  nets  cells  macros  \
pin_guides  pins  route_guides  blockages  voltage_areas  bounds  corridors \
 io_guides  edit_groups  module_boundaries  }
