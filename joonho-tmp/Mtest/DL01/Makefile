target = DL01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp DL01.asmo libDL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lDL01 $(LDFLAGS)

libDL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ DL01_interface.cpp

DL01.asmo: DL01.asmi
	$(OFASMC) -i DL01.asmi -o $@

DL01.asmi: DL01.asm
	$(OFASMPP) -i DL01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
