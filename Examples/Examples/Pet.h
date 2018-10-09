#import <Foundation/Foundation.h>

@interface Pet : NSObject
{
    NSString *_name;
    int _age;
}

- (id)initWithName:(NSString *)aName age:(int)anAge;

- (NSString *)name;
- (void)setName:(NSString *)newValue;

- (int)age;
- (void)setAge:(int)newValue;

@end

