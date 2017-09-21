target = IPK01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

OFASMC_FLAGS = -d

all: $(target)

$(target): main.cpp IPK01.asmo libIPK01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lIPK01 $(LDFLAGS)

libIPK01.so: IPK01_interface.cpp
	g++ -shared -fPIC $(CFLAGS) -o $@ $<

IPK01.asmo: IPK01.asmi
	$(OFASMC) -i $< -o $@

IPK01.asmi: IPK01.asm
	$(OFASMPP) -i $< -o $@

test: $(taget)
	@echo '========================================================='
	@echo ' executing IPK'
	@echo '========================================================='
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi
	$(RM) core

install:
	cp *.so ./
