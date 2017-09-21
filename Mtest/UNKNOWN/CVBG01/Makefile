target = CVBG01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CVBG01.asmo libCVBG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCVBG01 $(LDFLAGS)

libCVBG01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CVBG01_interface.cpp

CVBG01.asmo: CVBG01.asmi
	$(OFASMC) -i CVBG01.asmi -o $@

CVBG01.asmi: CVBG01.asm
	$(OFASMIF) -i CVBG01.json
	$(OFASMPP) -i CVBG01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
