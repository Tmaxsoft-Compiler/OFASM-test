target = DLG01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp DLG01.asmo libDLG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lDLG01 $(LDFLAGS)

libDLG01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ DLG01_interface.cpp

DLG01.asmo: DLG01.asmi
	$(OFASMC) -i DLG01.asmi -o $@

DLG01.asmi: DLG01.asm
	$(OFASMPP) -i DLG01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
