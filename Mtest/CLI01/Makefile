target = CLI01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLI01.asmo libCLI01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLI01 $(LDFLAGS)

libCLI01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLI01_interface.cpp

CLI01.asmo: CLI01.asmi
	$(OFASMC) -i CLI01.asmi -o $@

CLI01.asmi: CLI01.asm
	$(OFASMPP) -i CLI01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
