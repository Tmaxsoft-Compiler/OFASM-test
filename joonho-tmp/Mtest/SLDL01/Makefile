target = SLDL01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SLDL01.asmo libSLDL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSLDL01 $(LDFLAGS)

libSLDL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SLDL01_interface.cpp

SLDL01.asmo: SLDL01.asmi
	$(OFASMC) -i SLDL01.asmi -o $@

SLDL01.asmi: SLDL01.asm
	$(OFASMIF) -i SLDL01.json
	$(OFASMPP) -i SLDL01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

