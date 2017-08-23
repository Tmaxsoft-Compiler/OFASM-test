target = BP01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BP01.asmo libBP01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBP01 $(LDFLAGS)

libBP01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BP01_interface.cpp

BP01.asmo: BP01.asmi
	$(OFASMC) -i BP01.asmi -o $@

BP01.asmi: BP01.asm
	$(OFASMIF) -i BP01.json
	$(OFASMPP) -i BP01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

