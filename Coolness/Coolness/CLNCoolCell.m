#import "CLNCoolCell.h"

@interface CLNCoolCell ()

@property (getter=isHighlighted, nonatomic) BOOL highlighted;

@end


@implementation CLNCoolCell

+ (NSDictionary *)textAttributes {
    return @{ NSFontAttributeName: [UIFont boldSystemFontOfSize:20],
              NSForegroundColorAttributeName: UIColor.whiteColor };
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}

- (void)drawRect:(CGRect)rect
{
    [self.text drawAtPoint:CGPointZero withAttributes:[self.class textAttributes]];
}

@end


@implementation CLNCoolCell (CLNResponding)

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.superview bringSubviewToFront:self];
    self.highlighted = YES;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:nil];
    CGPoint prevLocation = [touch previousLocationInView:nil];
    
    CGFloat deltaX = currLocation.x - prevLocation.x;
    CGFloat deltaY = currLocation.y - prevLocation.y;
    
    self.frame = CGRectOffset(self.frame, deltaX, deltaY);
}

- (void)finishTouch:(UITouch *)touch {
    self.highlighted = NO;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self finishTouch:touches.anyObject];
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self finishTouch:touches.anyObject];
}

@end
