target = N03

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp N03.asmo libN03.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lN03 $(LDFLAGS)

libN03.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ N03_interface.cpp

N03.asmo: N03.asmi
	$(OFASMC) -i N03.asmi -o $@

N03.asmi: N03.asm
	$(OFASMIF) -i N03.json
	$(OFASMPP) -i N03.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
