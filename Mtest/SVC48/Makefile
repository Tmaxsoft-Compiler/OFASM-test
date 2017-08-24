target = SVC48

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SVC48.asmo libSVC48.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSVC48 $(LDFLAGS)

libSVC48.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SVC48_interface.cpp

SVC48.asmo: SVC48.asmi
	$(OFASMC) -i SVC48.asmi -o $@

SVC48.asmi: SVC48.asm
	$(OFASMPP) -i SVC48.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
