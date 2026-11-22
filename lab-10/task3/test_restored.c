#include <stdio.h>
#include <string.h>

#define BUFSIZE 255

extern long restored_convert(char *in, char *out);
extern int convert_c(const char *in, char *out);

int main()
{
    const char *str = "VarTest";
    char out_restored[BUFSIZE];
    char out_orig[BUFSIZE];

    long len_restored = restored_convert((char *)str, out_restored);
    int len_orig = convert_c(str, out_orig);

    printf("Исходная строка:              %s\n", str);
    printf("Оригинал (task2/convert.c):   %s  (len = %d)\n", out_orig, len_orig);
    printf("Восстановленный Ghidra код:   %s  (len = %ld)\n", out_restored, len_restored);
    printf("Совпадение:                   %s\n",
           len_restored == len_orig && strcmp(out_restored, out_orig) == 0 ? "да" : "нет");
    return 0;
}
