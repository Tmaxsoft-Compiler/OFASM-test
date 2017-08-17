target = KLMD01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
OPENSSL_LIB = -lssl -lcrypto
CFLAGS += -g

OFASMC_FLAGS = -d

all: $(target)

$(target): main.cpp KLMD01.asmo libKLMD01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lKLMD01 $(LDFLAGS) $(OPENSSL_LIB)

libKLMD01.so: KLMD01_interface.cpp
	g++ -shared -fPIC $(CFLAGS) -o $@ $<

KLMD01.asmo: KLMD01.asmi
	$(OFASMC) -i $< -o $@

KLMD01.asmi: KLMD01.asm
	$(OFASMPP) -i $< -o $@

test: $(taget)
	@echo '========================================================='
	@echo ' executing KLMD'
	@echo '========================================================='
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi
	$(RM) core

install:
	cp *.so ./
