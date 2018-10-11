#import "CLNCoolCell.h"

const CGFloat CLNHorizontalInset = 12;
const CGFloat CLNVerticalInset = 8;
const CGPoint CLNTextOrigin = { CLNHorizontalInset, CLNVerticalInset };


IB_DESIGNABLE
@interface CLNCoolCell ()

@property (class, readonly, nonatomic) NSDictionary *textAttributes;
@property (getter=isHighlighted, nonatomic) BOOL highlighted;

@property (nonatomic) IBInspectable CGFloat borderWidth;

@end


@implementation CLNCoolCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) return nil;
    
    self.backgroundColor = UIColor.brownColor;
    [self configureAppearance];
    [self configureGestureRecognizers];

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (!(self = [super initWithCoder:aDecoder])) return nil;
    
    [self configureAppearance];
    [self configureGestureRecognizers];
    
    return self;
}

- (void)configureAppearance {
    self.layer.borderWidth = 3.0;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
}

- (void)configureGestureRecognizers {
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bounce)];
    tapRecognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tapRecognizer];
}

- (void)prepareForInterfaceBuilder {
    self.layer.masksToBounds = YES;
}

- (void)bounce {
    NSLog(@"In %s", __func__);
    [self animateBounceWithDuration:1.0 size:CGSizeMake(120, 240)];
}

+ (NSDictionary *)textAttributes {
    return @{ NSFontAttributeName: [UIFont boldSystemFontOfSize:20],
              NSForegroundColorAttributeName: UIColor.whiteColor };
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}
- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize newSize = [self.text sizeWithAttributes:self.class.textAttributes];
    newSize.width += CLNHorizontalInset * 2;
    newSize.height += CLNVerticalInset * 2;
    return newSize;
}

- (void)drawRect:(CGRect)rect
{
    [self.text drawAtPoint:CLNTextOrigin withAttributes:self.class.textAttributes];
}

- (void)configureBounce:(CGSize)size {
    [UIView setAnimationRepeatCount:3.5];
    [UIView setAnimationRepeatAutoreverses:YES];
    CGAffineTransform translation = CGAffineTransformMakeTranslation(size.width, size.height);
    self.transform = CGAffineTransformRotate(translation, M_PI_2);
}

- (void)animateBounceCompletionWithDuration:(NSTimeInterval)duration size:(CGSize)size {
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:duration animations:^{
        weakSelf.transform = CGAffineTransformIdentity;
    }];
}

// MARK: - Core Animation

- (void)animateBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size
{
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:duration
                     animations:^{ [weakSelf configureBounce:size]; }
                     completion:^(BOOL finished) { [weakSelf animateBounceCompletionWithDuration:duration size:size]; }];
}

@end


// MARK: - UIResponder methods

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
    
//    self.bounds = CGRectOffset(self.bounds, deltaX, deltaY);
//    [self setNeedsDisplay];
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
