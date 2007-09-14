target = SRP01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SRP01.asmo libSRP01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSRP01 $(LDFLAGS)

libSRP01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SRP01_interface.cpp

SRP01.asmo: SRP01.asmi
	$(OFASMC) -i SRP01.asmi -o $@

SRP01.asmi: SRP01.asm
	$(OFASMPP) -i SRP01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./

test:
	./SRP01
