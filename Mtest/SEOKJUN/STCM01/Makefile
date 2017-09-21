target = STCM01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp STCM01.asmo libSTCM01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSTCM01 $(LDFLAGS)

libSTCM01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ STCM01_interface.cpp

STCM01.asmo: STCM01.asmi
	$(OFASMC) -i STCM01.asmi -o $@

STCM01.asmi: STCM01.asm
	$(OFASMIF) -i STCM01.json
	$(OFASMPP) -i STCM01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
