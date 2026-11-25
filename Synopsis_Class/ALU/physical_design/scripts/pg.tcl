#->
#### Remove all grid configurations
remove_pg_strategies -all
remove_pg_patterns -all
remove_pg_regions -all
remove_pg_via_master_rules -all
remove_pg_strategy_via_rules -all
remove_routes -net_types {power ground} -ring -stripe -macro_pin_connect -lib_cell_pin_connect

#### Create and connect power-ground nets
create_net -power VDD
create_net -ground VSS

########### Create a power ring around the boundary design ############33

### Create a new via master rule for the power and ground network
###  Contact code is defined in .tf
set_pg_via_master_rule via_master_mesh_top -contact_code Via4Array

##### Create a power ground (PG) ring pattern
create_pg_ring_pattern main_ring_pattern -nets {VDD VSS} \
    -horizontal_layer Metal5 -horizontal_width 5 -horizontal_spacing 2 \
    -vertical_layer Metal4 -vertical_width 5 -vertical_spacing 2 \
    -via_rule {{intersection: adjacent} {via_master: via_master_mesh_top}}

#### Set the core area as the PG region
set_pg_strategy main_ring_strategy -core -pattern {{pattern: main_ring_pattern} \
 {nets: {VDD VSS}} {offset: {2 2}}}

#### Generate and compile the PG network with the specified strategies
compile_pg -strategies main_ring_strategy

########### Configure I/O ring  #################

##### Create a macro power ground connection pattern
create_pg_macro_conn_pattern io_to_ring -pin_conn_type scattered_pin \
    -pin_layers {Metal2} -layers {Metal2 Metal2} -width 9.5

#### Add to pattern the pg_cell created on RTL top
set_pg_strategy s_io_to_ring -core -pattern {{name: io_to_ring}{nets: {VDD VSS}}}

#### Create the PG related to standard cells, using Metal1 as PG connections
create_pg_std_cell_conn_pattern M1_rail -layers {Metal1}
set_pg_strategy M1_rail_strategy -core -pattern {{name: M1_rail} {nets: VDD VSS}} \
    -blockage {{nets:VDD VSS} {macros: all}}

########### Create global mesh  #################

### Create a PG mesh pattern
create_pg_mesh_pattern mesh_pattern_top -via_rule {{intersection: adjacent} \
{via_master: via_master_mesh_top}} \
    -layers { \
        {{horizontal_layer: Metal5 } {width: 3} {pitch: 90} {spacing: interleaving} } \
        {{vertical_layer:   Metal4 } {width: 3} {pitch: 90} {spacing: interleaving} } \
}

### Mesh around the core
set_pg_strategy mesh_strategy_top -core -pattern {{pattern: mesh_pattern_top} \
{nets: {VDD VSS}}} -extension {stop: outermost_ring}

### Create a new via master rule for the PG network related to standard cells
set_pg_via_master_rule via_to_stdcells -via_array_dimension {3 1}

#### How to connect all vias on standard cell rail
set_pg_strategy_via_rule mesh_to_stdrail -via_rule { \
    { \
      {{strategies: s_io_to_ring} {layers: {Metal2 Metal5 Metal4}}} \
      {{existing: ring} {layers: {Metal5 Metal4}}} \
      {via_master: {Via3Array Via4Array}} \
    } \
    { \
      {{strategies: mesh_strategy_top} {layers: Metal4}} \
      {{strategies: M1_rail_strategy} {layers: Metal1}} \
      {via_master: via_to_stdcells} \
    } \
    { \
      {{strategies: mesh_strategy_top}} \
      {{existing: ring} {layers: { Metal5 Metal4 }} } \
      {via_master:  via_master_mesh_top} \
    } \
    {{intersection: undefined} {via_master: NIL}} \
}


connect_pg_net -net VDD [get_pins -hierarchical "*/VDD"]
connect_pg_net -net VSS [get_pins -hierarchical "*/VSS"]

connect_pg_net -net VDD [get_pins -hierarchical "*/VDD"]
connect_pg_net -net VSS [get_pins -hierarchical "*/VSS"]

###### Compile al PG (global mesh, I/O ring)
compile_pg -strategies {M1_rail_strategy s_io_to_ring mesh_strategy_top} -via_rule mesh_to_stdrail


#################################################################################################
#################################################################################################
