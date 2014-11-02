//
//  ViewController.m
//  sprklndemo
//
//  Created by edp on 11/2/14.
//  Copyright (c) 2014 edp. All rights reserved.
//

#import "ViewController.h"
#import "sparklineView.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet sparklineView *testSparkLineViewOutlet;



@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // make some very simple test data
    
    int numberOfDataPoints = 30;
    int magnitudeOfRandomness = 10;


    NSMutableArray *workingMutableArray = [[NSMutableArray alloc] init];
    float randomOffset;
    int i;

    
    
    for (i=0; i<numberOfDataPoints; i++) {
        
        randomOffset  = arc4random() % magnitudeOfRandomness;
        randomOffset -= magnitudeOfRandomness / 2;
        
        NSNumber *number = [NSNumber numberWithInt:((2 * i) + randomOffset)];
        
        [workingMutableArray addObject:number];
        
    }
    
    
    
    
    // configuration of sparklineView
    
    // takes data in the form of an NSArray of NSNumbers (interpreted at floatValues)
    
    [self.testSparkLineViewOutlet setDataToGraphArray:workingMutableArray];
    
    
    
    // some color parameters
    
    [self.testSparkLineViewOutlet setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.02]];
    [self.testSparkLineViewOutlet setLineStrokeColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.2 alpha:1.0]];
    [self.testSparkLineViewOutlet setEndPointColor:[UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0]];
    [self.testSparkLineViewOutlet setOvalDiameter:5];

    
    // redraw
    
    [self.testSparkLineViewOutlet setNeedsDisplay];
    
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end






