target = JNOP01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp JNOP01.asmo libJNOP01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lJNOP01 $(LDFLAGS)

libJNOP01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ JNOP01_interface.cpp

JNOP01.asmo: JNOP01.asmi
	$(OFASMC) -i JNOP01.asmi -o $@

JNOP01.asmi: JNOP01.asm
	$(OFASMIF) -i JNOP01.json
	$(OFASMPP) -i JNOP01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
