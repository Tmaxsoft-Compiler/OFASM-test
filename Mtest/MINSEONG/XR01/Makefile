target = XR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp XR01.asmo libXR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lXR01 $(LDFLAGS)

libXR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ XR01_interface.cpp

XR01.asmo: XR01.asmi
	$(OFASMC) -i XR01.asmi -o $@

XR01.asmi: XR01.asm
	$(OFASMIF) -i XR01.json
	$(OFASMPP) -i XR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result

