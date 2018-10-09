#import "GlobalStuff.h"

NSArray *MyBigArray(void)
{
    static NSArray *myArray;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myArray = @[@"One", @"Two", @"Three"];
    });
    
//    if (myArray == nil) {
//    }
    
    return myArray;
}
