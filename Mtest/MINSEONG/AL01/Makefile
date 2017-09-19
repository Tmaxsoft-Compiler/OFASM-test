target = AL01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp AL01.asmo libAL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lAL01 $(LDFLAGS)

libAL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ AL01_interface.cpp

AL01.asmo: AL01.asmi
	$(OFASMC) -i AL01.asmi -o $@

AL01.asmi: AL01.asm
	$(OFASMIF) -i AL01.json
	$(OFASMPP) -i AL01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result

