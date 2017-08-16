target = MH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp MH01.asmo libMH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMH01 $(LDFLAGS)

libMH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ MH01_interface.cpp

MH01.asmo: MH01.asmi
	$(OFASMC) -i MH01.asmi -o $@

MH01.asmi: MH01.asm
	$(OFASMIF) -i MH01.json
	$(OFASMPP) -i MH01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

