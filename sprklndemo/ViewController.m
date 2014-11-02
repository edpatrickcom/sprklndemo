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

    NSMutableArray *workingMutableArray = [[NSMutableArray alloc] init];
    
    int i;
    float randomOffset;
    
    for (i=0; i<51; i++) {
        
        randomOffset  = arc4random() % 30;
        randomOffset -= 15;
        
        NSNumber *number = [NSNumber numberWithInt:((2 * i) + 50 + randomOffset)];
        
        [workingMutableArray addObject:number];
        
    }
    
    
    
    [self.testSparkLineViewOutlet setDataToGraphArray:workingMutableArray];
    [self.testSparkLineViewOutlet setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.02]];
    [self.testSparkLineViewOutlet setNeedsDisplay];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end






