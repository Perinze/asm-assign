void To_Upper(char *str) {
    char *p;
    for (p = str; *p != 0; p++)
        if (*p >= 97 && *p <= 122)
            *p -= 32;
}