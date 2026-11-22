#include <stdio.h>
#include <string.h>

#define BUFSIZE 255

extern int convert_c(const char *in, char *out);
extern int convert_asm(const char *in, char *out);

int main()
{
    const char *str = "VarTest";
    char out_c[BUFSIZE];
    char out_asm[BUFSIZE];

    int len_c = convert_c(str, out_c);
    int len_asm = convert_asm(str, out_asm);

    printf("Input:        %s\n", str);
    printf("C:            %s  (len = %d)\n", out_c, len_c);
    printf("Assembler:    %s  (len = %d)\n", out_asm, len_asm);
    printf("Match:        %s\n", len_c == len_asm && strcmp(out_c, out_asm) == 0 ? "yes" : "no");
    return 0;
}
