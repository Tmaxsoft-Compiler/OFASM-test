target = C01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp C01.asmo libC01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lC01 $(LDFLAGS)

libC01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ C01_interface.cpp

C01.asmo: C01.asmi
	$(OFASMC) -i C01.asmi -o $@

C01.asmi: C01.asm
	$(OFASMPP) -i C01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
