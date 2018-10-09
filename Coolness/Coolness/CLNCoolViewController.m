#import "CLNCoolViewController.h"
#import "CLNCoolCell.h"

@implementation CLNCoolViewController

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.view.backgroundColor = UIColor.brownColor;
    
    CLNCoolCell *coolCell1 = [[CLNCoolCell alloc] initWithFrame:CGRectMake(20, 60, 120, 30)];
    CLNCoolCell *coolCell2 = [[CLNCoolCell alloc] initWithFrame:CGRectMake(40, 120, 120, 30)];
    
    [self.view addSubview:coolCell1];
    [self.view addSubview:coolCell2];
    
    coolCell1.text = @"Cool cells are the bomb! 💣🔥";
    coolCell2.text = @"UIKit FTW! 🥇🎉";
    
    coolCell1.backgroundColor = UIColor.purpleColor;
    coolCell2.backgroundColor = UIColor.orangeColor;
}

@end
