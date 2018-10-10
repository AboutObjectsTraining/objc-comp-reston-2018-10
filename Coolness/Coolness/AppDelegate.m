#import "AppDelegate.h"
#import "CLNCoolViewController.h"

@implementation AppDelegate

//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = touches.anyObject;
//    CGPoint currLocation = [touch locationInView:nil];
//    CGPoint prevLocation = [touch previousLocationInView:nil];
//    
//    CGFloat deltaX = currLocation.x - prevLocation.x;
//    CGFloat deltaY = currLocation.y - prevLocation.y;
//    
//    touch.view.frame = CGRectOffset(touch.view.frame, deltaX, deltaY);
//    
//    //    self.bounds = CGRectOffset(self.bounds, deltaX, deltaY);
//    //    [self setNeedsDisplay];
//}


- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.yellowColor;
    
    self.window.rootViewController = [[CLNCoolViewController alloc] init];
    
    [self.window makeKeyAndVisible];
}

@end
