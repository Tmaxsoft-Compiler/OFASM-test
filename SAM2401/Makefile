target = SAM2401

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SAM2401.asmo libSAM2401.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSAM2401 $(LDFLAGS)

libSAM2401.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SAM2401_interface.cpp

SAM2401.asmo: SAM2401.asmi
	$(OFASMC) -i SAM2401.asmi -o $@

SAM2401.asmi: SAM2401.asm
	$(OFASMIF) -i SAM2401.json
	$(OFASMPP) -i SAM2401.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
