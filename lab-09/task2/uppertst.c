#include <stdio.h>

#define MAX_BUFFSIZE 255

extern int mytoupper(const char *in, char *out);

int main()
{
    char *str = "dokukin_dmitrii_alekseevich_ikbo_42_25_variant_10";
    char outBuf[MAX_BUFFSIZE];
    int len;

    len = mytoupper(str, outBuf);

    printf("Before str: %s\n", str);
    printf("After str: %s\n", outBuf);
    printf("Str len = %d\n", len);
    return 0;
}
