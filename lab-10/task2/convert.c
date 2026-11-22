int convert_c(const char *in, char *out)
{
    char cur;
    char *orig = out;

    do {
        cur = *in++;
        if (cur == '\0')
            break;
        if (cur >= 'a' && cur <= 'z')
            cur = cur - ('a' - 'A');
        *out++ = cur;
    } while (1);

    *out++ = '!';
    *out++ = '\0';

    return out - orig;
}
