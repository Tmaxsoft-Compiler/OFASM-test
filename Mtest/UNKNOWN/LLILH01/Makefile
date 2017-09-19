target = LLILH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LLILH01.asmo libLLILH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLLILH01 $(LDFLAGS)

libLLILH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LLILH01_interface.cpp

LLILH01.asmo: LLILH01.asmi
	$(OFASMC) -i LLILH01.asmi -o $@

LLILH01.asmi: LLILH01.asm
	$(OFASMIF) -i LLILH01.json
	$(OFASMPP) -i LLILH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
