target = NC01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp NC01.asmo libNC01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lNC01 $(LDFLAGS)

libNC01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ NC01_interface.cpp

NC01.asmo: NC01.asmi
	$(OFASMC) -i NC01.asmi -o $@

NC01.asmi: NC01.asm
	$(OFASMIF) -i NC01.json
	$(OFASMPP) -i NC01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

