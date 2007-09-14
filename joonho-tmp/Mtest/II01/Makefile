target = II01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

OFASMC_FLAGS = -d

all: $(target)

$(target): main.cpp II01.asmo libII01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lII01 $(LDFLAGS)

libII01.so: II01_interface.cpp
	g++ -shared -fPIC $(CFLAGS) -o $@ $<

II01.asmo: II01.asmi
	$(OFASMC) -i $< -o $@

II01.asmi: II01.asm
	$(OFASMPP) -i $< -o $@

test: $(taget)
	@echo '========================================================='
	@echo ' executing IIHF IIHH IIHL IILF IILH IILL'
	@echo '========================================================='
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi
	$(RM) core

install:
	cp *.so ./
