# ===============================================
# Makefile generico - Synopsys VCS + Verdi
# Packages -> Interfaces -> Modulos/Testbenches
# ===============================================

TOP       ?= ram_tb
FILES     ?= $(wildcard *.sv)
FSDB      ?= inter.fsdb
RC        ?= signals.rc
TIMESCALE ?= 1ns/1ps

# Detecta el contenido por la declaracion (no depende del nombre del archivo).
# Para dependencias entre varios packages, se puede indicar PACKAGES en orden manual.
PACKAGES   ?= $(shell grep -lE '^[[:space:]]*package[[:space:]]' $(FILES) 2>/dev/null)
INTERFACES ?= $(shell grep -lE '^[[:space:]]*interface[[:space:]]' $(filter-out $(PACKAGES),$(FILES)) 2>/dev/null)
OTHERS      = $(filter-out $(PACKAGES) $(INTERFACES),$(FILES))
ORDERED     = $(PACKAGES) $(INTERFACES) $(OTHERS)

.PHONY: order syntax compile run verdi clean

# Revisar el orden de compilacion
order:
	@echo "Packages:   $(PACKAGES)"
	@echo "Interfaces: $(INTERFACES)"
	@echo "Restantes:  $(OTHERS)"

# Verificar sintaxis: aplica el mismo timescale a archivos sin directiva explicita
syntax:
	vlogan -full64 -sverilog -kdb -timescale=$(TIMESCALE) $(ORDERED)

# Compilar con acceso a debug y cambios de memoria (para FSDB de arreglos)
compile: syntax
	vcs -full64 -sverilog -debug_access+all +memcbk -kdb -top $(TOP) -o simv

# Simular: el testbench debe generar el archivo FSDB
run: compile
	./simv

# Abrir Verdi; si ya existe signals.rc, recupera esa configuracion
verdi: run
	@if [ -f "$(RC)" ]; then \
		verdi -dbdir simv.daidir -ssf $(FSDB) -sswr $(RC) & \
	else \
		verdi -dbdir simv.daidir -ssf $(FSDB) & \
	fi

# No borra signals.rc ni los archivos fuente
clean:
	rm -rf simv simv.daidir csrc AN.DB ucli.key $(FSDB)
