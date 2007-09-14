target = SRAG01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SRAG01.asmo libSRAG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSRAG01 $(LDFLAGS)

libSRAG01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SRAG01_interface.cpp

SRAG01.asmo: SRAG01.asmi
	$(OFASMC) -i SRAG01.asmi -o $@

SRAG01.asmi: SRAG01.asm
	$(OFASMPP) -i SRAG01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
