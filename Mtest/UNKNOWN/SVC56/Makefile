target = SVC56

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SVC56.asmo libSVC56.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSVC56 $(LDFLAGS)

libSVC56.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SVC56_interface.cpp

SVC56.asmo: SVC56.asmi
	$(OFASMC) -i SVC56.asmi -o $@

SVC56.asmi: SVC56.asm
	$(OFASMPP) -i SVC56.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
