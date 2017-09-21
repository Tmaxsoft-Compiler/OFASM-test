target = TMLL01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp TMLL01.asmo libTMLL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lTMLL01 $(LDFLAGS)

libTMLL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ TMLL01_interface.cpp

TMLL01.asmo: TMLL01.asmi
	$(OFASMC) -i TMLL01.asmi -o $@

TMLL01.asmi: TMLL01.asm
	$(OFASMIF) -i TMLL01.json
	$(OFASMPP) -i TMLL01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
