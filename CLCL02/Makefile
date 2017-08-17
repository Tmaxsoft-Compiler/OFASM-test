target = CLCL02

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp $(target).asmo lib$(target).so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -l$(target) $(LDFLAGS)

lib$(target).so:
	g++ -shared -fPIC $(CFLAGS) -o $@ $(target)_interface.cpp

%.asmo: %.asmi
	$(OFASMC) -i $< -o $@

%.asmi: %.asm
	$(OFASMPP) -i $< -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

test : $(target)
	@echo '========================================================='
	@echo ' executing CLCL'
	@echo '========================================================='
	./$(target)
	
install:
	cp *.so ./
