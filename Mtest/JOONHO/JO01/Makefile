target = JO01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp JO01.asmo libJO01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lJO01 $(LDFLAGS)

libJO01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ JO01_interface.cpp

JO01.asmo: JO01.asmi
	$(OFASMC) -i JO01.asmi -o $@

JO01.asmi: JO01.asm
	$(OFASMIF) -i JO01.json
	$(OFASMPP) -i JO01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
