#include <stdio.h>
#include <stdlib.h>

int main() {
    int c;
    while ((c = getchar()) != EOF)
        putchar(tolower(c));
    return EXIT_SUCCESS;

}