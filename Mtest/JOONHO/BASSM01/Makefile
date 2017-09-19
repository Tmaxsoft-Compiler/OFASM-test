target = BASSM01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BASSM01.asmo libBASSM01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBASSM01 $(LDFLAGS)

libBASSM01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BASSM01_interface.cpp

BASSM01.asmo: BASSM01.asmi
	$(OFASMC) -i BASSM01.asmi -o $@

BASSM01.asmi: BASSM01.asm
	$(OFASMIF) -i BASSM01.json
	$(OFASMPP) -i BASSM01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
