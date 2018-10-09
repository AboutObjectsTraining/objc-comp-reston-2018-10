enum Colors {
    Red,
    Green,
    Blue
};

typedef enum Colors Colors;

char *Baz = "Hello World";

float convert(int x) {
    char *foo = "Hello World";
    char *bar = "Hello World";
    printf("foo contains %p, bar contains %p\n", foo, bar);
    return x == 0 ? 1 : 2;
}
