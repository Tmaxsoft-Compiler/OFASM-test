target = BR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BR01.asmo libBR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBR01 $(LDFLAGS)

libBR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BR01_interface.cpp

BR01.asmo: BR01.asmi
	$(OFASMC) -i BR01.asmi -o $@

BR01.asmi: BR01.asm
	$(OFASMIF) -i BR01.json
	$(OFASMPP) -i BR01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
