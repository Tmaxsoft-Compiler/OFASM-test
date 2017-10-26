target = $(notdir $(CURDIR))
result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp $(target).asmo lib$(target).so
		   g++ $(CFLAGS) -o $@ main.cpp -L./ -l$(target) $(LDFLAGS)

lib$(target).so:
		   g++ -shared -fPIC $(CFLAGS) -o $@ $(target)_interface.cpp

$(target).asmo: $(target).asmi
		   $(OFASMC) -i $(target).asmi -o $@

$(target).asmi: $(target).asm
		   $(OFASMIF) -i $(target).json
		   $(OFASMPP) -i $(target).asm -o $@

clean:
		   $(RM) $(target) *.so *.asmo *.asmi $(result) *_interface.cpp

install:
		   cp *.so ./

test:
		   @./$(target) > OUT
		   @diff $(result) $(result).result
