#import "Pet.h"

@implementation Pet

// Convenience initializer
- (id)initWithName:(NSString *)aName
{
    return [self initWithName:aName age:0];
}

// Designated initializer
- (id)initWithName:(NSString *)aName age:(int)anAge
{
    self = [super init];
    
    if (self == nil) return nil;
    
    _name = [aName copy];
    _age = anAge;
    
    return self;
}

- (NSString *)name {
    return _name;
}
- (void)setName:(NSString *)newValue {
    _name = [newValue copy];
}

- (int)age {
    return  _age;
}
- (void)setAge:(int)newValue {
    _age = newValue;
}

@end
