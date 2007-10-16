target = GET01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp GET01.asmo libGET01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lGET01 $(LDFLAGS)

libGET01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ GET01_OFASM_VM_ENTRY.cpp

GET01.asmo: GET01.asmi
	$(OFASMC) -i GET01.asmi -o $@

GET01.asmi: GET01.asm
	$(OFASMIF) -i GET01.json
	$(OFASMPP) -i GET01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_OFASM_VM_ENTRY.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
