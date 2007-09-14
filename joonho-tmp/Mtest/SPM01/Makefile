target = SPM01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SPM01.asmo libSPM01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSPM01 $(LDFLAGS)

libSPM01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SPM01_interface.cpp

SPM01.asmo: SPM01.asmi
	$(OFASMC) -i SPM01.asmi -o $@

SPM01.asmi: SPM01.asm
	$(OFASMIF) -i SPM01.json
	$(OFASMPP) -i SPM01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
