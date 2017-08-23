target = CL01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CL01.asmo libCL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCL01 $(LDFLAGS)

libCL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CL01_interface.cpp

CL01.asmo: CL01.asmi
	$(OFASMC) -i CL01.asmi -o $@

CL01.asmi: CL01.asm
	$(OFASMIF) -i CL01.json
	$(OFASMPP) -i CL01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
