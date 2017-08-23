target = SVC13

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SVC13.asmo libSVC13.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSVC13 $(LDFLAGS)

libSVC13.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SVC13_interface.cpp

SVC13.asmo: SVC13.asmi
	$(OFASMC) -i SVC13.asmi -o $@

SVC13.asmi: SVC13.asm
	$(OFASMPP) -i SVC13.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
