target = CALL01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

result=OUT

all: $(target)

$(target): main.cpp CALL01.asmo CALL01_01.asmo libCALL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCALL01 $(LDFLAGS)

libCALL01.so:
	ofasmif -i CALL01.json
	g++ -shared -fPIC $(CFLAGS) -o $@ CALL01_OFASM_VM_ENTRY.cpp

CALL01.asmo: CALL01.asmi
	$(OFASMC) -i CALL01.asmi -o $@

CALL01.asmi: CALL01.asm
	$(OFASMPP) -i CALL01.asm -o $@

CALL01_01.asmo: CALL01_01.asmi
	$(OFASMC) -i CALL01_01.asmi -o $@

CALL01_01.asmi: CALL01_01.asm
	$(OFASMPP) -i CALL01_01.asm -o $@

clean:
	$(RM) $(target) $(result) *.so *.asmo *.asmi CALL01_OFASM_VM_ENTRY.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result	
