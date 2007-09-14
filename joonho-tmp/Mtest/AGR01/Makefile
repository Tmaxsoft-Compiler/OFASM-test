target = AGR01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp AGR01.asmo libAGR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lAGR01 $(LDFLAGS)

libAGR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ AGR01_interface.cpp

AGR01.asmo: AGR01.asmi
	$(OFASMC) -i AGR01.asmi -o $@

AGR01.asmi: AGR01.asm
	$(OFASMPP) -i AGR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
