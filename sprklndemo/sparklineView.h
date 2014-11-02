//
//  sparklineView.h
//  sprklndemo
//
//  Created by edp on 11/2/14.
//  Copyright (c) 2014 edp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sparklineView : UIView


// numerical data to graph

@property (strong,nonatomic) NSArray *dataToGraphArray;





// graphical properties

@property (strong,nonatomic) UIColor *lineStrokeColor;
@property (strong,nonatomic) UIColor *endPointColor;

@property (nonatomic) float lineStrokeWidth;
@property (nonatomic) float ovalDiameter;






@end
