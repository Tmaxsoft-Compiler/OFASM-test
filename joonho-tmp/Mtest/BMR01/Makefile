target = BMR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BMR01.asmo libBMR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBMR01 $(LDFLAGS)

libBMR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BMR01_interface.cpp

BMR01.asmo: BMR01.asmi
	$(OFASMC) -i BMR01.asmi -o $@

BMR01.asmi: BMR01.asm
	$(OFASMIF) -i BMR01.json
	$(OFASMPP) -i BMR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
