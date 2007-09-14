target = MVIY01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

OFASMC_FLAGS = -d

all: $(target)

$(target): main.cpp MVIY01.asmo libMVIY01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMVIY01 $(LDFLAGS)

libMVIY01.so: MVIY01_interface.cpp
	g++ -shared -fPIC $(CFLAGS) -o $@ $<

MVIY01.asmo: MVIY01.asmi
	$(OFASMC) -i $< -o $@

MVIY01.asmi: MVIY01.asm
	$(OFASMPP) -i $< -o $@

test: $(taget)
	@echo '========================================================='
	@echo ' executing MVIY'
	@echo '========================================================='
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi
	$(RM) core

install:
	cp *.so ./
