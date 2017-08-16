target = DLR01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp DLR01.asmo libDLR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lDLR01 $(LDFLAGS)

libDLR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ DLR01_interface.cpp

DLR01.asmo: DLR01.asmi
	$(OFASMC) -i DLR01.asmi -o $@

DLR01.asmi: DLR01.asm
	$(OFASMPP) -i DLR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
