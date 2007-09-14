#include <stdlib.h>
#include <string.h>

extern int MVCL02();

int main(){
    putenv("OFASM_LOG=YES");
    return MVCL02();
}
