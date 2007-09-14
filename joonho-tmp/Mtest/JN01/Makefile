target = JN01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp JN01.asmo libJN01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lJN01 $(LDFLAGS)

libJN01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ JN01_interface.cpp

JN01.asmo: JN01.asmi
	$(OFASMC) -i JN01.asmi -o $@

JN01.asmi: JN01.asm
	$(OFASMIF) -i JN01.json
	$(OFASMPP) -i JN01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
