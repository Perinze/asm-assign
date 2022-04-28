#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

#define RAND (rand())
#define PRINTABLE 95

void Rand_Str(int n, char *str);
void To_Upper(char *str);
void To_Upper_C(char *str);
  
int main() {
    srand(time(NULL));
    char str[BUFSIZ];
    char tmp[2][BUFSIZ];
    for (;;) {
        memset(str, 0, sizeof(str));
        memset(tmp, 0, sizeof(tmp));
        // strcpy(str, "cs 354 is Awesome!");
        int l = RAND % BUFSIZ;
        Rand_Str(l, str);
        strcpy(tmp[1], str);
        strcpy(tmp[2], str);
        // printf("str:\n%s\n\ntmp1:\n%s\n\ntmp2:\n%s\n\n", str, tmp[1], tmp[2]);
        // printf("Original string:   %s\n",str);
        To_Upper(tmp[1]);
        To_Upper_C(tmp[2]);
        if (strcmp(tmp[1], tmp[2])) {
            printf("err:\nstr:\n%s\n\ntmp1:\n%s\n\ntmp2:\n%s\n\n", str, tmp[1], tmp[2]);
            exit(1);
        }
        // printf("\n");
        // printf("Upper case string: %s\n",str);
    }
    return 0;
}

void Rand_Str(int n, char *str) {
    for (; n--; str++)
        *str = ' ' + RAND % 95;
    *str = '\0';
}

void To_Upper_C(char *str) {
    for (char *p = str; *p; p++)
        if (*p >= 'a' && *p <= 'z')
            *p += 'A' - 'a';
}