#include <stdlib.h>
#include <stdio.h>
#include <string.h>

extern "C"
{
extern int AH04();

int main()
{
	int ret = AH04();
	return 0;
}

}
