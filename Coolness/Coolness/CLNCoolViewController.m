#import "CLNCoolViewController.h"
#import "CLNCoolCell.h"

@interface CLNCoolViewController () <UITextFieldDelegate>
@property (weak, nonatomic) UITextField *textField;
@property (weak, nonatomic) UIView *contentView;
@end

@implementation CLNCoolViewController

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"In %s", __func__);
//}

- (void)addCoolCell
{
    CLNCoolCell *cell = [[CLNCoolCell alloc] init];
    cell.text = self.textField.text;
    [self.contentView addSubview:cell];
}

// MARK: - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.view.backgroundColor = UIColor.brownColor;
    
    CGRect accessoryRect;
    CGRect contentRect;
    CGRectDivide(self.view.bounds, &accessoryRect, &contentRect, 80.0, CGRectMinYEdge);
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:accessoryRect];
    UIView *contentView = [[UIView alloc] initWithFrame:contentRect];
    [self.view addSubview:accessoryView];
    [self.view addSubview:contentView];
    
    self.contentView = contentView;
    
    contentView.clipsToBounds = YES;
    
    accessoryView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
    contentView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    
    // Controls
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(8, 42, 340, 30)];
    [accessoryView addSubview:textField];
    
    self.textField = textField;
    self.textField.delegate = self;
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Enter some text";
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [accessoryView addSubview:button];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button sizeToFit];
    button.frame = CGRectOffset(button.frame, 360, 42);
    
    [button addTarget:self action:@selector(addCoolCell) forControlEvents:UIControlEventTouchUpInside];
    
    // Cool Cells
    
    CLNCoolCell *coolCell1 = [[CLNCoolCell alloc] initWithFrame:CGRectMake(20, 60, 120, 30)];
    CLNCoolCell *coolCell2 = [[CLNCoolCell alloc] initWithFrame:CGRectMake(40, 120, 120, 30)];
    
    [contentView addSubview:coolCell1];
    [contentView addSubview:coolCell2];
    
    coolCell1.text = @"Cool cells are the bomb! 💣🔥";
    coolCell2.text = @"UIKit FTW! 🥇🎉";
    
    [coolCell1 sizeToFit];
    [coolCell2 sizeToFit];
    
    coolCell1.backgroundColor = UIColor.purpleColor;
    coolCell2.backgroundColor = UIColor.orangeColor;
}

@end
