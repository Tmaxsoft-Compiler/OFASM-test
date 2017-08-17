target = MVST01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

OFASMC_FLAGS = -d

all: $(target)

$(target): main.cpp MVST01.asmo libMVST01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMVST01 $(LDFLAGS)

libMVST01.so: MVST01_interface.cpp
	g++ -shared -fPIC $(CFLAGS) -o $@ $<

MVST01.asmo: MVST01.asmi
	$(OFASMC) -i $< -o $@

MVST01.asmi: MVST01.asm
	$(OFASMPP) -i $< -o $@

test: $(taget)
	@echo '========================================================='
	@echo ' executing MVST'
	@echo '========================================================='
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi
	$(RM) core

install:
	cp *.so ./
