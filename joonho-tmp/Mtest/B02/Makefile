target = B02

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp B02.asmo libB02.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lB02 $(LDFLAGS)

libB02.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ B02_interface.cpp

B02.asmo: B02.asmi
	$(OFASMC) -i B02.asmi -o $@

B02.asmi: B02.asm
	$(OFASMIF) -i B02.json
	$(OFASMPP) -i B02.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
