#include <stdio.h>
#import <objc/runtime.h>

char *Baz = "Hello World";

float convert(int x) {
    char *foo = "Hello World";
    char *bar = "Hello World";
    printf("foo contains %p, bar contains %p\n", foo, bar);
    return x == 0 ? 1 : 2;
}

char *createBuffer() {
    char a[80] = {};
    return a;
}


void fiddleWithArrays() {
    char name[] = "Fred Smith";
    char *charRef = name;
    // Prints: address is 0x7fff5fbff7dd, value is F
    printf("address is %p, value is %c\n", charRef, charRef[0]);
    printf("address is %p, value is %c\n", name, *name);
    printf("address is %p, value is %c\n", charRef, *(charRef + 2));

    
    {
        int x = 3;
        printf("%d\n", x);
    }

//    printf("%d\n", x);
    
    for (char *p = charRef; *p; p++) {
        printf("%p, value is %c\n", p, *p);
    }
}

void messingAroundWithStrings() {
    char *buffer = createBuffer();
    convert(5);
    buffer[0] = 'a';
    printf("%s\n", buffer);
}

char *Capitalize(char *word)
{
    const char delta = 'a' - 'A';
    word[0] -= delta;
    
    return "";
}

int main(int argc, const char * argv[])
{
//    convert(0);
//    messingAroundWithStrings();
//    fiddleWithArrays();
//    char *bye = "hello";
    
    char *hi = "hello";
    Capitalize(hi);
    printf("%s\n", hi);
}


