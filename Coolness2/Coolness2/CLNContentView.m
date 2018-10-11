#import "CLNContentView.h"
#import "CLNCoolCell.h"

@interface CLNContentView ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation CLNContentView

- (IBAction)addCoolCell
{
    CLNCoolCell *cell = [[CLNCoolCell alloc] init];
    cell.text = self.textField.text;
    [self addSubview:cell];
}

@end
