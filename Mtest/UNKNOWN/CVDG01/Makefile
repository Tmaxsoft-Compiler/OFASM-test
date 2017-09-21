target = CVDG01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CVDG01.asmo libCVDG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCVDG01 $(LDFLAGS)

libCVDG01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CVDG01_interface.cpp

CVDG01.asmo: CVDG01.asmi
	$(OFASMC) -i CVDG01.asmi -o $@

CVDG01.asmi: CVDG01.asm
	$(OFASMIF) -i CVDG01.json
	$(OFASMPP) -i CVDG01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
