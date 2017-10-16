target = $(notdir $(CURDIR))
result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp $(target).asmo lib$(target).so
		   g++ $(CFLAGS) -o $@ main.cpp -L./ -l$(target) $(LDFLAGS)

lib$(target).so:
		   g++ -shared -fPIC $(CFLAGS) -o $@ $(target)_interface.cpp

$(target).asmo: $(target).asmi
		   $(OFASMC) -i $(target).asmi -o $@

$(target).asmi: $(target).asm
		   $(OFASMIF) -i $(target).json
		   $(OFASMPP) -i $(target).asm -o $@

clean:
		   $(RM) $(target) *.so *.asmo *.asmi $(result) *_interface.cpp

install:
		   cp *.so ./

test:
		   @./$(target) > OUT
		   @diff $(result) $(result).result
JSON = "{\
\"entry_name\":\"$(target)\",\
\"parameter\":[],\
\"program_name\":\"$(target)\"\
}"

MAIN = "extern \"C\"{ extern int $(target)();\
int main(){int ret = $(target)();return 0;}}\
"

ASM = "$(target) CSECT\
LR          12,15\
USING       $(target),12\
BR          14\
END\
"
init:
		   @if [ -a $(target).json ]; then echo "json already exits."; else echo $(JSON) > $(target).json; fi;
		   @if [ -a main.cpp ]; then echo "main already exits."; else echo $(MAIN) > main.cpp; fi;
		   @if [ -a $(target).asm ]; then echo "asm already exits."; else echo $(ASM) > $(target).asm; fi;
