target = OR01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp OR01.asmo libOR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lOR01 $(LDFLAGS)

libOR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ OR01_interface.cpp

OR01.asmo: OR01.asmi
	$(OFASMC) -i OR01.asmi -o $@

OR01.asmi: OR01.asm
	$(OFASMPP) -i OR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
