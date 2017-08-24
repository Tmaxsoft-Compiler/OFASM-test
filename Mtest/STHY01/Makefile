target = STHY01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

OFASMC_FLAGS = -d

all: $(target)

$(target): main.cpp STHY01.asmo libSTHY01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSTHY01 $(LDFLAGS)

libSTHY01.so: STHY01_interface.cpp
	g++ -shared -fPIC $(CFLAGS) -o $@ $<

STHY01.asmo: STHY01.asmi
	$(OFASMC) -i $< -o $@

STHY01.asmi: STHY01.asm
	$(OFASMPP) -i $< -o $@

test: $(taget)
	@echo '========================================================='
	@echo ' executing STHY'
	@echo '========================================================='
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi
	$(RM) core

install:
	cp *.so ./
