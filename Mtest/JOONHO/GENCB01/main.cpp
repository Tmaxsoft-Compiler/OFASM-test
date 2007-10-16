#include <stdio.h>

extern "C" {
extern int GENCB01();
}

int main() {
    GENCB01();
    return 0;
}
