target = NG01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp NG01.asmo libNG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lNG01 $(LDFLAGS)

libNG01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ NG01_interface.cpp

NG01.asmo: NG01.asmi
	$(OFASMC) -i NG01.asmi -o $@

NG01.asmi: NG01.asm
	$(OFASMPP) -i NG01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
