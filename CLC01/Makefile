target = CLC01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLC01.asmo libCLC01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLC01 $(LDFLAGS)

libCLC01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLC01_interface.cpp

CLC01.asmo: CLC01.asmi
	$(OFASMC) -i CLC01.asmi -o $@

CLC01.asmi: CLC01.asm
	$(OFASMPP) -i CLC01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
