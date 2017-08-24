target = NIHH01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp NIHH01.asmo libNIHH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lNIHH01 $(LDFLAGS)

libNIHH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ NIHH01_interface.cpp

NIHH01.asmo: NIHH01.asmi
	$(OFASMC) -i NIHH01.asmi -o $@

NIHH01.asmi: NIHH01.asm
	$(OFASMPP) -i NIHH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
