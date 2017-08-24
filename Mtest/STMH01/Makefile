target = STMH01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

OFASMC_FLAGS = -d

all: $(target)

$(target): main.cpp STMH01.asmo libSTMH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSTMH01 $(LDFLAGS)

libSTMH01.so: STMH01_interface.cpp
	g++ -shared -fPIC $(CFLAGS) -o $@ $<

STMH01.asmo: STMH01.asmi
	$(OFASMC) -i $< -o $@

STMH01.asmi: STMH01.asm
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
