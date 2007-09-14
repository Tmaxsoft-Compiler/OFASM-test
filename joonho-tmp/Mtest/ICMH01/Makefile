target = ICMH01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp ICMH01.asmo libICMH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lICMH01 $(LDFLAGS)

libICMH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ ICMH01_interface.cpp

ICMH01.asmo: ICMH01.asmi
	$(OFASMC) -i ICMH01.asmi -o $@

ICMH01.asmi: ICMH01.asm
	$(OFASMPP) -i ICMH01.asm -o $@

test: $(target)
	@echo 'testing ICMH'
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
