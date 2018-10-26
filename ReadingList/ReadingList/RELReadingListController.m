#import "RELReadingListController.h"
#import "RELViewBookController.h"
#import "RELDataSource.h"
#import <ReadingListModel/ReadingListModel.h>
#import "UIStoryboardSegue+RELAdditions.h"

@interface RELReadingListController ()
@property (strong, nonatomic) IBOutlet RELDataSource *dataSource;
@end


@implementation RELReadingListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.dataSource.title;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RELViewBookController *controller = segue.rel_destinationViewController;
    controller.book = [self.dataSource bookAtIndexPath:self.tableView.indexPathForSelectedRow];
}


- (IBAction)doneEditing:(UIStoryboardSegue *)segue {
    [self.tableView reloadData];
    [self.dataSource save];
}

- (IBAction)cancelEditing:(UIStoryboardSegue *) segue {
    // Does nothing
}


@end
