target = TMLH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp TMLH01.asmo libTMLH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lTMLH01 $(LDFLAGS)

libTMLH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ TMLH01_interface.cpp

TMLH01.asmo: TMLH01.asmi
	$(OFASMC) -i TMLH01.asmi -o $@

TMLH01.asmi: TMLH01.asm
	$(OFASMIF) -i TMLH01.json
	$(OFASMPP) -i TMLH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
