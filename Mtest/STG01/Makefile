target = STG01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

OFASMC_FLAGS = -d

all: $(target)

$(target): main.cpp STG01.asmo libSTG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSTG01 $(LDFLAGS)

libSTG01.so: STG01_interface.cpp
	g++ -shared -fPIC $(CFLAGS) -o $@ $<

STG01.asmo: STG01.asmi
	$(OFASMC) -i $< -o $@

STG01.asmi: STG01.asm
	$(OFASMPP) -i $< -o $@

test: $(taget)
	@echo '========================================================='
	@echo ' executing STG'
	@echo '========================================================='
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi
	$(RM) core

install:
	cp *.so ./
