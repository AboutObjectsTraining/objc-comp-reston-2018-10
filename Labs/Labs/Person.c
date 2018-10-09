#include <stdio.h>
#include "Person.h"

void PrintPerson(Person aPerson)
{
    printf("First name: %s\n"
           "Last name: %s\n"
           "Age: %d\n",
           aPerson.firstName,
           aPerson.lastName,
           aPerson.age);
}

void DoStuffWithStructs(void)
{
    // Define a variable of type struct Person.
    Person fred;
    
    fred.firstName = "Fred";
    fred.lastName = "Smith";
    fred.age = 32;
    
    Person sally = { .firstName = "Sally", .age = 27 };

//    Person sally = { "Sally", "Jones", 27 };
    
    PrintPerson(sally);
}
