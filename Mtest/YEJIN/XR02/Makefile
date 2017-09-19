target = TEST

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp TEST.asmo libTEST.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lTEST $(LDFLAGS)

libTEST.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ TEST_interface.cpp

TEST.asmo: TEST.asmi
	$(OFASMC) -i TEST.asmi -o $@

TEST.asmi: TEST.asm
	$(OFASMIF) -i TEST.json
	$(OFASMPP) -i TEST.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *./so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

