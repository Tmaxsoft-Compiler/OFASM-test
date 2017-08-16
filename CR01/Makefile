target = CR01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CR01.asmo libCR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCR01 $(LDFLAGS)

libCR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CR01_interface.cpp

CR01.asmo: CR01.asmi
	$(OFASMC) -i CR01.asmi -o $@

CR01.asmi: CR01.asm
	$(OFASMPP) -i CR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
