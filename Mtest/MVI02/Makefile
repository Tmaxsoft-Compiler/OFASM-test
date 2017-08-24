target = MVI01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp MVI01.asmo libMVI01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMVI01 $(LDFLAGS)

libMVI01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ MVI01_interface.cpp

MVI01.asmo: MVI01.asmi
	$(OFASMC) -i MVI01.asmi -o $@

MVI01.asmi: MVI01.asm
	$(OFASMIF) -i MVI01.json
	$(OFASMPP) -i MVI01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
