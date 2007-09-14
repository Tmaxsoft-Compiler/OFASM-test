target = CALL02

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

result=OUT

all: $(target)

$(target): main.cpp CALL02.asmo libCALL02.so libCALL02_01.so libCALL02_01_OFASM_VM_EXIT.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCALL02 $(LDFLAGS)

libCALL02.so:
	ofasmif -i CALL02.json
	g++ -shared -fPIC $(CFLAGS) -o $@ CALL02_OFASM_VM_ENTRY.cpp

libCALL02_01_OFASM_VM_EXIT.so: libCALL02_01.so
	gcc -shared -fPIC $(CFLAGS) -o $@ CALL02_01_OFASM_VM_EXIT.cpp -L./ -lCALL02_01
 
libCALL02_01.so:
	gcc -shared -fPIC $(CFLAGS) -o $@ CALL02_01.c

CALL02.asmo: CALL02.asmi
	$(OFASMC) -i CALL02.asmi -o $@

CALL02.asmi: CALL02.asm
	$(OFASMPP) -i CALL02.asm -o $@

clean:
	$(RM) $(target) $(result) *.so *.asmo *.asmi CALL02_OFASM_VM_ENTRY.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result	
