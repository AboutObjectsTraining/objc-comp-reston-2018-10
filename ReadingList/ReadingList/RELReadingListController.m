#import "RELReadingListController.h"
#import "RELViewBookController.h"
#import "RELDataSource.h"
#import <ReadingListModel/ReadingListModel.h>

@interface RELReadingListController ()
@property (strong, nonatomic) IBOutlet RELDataSource *dataSource;
@end


@implementation RELReadingListController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RELViewBookController *controller = segue.destinationViewController;
    controller.book = [self.dataSource bookAtIndexPath:self.tableView.indexPathForSelectedRow];
}


- (IBAction)doneEditing:(UIStoryboardSegue *)segue {
    // TODO: Do something here
    // 1.) Sync UI
    // 2.) Save
}

- (IBAction)cancelEditing:(UIStoryboardSegue *) segue {
    // Does nothing
}


@end
