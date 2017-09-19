target = LM01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LM01.asmo libLM01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLM01 $(LDFLAGS)

libLM01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LM01_interface.cpp

LM01.asmo: LM01.asmi
	$(OFASMC) -i LM01.asmi -o $@

LM01.asmi: LM01.asm
	$(OFASMPP) -i LM01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
