#import "Dog.h"

@implementation Dog

// Designated initializer
- (id)initWithName:(NSString *)aName age:(int)anAge breed:(NSString *)aBreed
{
    self = [super initWithName:aName age:anAge];
    if (self == nil) return nil;
    
    // NO!!! Don't do this!!! Evah!!!
    //    _name = aName;
    //    _age = anAge;
    
    _breed = [aBreed copy];
    
    return self;
}

- (NSString *)breed {
    return _breed;
}
- (void)setBreed:(NSString *)newValue {
    _breed = [newValue copy];
}

- (id)copyWithZone:(NSZone *)zone {
    Dog *dog = [[Dog alloc] init];
    
    dog->_name = [_name copy];
    dog->_breed = [_breed copy];
    dog->_age = _age;
    
    return dog;
}

@end
