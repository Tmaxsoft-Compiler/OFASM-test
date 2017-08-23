target = CLCL01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLCL01.asmo libCLCL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLCL01 $(LDFLAGS)

libCLCL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLCL01_interface.cpp

CLCL01.asmo: CLCL01.asmi
	$(OFASMC) -i CLCL01.asmi -o $@

CLCL01.asmi: CLCL01.asm
	$(OFASMPP) -i CLCL01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
