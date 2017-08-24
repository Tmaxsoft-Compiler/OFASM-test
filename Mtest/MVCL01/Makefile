target = MVCL01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp MVCL01.asmo libMVCL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMVCL01 $(LDFLAGS)

libMVCL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ MVCL01_interface.cpp

MVCL01.asmo: MVCL01.asmi
	$(OFASMC) -i MVCL01.asmi -o $@

MVCL01.asmi: MVCL01.asm
	$(OFASMPP) -i MVCL01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
