target = STMG01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

OFASMC_FLAGS = -d

all: $(target)

$(target): main.cpp STMG01.asmo libSTMG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSTMG01 $(LDFLAGS)

libSTMG01.so: STMG01_interface.cpp
	g++ -shared -fPIC $(CFLAGS) -o $@ $<

STMG01.asmo: STMG01.asmi
	$(OFASMC) -i $< -o $@

STMG01.asmi: STMG01.asm
	$(OFASMPP) -i $< -o $@

test: $(target)
	@echo '========================================================='
	@echo ' executing STMG'
	@echo '========================================================='
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi
	$(RM) core

install:
	cp *.so ./
