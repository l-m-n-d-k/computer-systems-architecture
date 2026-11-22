#include <stdio.h>
#include <time.h>

#define BUFSIZE 255
#define ITERATIONS 1000000

extern int bench_toupper1(const char *in, char *out);
extern int bench_toupper2(const char *in, char *out);
extern int bench_toupper3(const char *in, char *out);

typedef int (*upper_fn)(const char *, char *);

static double now(void)
{
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec + ts.tv_nsec / 1e9;
}

int main()
{
    const char *str = "ThisIsRatherALargeVariableNameAaZz//['[\n";
    const char *names[] = {"toupper1 (два ветвления)", "toupper2 (одно ветвление)", "toupper3 (маска 0xDF)"};
    upper_fn fns[] = {bench_toupper1, bench_toupper2, bench_toupper3};
    char out[BUFSIZE];
    double base = 0;

    for (int k = 0; k < 3; k++) {
        int len = fns[k](str, out);
        printf("%-28s len=%d  %s", names[k], len, out);
    }
    printf("\n");

    for (int k = 0; k < 3; k++) {
        double t0 = now();
        for (int i = 0; i < ITERATIONS; i++)
            fns[k](str, out);
        double t = now() - t0;
        if (k == 0)
            base = t;
        printf("%-28s %.3f c  (%.2fx)\n", names[k], t, base / t);
    }
    return 0;
}
