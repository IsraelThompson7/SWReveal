//
//  CoolButton.m
//  LifeGrade
//
//  Created by scott mehus on 3/20/13.
//  Copyright (c) 2013 scott mehus. All rights reserved.
//

#import "CoolButton.h"
#import <QuartzCore/QuartzCore.h>



@implementation CoolButton {
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        self.hue = 1.0;
        self.saturation = 1.0;
        self.brightness = 1.0;
        
        
        
        
    }
    return self;
}



CGMutablePathRef createRoundedRectForRect(CGRect rect, CGFloat radius) {
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect),
                        CGRectGetMaxX(rect), CGRectGetMaxY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect),
                        CGRectGetMinX(rect), CGRectGetMaxY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect),
                        CGRectGetMinX(rect), CGRectGetMinY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect),
                        CGRectGetMaxX(rect), CGRectGetMinY(rect), radius);
    CGPathCloseSubpath(path);
    
    return path;        
}



void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor) {
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithHue:0.4 saturation:1.0
                                                                brightness:1.0 alpha:1.0] CGColor], (id)[[UIColor colorWithHue:0.4 saturation:1.0
                                                                brightness:0.70 alpha:1.0] CGColor], nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}



void drawGlossAndGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor) {
    
    
    drawLinearGradient(context, rect, startColor, endColor);
    
    CGColorRef glossColor1 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.35].CGColor;
    CGColorRef glossColor2 = [UIColor colorWithRed:1.0 green:5.0 blue:1.0 alpha:0.1].CGColor;
    
    CGRect topHalf = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    
    drawLinearGradient(context, topHalf, glossColor1, glossColor2);

}





//create ;


- (void)drawRect:(CGRect)rect
{
    
    CGFloat actualBrightness = 1.0;
    if (self.state == UIControlStateHighlighted) {
        actualBrightness -= 0.10;
    }
    
    
    CGColorRef outerTop = [UIColor colorWithHue:0.4 saturation:1.0
                                     brightness:actualBrightness alpha:1.0].CGColor;
    CGColorRef outerBottom = [UIColor colorWithHue:0.4 saturation:1.0
                                        brightness:0.50 alpha:1.0].CGColor;
    CGColorRef innerTop = [UIColor colorWithHue:_hue saturation:_saturation
                                     brightness:0.90*actualBrightness alpha:1.0].CGColor;
    CGColorRef innerBottom = [UIColor colorWithHue:_hue saturation:_saturation
                                        brightness:0.70*actualBrightness alpha:1.0].CGColor;
    
    

    
    CGContextRef context = UIGraphicsGetCurrentContext();
        
    //CGColorRef color = [UIColor greenColor].CGColor;
    
    CGFloat outerMargin = 5.0f;
    CGRect outRect = CGRectInset(self.bounds, outerMargin, outerMargin);
    CGMutablePathRef outerPath = createRoundedRectForRect(outRect, 6.0);
    
    
    CGFloat innerMargin = 3.0f;
    CGRect innerRect = CGRectInset(outRect, innerMargin, innerMargin);
    CGMutablePathRef innerPath = createRoundedRectForRect(innerRect, 6.0);
    
    if (self.state != UIControlStateHighlighted) {
        CGContextSaveGState(context);
        CGContextSetFillColorWithColor(context, [[UIColor greenColor] CGColor]);
        CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0, [[UIColor darkGrayColor] CGColor]);
        CGContextAddPath(context, outerPath);
        CGContextFillPath(context);
        CGContextRestoreGState(context);
    }
    
    CGContextSaveGState(context);
    CGContextAddPath(context, outerPath);
    CGContextClip(context);
    drawGlossAndGradient(context, outRect, outerTop, outerBottom);
    CGContextRestoreGState(context);
    

    
    CGContextSaveGState(context);
    CGContextAddPath(context, innerPath);
    CGContextClip(context);
    drawGlossAndGradient(context, innerRect, innerTop, innerBottom);
    CGContextRestoreGState(context);
	
	
}

- (void)hesitateUpdate
{
    [self setNeedsDisplay];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    [self setNeedsDisplay];
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    [self setNeedsDisplay];
    [self performSelector:@selector(hesitateUpdate) withObject:nil afterDelay:0.0];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self setNeedsDisplay];
    [self performSelector:@selector(hesitateUpdate) withObject:nil afterDelay:0.0];
}


@end
