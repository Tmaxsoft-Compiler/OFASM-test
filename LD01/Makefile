target = LD01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

OFASMC_FLAGS = -d

all: $(target)

$(target): main.cpp LD01.asmo libLD01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLD01 $(LDFLAGS) 

libLD01.so: LD01_interface.cpp
	g++ -shared -fPIC $(CFLAGS) -o $@ $<

LD01.asmo: LD01.asmi
	$(OFASMC) -i $< -o $@

LD01.asmi: LD01.asm
	$(OFASMPP) -i $< -o $@

test: $(taget)
	@echo ' testing STD '
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi
	$(RM) core

install:
	cp *.so ./
