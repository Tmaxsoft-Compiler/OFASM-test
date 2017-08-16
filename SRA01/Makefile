target = SRA01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SRA01.asmo libSRA01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSRA01 $(LDFLAGS)

libSRA01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SRA01_interface.cpp

SRA01.asmo: SRA01.asmi
	$(OFASMC) -i SRA01.asmi -o $@

SRA01.asmi: SRA01.asm
	$(OFASMIF) -i SRA01.json
	$(OFASMPP) -i SRA01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

