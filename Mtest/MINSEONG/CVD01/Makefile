target = CVD01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CVD01.asmo libCVD01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCVD01 $(LDFLAGS)

libCVD01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CVD01_interface.cpp

CVD01.asmo: CVD01.asmi
	$(OFASMC) -i CVD01.asmi -o $@

CVD01.asmi: CVD01.asm
	$(OFASMIF) -i CVD01.json
	$(OFASMPP) -i CVD01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

