target = ML01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp ML01.asmo libML01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lML01 $(LDFLAGS)

libML01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ ML01_interface.cpp

ML01.asmo: ML01.asmi
	$(OFASMC) -i ML01.asmi -o $@

ML01.asmi: ML01.asm
	$(OFASMPP) -i ML01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
