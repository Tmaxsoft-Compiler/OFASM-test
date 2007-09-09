target = BAL01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BAL01.asmo libBAL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBAL01 $(LDFLAGS)

libBAL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BAL01_interface.cpp

BAL01.asmo: BAL01.asmi
	$(OFASMC) -i BAL01.asmi -o $@

BAL01.asmi: BAL01.asm
	$(OFASMIF) -i BAL01.json
	$(OFASMPP) -i BAL01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
