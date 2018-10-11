#import "CLNAppDelegate.h"
#import "CLNCoolViewController.h"

@implementation CLNAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.yellowColor;
    
    self.window.rootViewController = [[CLNCoolViewController alloc] initWithNibName:@"CoolStuff" bundle:nil];
    
    [self.window makeKeyAndVisible];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIApplication.sharedApplication sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
