//
//  CustomCellBackground.m
//  LifeGrade
//
//  Created by scott mehus on 3/31/13.
//  Copyright (c) 2013 scott mehus. All rights reserved.
//

#import "CustomCellBackground.h"
#import "Common.h"


@implementation CustomCellBackground

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// something with the colors - came up with other color things 


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef whiteColor = [UIColor whiteColor].CGColor;
    
    UIColor *lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0
                                               blue:230.0/255.0 alpha:1.0];
    
    UIColor *sepColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0
                                         blue:208.0/255.0 alpha:1.0];
    
    CGColorRef lightGrayColorRef = lightGrayColor.CGColor;
    CGColorRef separatorColor = sepColor.CGColor;
    
    CGRect paperRect = self.bounds;
    
    if (self.selected) {
        drawLinearGradient1(context, paperRect, lightGrayColorRef, separatorColor);
    } else {
        drawLinearGradient1(context, paperRect, whiteColor, lightGrayColorRef);
    }
  
    if (!self.lastCell) {
        
        CGRect strokeRect = paperRect;
        strokeRect.size.height -= 1;
        strokeRect = rectFor1PxStroke(strokeRect);
        
        //removed white border
        CGContextSetStrokeColorWithColor(context, whiteColor);
        CGContextSetLineWidth(context, 0.0);
        CGContextStrokeRect(context, strokeRect);
        
        
        CGPoint startPoint = CGPointMake(paperRect.origin.x, paperRect.origin.y + paperRect.size.height - 1);
        CGPoint endPoint = CGPointMake(paperRect.origin.x + paperRect.size.width - 1, paperRect.origin.y + paperRect.size.height - 1);
        draw1PxStroke(context, startPoint, endPoint, separatorColor);
        
    } else {
        
        
        CGContextSetStrokeColorWithColor(context, whiteColor);
        CGContextSetLineWidth(context, 0.0);
        
        CGPoint pointA = CGPointMake(paperRect.origin.x,
                                     paperRect.origin.y + paperRect.size.height - 1);
        CGPoint pointB = CGPointMake(paperRect.origin.x, paperRect.origin.y);
        CGPoint pointC = CGPointMake(paperRect.origin.x + paperRect.size.width - 1,
                                     paperRect.origin.y);
        CGPoint pointD = CGPointMake(paperRect.origin.x + paperRect.size.width - 1,
                                     paperRect.origin.y + paperRect.size.height - 1);
        
        draw1PxStroke(context, pointA, pointB, whiteColor);
        draw1PxStroke(context, pointB, pointC, whiteColor);
        draw1PxStroke(context, pointC, pointD, whiteColor);
        
    }
    

    
    
}


@end
