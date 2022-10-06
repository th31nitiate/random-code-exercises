#include <stdio.h>
#include <stdlib.h>


int main(int argc, char **argv) {

    printf("prints input parameters to stdout\n");

    for (int i = 0; i < argc; i++) {
        printf("%s\t", argv[i]);
        if (i == argc - 1) {
            printf("\nFinished printing the requested parameters\n");
        }

    }
    return EXIT_SUCCESS;

}