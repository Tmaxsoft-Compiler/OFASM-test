target = X03

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp X03.asmo libX03.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lX03 $(LDFLAGS)

libX03.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ X03_interface.cpp

X03.asmo: X03.asmi
	$(OFASMC) -i X03.asmi -o $@

X03.asmi: X03.asm
	$(OFASMIF) -i X03.json
	$(OFASMPP) -i X03.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
