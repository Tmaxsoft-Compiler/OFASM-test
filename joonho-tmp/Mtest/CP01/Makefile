target = CP01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CP01.asmo libCP01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCP01 $(LDFLAGS)

libCP01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CP01_interface.cpp

CP01.asmo: CP01.asmi
	$(OFASMC) -i CP01.asmi -o $@

CP01.asmi: CP01.asm
	$(OFASMPP) -i CP01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
