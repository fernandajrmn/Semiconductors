
# ============================
# Makefile - ALU
# ============================

TOP = ALU_top_tb
FILES = Operations.sv Mux.sv Register.sv ALU_Top.sv testbench.sv

.PHONY: syntax compile run verdi clean

# Verificar sintaxis
syntax:
	vlogan -full64 -sverilog -timescale=1ns/1ps $(FILES)

# Compilar con VCS
compile:
	vcs -full64 -sverilog -timescale=1ns/1ps -debug_access+all -kdb $(FILES) -top $(TOP) -o simv

# Verificacion funcional
run: compile
	./simv

# Abrir Verdi
verdi: run
	verdi -ssf inter.fsdb &

# Limpiar
clean:
	rm -rf simv simv.daidir csrc AN.DB inter.fsdb ucli.key
