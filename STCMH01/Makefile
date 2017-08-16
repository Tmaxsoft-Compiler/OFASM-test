target = STCMH01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp STCMH01.asmo libSTCMH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSTCMH01 $(LDFLAGS)

libSTCMH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ STCMH01_interface.cpp

STCMH01.asmo: STCMH01.asmi
	$(OFASMC) -i STCMH01.asmi -o $@

STCMH01.asmi: STCMH01.asm
	$(OFASMPP) -i STCMH01.asm -o $@

test: 
	@./$(target)
	$<

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
