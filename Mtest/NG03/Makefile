target = NG03

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp NG03.asmo libNG03.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lNG03 $(LDFLAGS)

libNG03.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ NG03_interface.cpp

NG03.asmo: NG03.asmi
	$(OFASMC) -i NG03.asmi -o $@

NG03.asmi: NG03.asm
	$(OFASMIF) -i NG03.json
	$(OFASMPP) -i NG03.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
