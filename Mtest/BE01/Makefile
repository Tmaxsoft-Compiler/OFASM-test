target = BE01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BE01.asmo libBE01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBE01 $(LDFLAGS)

libBE01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BE01_interface.cpp

BE01.asmo: BE01.asmi
	$(OFASMC) -i BE01.asmi -o $@

BE01.asmi: BE01.asm
	$(OFASMIF) -i BE01.json
	$(OFASMPP) -i BE01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
