//
//  CircProgressBar.m
//  CircularProgressBar
//
//  Created by wangduan on 14-3-11.
//  Copyright (c) 2014年 wxcp. All rights reserved.
//

#import "CircProgressBar.h"
@interface CircProgressBar()
{
    CGContextRef contextRef;
}
@end


@implementation CircProgressBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self internalInit];
    }
    return self;
}

- (void)awakeFromNib
{
    [self internalInit];
}

- (void)internalInit
{
    // Default values
    self.completedColor = [UIColor blueColor];
    _progressTotal = 1.0;
    self.incompletedColor = [UIColor grayColor];
    self.thickness = 10;
}

- (void)drawSlices:(CGFloat)slicesCount
         completed:(CGFloat)slicesCompleted
            radius:(CGFloat)circleRadius
            center:(CGPoint)center
         inContext:(CGContextRef)context
{
    
    // Draw the arcs grouped instead of individually to avoid
    // artifacts between one slice and another.
    
    // Completed slices
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, center.x, center.y);
    CGFloat startAngle = - M_PI_2;
    CGFloat sliceAngle = (2 * M_PI) / slicesCount;
    CGFloat progressAngle = sliceAngle * slicesCompleted;
    
    CGFloat endAngle = startAngle + progressAngle;
    //    CGFloat endAngle = sliceAngle * (self.progressCurrent -1);
    CGContextAddArc(context, center.x, center.y, circleRadius, startAngle, endAngle, 0);
    CGColorRef color = self.completedColor.CGColor;
    CGContextSetFillColorWithColor(context, color);
    CGContextFillPath(context);
    
    // Incompleted slices
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, center.x, center.y);
    startAngle = endAngle;
    endAngle = - M_PI_2;
    CGContextAddArc(context, center.x, center.y, circleRadius, startAngle, endAngle, 0);
    color = self.incompletedColor.CGColor;
    CGContextSetFillColorWithColor(context, color);
    CGContextFillPath(context);
}

- (void)drawRect:(CGRect)rect
{
    if (self.progressTotal <= 0) {
        return;
    }
    
    // Draw the slices.
    
	CGSize viewSize = self.bounds.size;
    
    contextRef = UIGraphicsGetCurrentContext();
    CGPoint center = CGPointMake(viewSize.width / 2, viewSize.height / 2);
    CGFloat radius = viewSize.width / 2;
    [self drawSlices:self.progressTotal
		   completed:self.progressCurrent
			  radius:radius
			  center:center
		   inContext:contextRef];
    
	// Draw the slice separators.
	
    int outerDiameter = viewSize.width;
    int innerDiameter = outerDiameter - self.thickness;
    float innerRadius = innerDiameter / 2;
    
    
    // Draw the inner circle to fake a hole in the middle.
    
    CGContextSetLineWidth(contextRef, self.thickness);
    
    CGContextSetFillColorWithColor(contextRef, self.backgroundColor.CGColor);
    CGRect circlePoint = CGRectMake(center.x - innerRadius, center.y - innerRadius,
                                    innerDiameter, innerDiameter);
    CGContextFillEllipseInRect(contextRef, circlePoint);
}
@end
