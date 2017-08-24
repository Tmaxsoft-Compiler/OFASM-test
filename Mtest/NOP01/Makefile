target = NOP01
shared_object = libNOP01.so

ASMOBJ = NOP01.asmo
OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

OFASMC_FLAGS = -d

all: $(target)

$(target) : main.cpp $(ASMOBJ) $(shared_object)
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lNOP01 $(LDFLAGS)

libNOP01.so: NOP01_interface.cpp
	g++ -shared -fPIC $(CFLAGS) -o $@ $<

%.asmo : %.asmi
	$(OFASMC) -i $< -o $@

%.asmi : %.asm
	$(OFASMPP) -i $< -o $@

test: $(target)
	@echo ' testing STD '
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi
	$(RM) core

install:
	cp *.so ./
