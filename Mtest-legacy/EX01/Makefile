target = EX01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp EX01.asmo libEX01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lEX01 $(LDFLAGS)

libEX01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ EX01_interface.cpp

EX01.asmo: EX01.asmi
	$(OFASMC) -i EX01.asmi -o $@

EX01.asmi: EX01.asm
	$(OFASMPP) -i EX01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
