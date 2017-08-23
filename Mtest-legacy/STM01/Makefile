target = STM01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp STM01.asmo libSTM01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSTM01 $(LDFLAGS)

libSTM01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ STM01_interface.cpp

STM01.asmo: STM01.asmi
	$(OFASMC) -i STM01.asmi -o $@

STM01.asmi: STM01.asm
	$(OFASMPP) -i STM01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
