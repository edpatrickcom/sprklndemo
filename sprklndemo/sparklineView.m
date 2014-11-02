//
//  sparklineView.m
//  sprklndemo
//
//  Created by edp on 11/2/14.
//  Copyright (c) 2014 edp. All rights reserved.
//

#import "sparklineView.h"

@interface sparklineView ()

@property (nonatomic) float maxValue;
@property (nonatomic) float minValue;
@property (nonatomic) float deltaValue;
@property (nonatomic) float scaleValue;

@property (nonatomic) float insetHorizontal;
@property (nonatomic) float insetVertical;


@end





@implementation sparklineView


#pragma mark - UIView Stack

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        self.lineStrokeWidth = 1;
        self.lineStrokeColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        self.endPointColor   = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];

        
    }
    
    return self;
    
}


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.lineStrokeWidth = 1;
        self.lineStrokeColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        self.endPointColor   = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
        
        
    }
    
    return self;

    
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        self.lineStrokeWidth = 1;
        self.lineStrokeColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        self.endPointColor   = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
        
        
    }
    
    return self;

    
}


- (void)drawRect:(CGRect)rect {
    

    
    
    // exit if there is no data
    
    if ([self.dataToGraphArray count] < 1) {
        
        return;
        
    }
    
    
    // if the view size is too small to draw nicely
    
    if ((self.frame.size.height < 20) || (self.frame.size.width < 50)) {
        
        return;
        
    }
    
    
    

    
    [self computeBoundsAndScale];

    
    
    
    // scaleValue == frame.height / deltaValue
    // magnitude == currentValue - minValue
    // drawValue == magnitude * scaleValue
    
    
    int i;
    
    float currentX;
    float currentY;

    
    // Start the Line Drawing
    
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;

    
    
    for (i=0; i<[self.dataToGraphArray count]; i++) {
        
        
        currentX = [self computeXwithIndex:i];
        currentY = [self computeYwithFloat:[[self.dataToGraphArray objectAtIndex:i] floatValue]];
        
        
        
        if (i == 0) {
            
            // Line Drawing
            
            [bezierPath moveToPoint: CGPointMake(currentX,currentY)];

            // Oval Drawing
            
            [self drawOvalAtX:currentX andY:currentY];
            
            
        } else {
            
            // Line Drawing
            
            [bezierPath addLineToPoint: CGPointMake(currentX, currentY)];
            
            // Oval Drawing
            
            if (i == [self.dataToGraphArray count] - 1) {
                
                [self drawOvalAtX:currentX andY:currentY];
                
            }
            
        }
        
    }
    

    
    // Complete the Line Drawing
    
    [self.lineStrokeColor setStroke];
    bezierPath.lineWidth = self.lineStrokeWidth;
    [bezierPath stroke];

    
    
    
    

}



#pragma mark - Math

- (void)computeBoundsAndScale {
    
    int count = (int) [self.dataToGraphArray count];
    int i;
    
    self.maxValue = -MAXFLOAT;
    self.minValue = MAXFLOAT;
    
    self.insetHorizontal = 10;
    self.insetVertical   = 10;
    
    
    
    float currentValue;

    
    for (i=0; i<count; i++) {
        
        currentValue = [[self.dataToGraphArray objectAtIndex:i] floatValue];
        
        if (currentValue < self.minValue) {
            
            self.minValue = currentValue;
            
        }
        
        if (currentValue > self.maxValue) {
            
            self.maxValue = currentValue;
            
        }
        
    }
    
    
    self.deltaValue = self.maxValue - self.minValue;
    
    self.scaleValue = (self.frame.size.height - self.insetVertical) / self.deltaValue;
    
    
}


- (float)computeYwithFloat:(float)value {
    

    float result;
    
    
    // magnitude == currentValue - minValue
    // drawValue == magnitude * scaleValue

    result = (value - self.minValue) * self.scaleValue;

    
    
    // flip the result to match the co-ordinate space
    // and translate vertically by half the inset value
    
    result = (self.frame.size.height - (self.insetVertical / 2)) - result;
    
    
    return result;
    
    
    
}




- (float)computeXwithIndex:(int)value {
    
    // not strictly necessary
    
    if ([self.dataToGraphArray count] < 1) { return 0; }
    
    
    
    // the main calculation
    
    float xScale = ( self.frame.size.width - self.insetHorizontal) / ([self.dataToGraphArray count] - 1);
    
    return (xScale * value) + (self.insetHorizontal / 2);
    
    
    
}


#pragma mark - Extra Drawing Functions

- (void)drawOvalAtX:(float)x andY:(float)y {
    
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(x - 2.5, y - 2.5, 5, 5)];
    [self.endPointColor setFill];
    [ovalPath fill];

    
    
}


@end
