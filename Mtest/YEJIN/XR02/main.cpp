#include <stdlib.h>

extern "C"
{
    extern int TEST();

    int main()
    {
        TEST();

        return 0;
    }
}
