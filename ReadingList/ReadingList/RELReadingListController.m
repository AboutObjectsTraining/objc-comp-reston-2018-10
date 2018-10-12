#import "RELReadingListController.h"

@implementation RELReadingListController

- (IBAction)doneEditing:(UIStoryboardSegue *)segue {
    // TODO: Do something here
    // 1.) Sync UI
    // 2.) Save
}

- (IBAction)cancelEditing:(UIStoryboardSegue *) segue {
    // Does nothing
}

// MARK: - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Book Summary"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Foo"];
//    }
    cell.textLabel.text = [NSString stringWithFormat:@"Row %ld", indexPath.row + 1];
    return cell;
}

@end
