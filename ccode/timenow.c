#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    time_t now=time(NULL);
    printf(ctime(&now));
    printf("\n");
    return EXIT_SUCCESS;

}