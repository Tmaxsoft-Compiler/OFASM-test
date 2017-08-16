target = STD01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

OFASMC_FLAGS = -d

all: $(target)

$(target): main.cpp STD01.asmo libSTD01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSTD01 $(LDFLAGS)

libSTD01.so: STD01_interface.cpp
	g++ -shared -fPIC $(CFLAGS) -o $@ $<

STD01.asmo: STD01.asmi
	$(OFASMC) -i $< -o $@

STD01.asmi: STD01.asm
	$(OFASMPP) -i $< -o $@

test: $(taget)
	@echo ' testing STD '
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi
	$(RM) core

install:
	cp *.so ./
