#import <Foundation/Foundation.h>
#import "Pet.h"

@interface Dog : Pet <NSCopying>
{
    NSString *_breed;
}

- (id)initWithName:(NSString *)aName
               age:(int)anAge
             breed:(NSString *)aBreed;

- (NSString *)breed;
- (void)setBreed:(NSString *)newValue;

@end

