target = SRDA01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SRDA01.asmo libSRDA01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSRDA01 $(LDFLAGS)

libSRDA01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SRDA01_interface.cpp

SRDA01.asmo: SRDA01.asmi
	$(OFASMC) -i SRDA01.asmi -o $@

SRDA01.asmi: SRDA01.asm
	$(OFASMIF) -i SRDA01.json
	$(OFASMPP) -i SRDA01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

