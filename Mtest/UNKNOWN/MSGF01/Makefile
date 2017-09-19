target = MSGF01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp MSGF01.asmo libMSGF01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMSGF01 $(LDFLAGS)

libMSGF01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ MSGF01_interface.cpp

MSGF01.asmo: MSGF01.asmi
	$(OFASMC) -i MSGF01.asmi -o $@

MSGF01.asmi: MSGF01.asm
	$(OFASMPP) -i MSGF01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
