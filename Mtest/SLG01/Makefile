target = SLG01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SLG01.asmo libSLG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSLG01 $(LDFLAGS)

libSLG01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SLG01_interface.cpp

SLG01.asmo: SLG01.asmi
	$(OFASMC) -i SLG01.asmi -o $@

SLG01.asmi: SLG01.asm
	$(OFASMPP) -i SLG01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
