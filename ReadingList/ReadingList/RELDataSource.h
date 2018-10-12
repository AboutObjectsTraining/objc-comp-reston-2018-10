#import <UIKit/UIKit.h>

@class RLMBook;

@interface RELDataSource : NSObject <UITableViewDataSource>

- (RLMBook *)bookAtIndexPath:(NSIndexPath *)indexPath;

@end
