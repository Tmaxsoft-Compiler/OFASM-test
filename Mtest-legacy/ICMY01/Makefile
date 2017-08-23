target = ICMY01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp ICMY01.asmo libICMY01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lICMY01 $(LDFLAGS)

libICMY01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ ICMY01_interface.cpp

ICMY01.asmo: ICMY01.asmi
	$(OFASMC) -i ICMY01.asmi -o $@

ICMY01.asmi: ICMY01.asm
	$(OFASMPP) -i ICMY01.asm -o $@

test: $(target)
	@echo 'testing ICMY'
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi
	$(RM) core

install:
	cp *.so ./
