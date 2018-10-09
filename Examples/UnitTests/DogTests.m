#import <XCTest/XCTest.h>
#import "Dog.h"

@interface DogTests : XCTestCase
{
    Dog *_dog;
}
@end

@implementation DogTests

- (void)setUp {
    [super setUp];
    _dog = [[Dog alloc] initWithName:@"Rover" age:3];
    [_dog setBreed:@"Lab"];
    putchar('\n');
}
- (void)tearDown {
    putchar('\n');
    [super tearDown];
}

- (void)testCopyMyDog
{
    Dog *newDog = [_dog copy];
    XCTAssertNotNil(newDog);
}

- (void)testMyDog
{
    [_dog setName:@"Spot"];
    XCTAssertEqualObjects([_dog name], @"Spot");
}

- (void)testThatFailsButNotAnymore
{
    // XCTFail();
}

@end
