#import <UIKit/UIKit.h>

@class RLMBook;

@interface RELDataSource : NSObject <UITableViewDataSource>

- (NSString *)title;
- (RLMBook *)bookAtIndexPath:(NSIndexPath *)indexPath;
- (void)save;

@end
