#import "RELDataSource.h"
#import <ReadingListModel/ReadingListModel.h>

@interface RELDataSource ()
@property (strong, nonatomic) IBOutlet RLMStoreController *storeController;
@property (strong, nonatomic) RLMReadingList *readingList;
@end

@implementation RELDataSource

- (RLMReadingList *)readingList {
    if (_readingList == nil) {
        _readingList = self.storeController.fetchedReadingList;
    }
    return _readingList;
}

- (NSString *)title {
    return self.readingList.title;
}


/**
 Returns the @c RLMBook corresponding to the provided index path.
 
 @param indexPath index path of a book
 @return an instance of `RLMBook`
 */
- (RLMBook *)bookAtIndexPath:(NSIndexPath *)indexPath {
    return [self.readingList bookAtIndexPath:indexPath];
}

- (void)save {
    [self.storeController saveReadingList:self.readingList];
}

// MARK: - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.readingList.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Book Summary"];
    RLMBook *book = [self.readingList bookAtIndexPath:indexPath];
    
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@  %@", book.year, book.author.fullName];
    
    return cell;
}

@end
