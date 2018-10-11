#import "CLNAccessoryView.h"

@interface CLNAccessoryView () <UITextFieldDelegate>
@end

@implementation CLNAccessoryView

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
