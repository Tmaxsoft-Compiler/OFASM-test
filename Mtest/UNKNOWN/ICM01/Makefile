target = ICM01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp ICM01.asmo libICM01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lICM01 $(LDFLAGS)

libICM01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ ICM01_interface.cpp

ICM01.asmo: ICM01.asmi
	$(OFASMC) -i ICM01.asmi -o $@

ICM01.asmi: ICM01.asm
	$(OFASMPP) -i ICM01.asm -o $@

test: $(target)
	@echo 'testing ICM'
	./$(target)

clean:
	$(RM) $(target) *.so *.asmo *.asmi
	$(RM) core

install:
	cp *.so ./
