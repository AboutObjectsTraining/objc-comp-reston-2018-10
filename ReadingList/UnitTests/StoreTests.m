// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
@import ReadingListModel;

@interface StoreTests : XCTestCase @end

@implementation StoreTests

- (void)setUp {
    putchar('\n');
}
- (void)tearDown {
    putchar('\n');
}

- (void)testLoadReadingList {
    RLMStoreController *store = [[RLMStoreController alloc] init];
    RLMReadingList *readingList = store.fetchedReadingList;
    NSLog(@"%@", readingList);
}

@end
