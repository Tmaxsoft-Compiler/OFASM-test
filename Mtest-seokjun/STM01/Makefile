target = STM01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp STM01.asmo libSTM01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSTM01 $(LDFLAGS)

libSTM01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ STM01_interface.cpp

STM01.asmo: STM01.asmi
	$(OFASMC) -i STM01.asmi -o $@

STM01.asmi: STM01.asm
	$(OFASMIF) -i STM01.json
	$(OFASMPP) -i STM01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
