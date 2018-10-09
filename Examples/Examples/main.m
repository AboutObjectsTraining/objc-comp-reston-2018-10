#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    NSString *foo = @"Hello World!";
    NSString *lowercaseFoo = [foo lowercaseString];
    NSLog(@"%@", lowercaseFoo);
    
    NSMutableString *s = [[NSMutableString alloc] initWithString:foo];
    [s appendString:@" Woohoo!"];
    NSLog(@"%@", s);
    
    NSString *s2 = [foo stringByAppendingString:@" Wheee!"];
    NSLog(@"%@", s2);
    
    NSString *words = @"One, Two, Three";
    id bar = [words componentsSeparatedByString:@", "];
    NSLog(@"%@", bar);
    
    
    NSMutableString *s3 = [NSMutableString alloc];
//    NSMutableString *s4 = [NSMutableString alloc];
    id s5 = [s3 initWithString:@"Yay!"];
    NSLog(@"%@", s5);
    
//    [NSString string]
    
    NSArray <NSString *> *a = @[ @"One", @"Two"];
    
    NSLog(@"%@", a);
    
    for (NSString *currString in a) {
        NSLog(@"%@", [currString lowercaseString]);
    }
}
