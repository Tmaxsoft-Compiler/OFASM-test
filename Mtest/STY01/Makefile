target = STY01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

OFASMC_FLAGS = -d

all: $(target)

$(target): main.cpp STY01.asmo libSTY01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSTY01 $(LDFLAGS)

libSTY01.so: STY01_interface.cpp
	g++ -shared -fPIC $(CFLAGS) -o $@ $<

STY01.asmo: STY01.asmi
	$(OFASMC) -i $< -o $@

STY01.asmi: STY01.asm
	$(OFASMPP) -i $< -o $@

test: $(taget)
	@echo '========================================================='
	@echo ' executing STY'
	@echo '========================================================='
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi
	$(RM) core

install:
	cp *.so ./
