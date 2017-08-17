target = JAS01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp JAS01.asmo libJAS01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lJAS01 $(LDFLAGS)

libJAS01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ JAS01_interface.cpp

JAS01.asmo: JAS01.asmi
	$(OFASMC) -i JAS01.asmi -o $@

JAS01.asmi: JAS01.asm
	$(OFASMIF) -i JAS01.json
	$(OFASMPP) -i JAS01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
