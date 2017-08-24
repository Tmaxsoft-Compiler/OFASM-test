target = IPM01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

OFASMC_FLAGS = -d

all: $(target)

$(target): main.cpp IPM01.asmo libIPM01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lIPM01 $(LDFLAGS)

libIPM01.so: IPM01_interface.cpp
	g++ -shared -fPIC $(CFLAGS) -o $@ $<

IPM01.asmo: IPM01.asmi
	$(OFASMC) -i $< -o $@

IPM01.asmi: IPM01.asm
	$(OFASMPP) -i $< -o $@

test: $(taget)
	@echo '========================================================='
	@echo ' executing IPM'
	@echo '========================================================='
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi
	$(RM) core

install:
	cp *.so ./
