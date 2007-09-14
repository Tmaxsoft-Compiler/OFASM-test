target = JCT01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp JCT01.asmo libJCT01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lJCT01 $(LDFLAGS)

libJCT01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ JCT01_interface.cpp

JCT01.asmo: JCT01.asmi
	$(OFASMC) -i JCT01.asmi -o $@

JCT01.asmi: JCT01.asm
	$(OFASMIF) -i JCT01.json
	$(OFASMPP) -i JCT01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
