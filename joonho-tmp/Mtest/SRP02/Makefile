target = SRP02

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SRP02.asmo libSRP02.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSRP02 $(LDFLAGS)

libSRP02.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SRP02_interface.cpp

SRP02.asmo: SRP02.asmi
	$(OFASMC) -i SRP02.asmi -o $@

SRP02.asmi: SRP02.asm
	$(OFASMPP) -i SRP02.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./

test:
	./SRP02
