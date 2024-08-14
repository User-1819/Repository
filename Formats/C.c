#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>

uint64_t Number = 0;
uint64_t Number2 = 0;
uint64_t Number3 = UINT64_MAX;

void End();

int main(int argc, char *argv[]) {
    const char *file = "File.txt";
    FILE *fp;

    if ((fp = fopen(file, "r")) == NULL) {
        fp = fopen(file, "w");
        fprintf(fp, "Goodbye Cruel World!");
        fclose(fp);
    } else {
        fclose(fp);
    }

    printf("WARNING! THIS A FILE CLONER! EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!\n");
    getchar();
    End();

    return 0;
}

void End() {
    system("clear");
    char *File = "File.txt";
    FILE *fp = fopen(File, "r");
    if (fp == NULL) {
        printf("Error opening file!\n");
        return;
    }

    fseek(fp, 0, SEEK_END);
    long fsize = ftell(fp);
    fseek(fp, 0, SEEK_SET);

    char *contents = malloc(fsize + 1);
    fread(contents, fsize, 1, fp);
    fclose(fp);

    contents[fsize] = 0;

    for (Number = 0; Number < Number3; Number2++) {
        fp = fopen(File, "a");
        fprintf(fp, "%s", contents);
        fclose(fp);

        printf("\r%llu", (Number2 + 1));
        fflush(stdout);

        char title[20];
        sprintf(title, "%llu", (Number2 + 1));
        // Note: Console title can't be changed in standard C. This is system-dependent.

        char File2[256];
        sprintf(File2, "File (%llu).txt", Number2);

        char command[512];
        sprintf(command, "cp %s %s", File, File2);
        system(command);

        strcpy(File, File2);
    }

    printf("\n");
    free(contents);
}