# ============================
# Makefile generico - Synopsys
# ============================

TOP   ?= PWM_tb
FILES ?= $(wildcard *.sv)
FSDB  ?= inter.fsdb
RC    ?= signals.rc

.PHONY: syntax compile run verdi clean

# Verificar sintaxis
syntax:
	vlogan -full64 -sverilog -kdb -timescale=1ns/1ps $(FILES)

# Compilar
compile: syntax
	vcs -full64 -sverilog -debug_access+all -kdb -top $(TOP) -o simv

# Verificacion funcional
run: compile
	./simv

# Abrir Verdi
verdi: run
	@if [ -f "$(RC)" ]; then \
		verdi -dbdir simv.daidir -ssf $(FSDB) -sswr $(RC) & \
	else \
		verdi -dbdir simv.daidir -ssf $(FSDB) & \
	fi
# Limpiar
clean:
	rm -rf simv simv.daidir csrc AN.DB ucli.key $(FSDB)