# ································································
#           Tecnológico de Monterrey
# Project:  16-bit Counter
# File: 	Physical Synthesis Makefile
# Author:	Dr. Benito Granados Rojas
# ································································

# Define variables
ICC2_SCRIPT = scripts/icc2_full_script.tcl

# Default target
clear: clean

imple: implementation

pnr: clean implementation


# Clean target
clean:
	rm -rf  *.log *.svf *.ems *.txt floorplan pgroute_output legalizer_debug_plots lib_icc2 reports/*.rpt outputs/*.* signoff_check_drc_live_run work_dir .graph_data.txt

# Compile target
implementation:
	icc2_shell -f $(ICC2_SCRIPT)
