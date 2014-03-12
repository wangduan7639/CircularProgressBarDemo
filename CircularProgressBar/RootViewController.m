//
//  RootViewController.m
//  CircularProgressBar
//
//  Created by wangduan on 14-3-11.
//  Copyright (c) 2014年 wxcp. All rights reserved.
//

#import "RootViewController.h"
#import "CircProgressBar.h"

@interface RootViewController ()
{
    CircProgressBar  * _circProgressBar;
}
@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    CGRect frame = CGRectMake(50, 100, 200, 200);
    _circProgressBar = [[CircProgressBar alloc] initWithFrame:frame];
    
    _circProgressBar.progressCurrent = .01;
    _circProgressBar.thickness = 30;
    _circProgressBar.backgroundColor = [UIColor whiteColor];
    _circProgressBar.completedColor = [UIColor blueColor];
    _circProgressBar.incompletedColor = [UIColor lightGrayColor];
    [self.view addSubview:_circProgressBar];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerGo:) userInfo:nil repeats:YES];
}
- (void)timerGo:(NSTimer *)aTimer
{
    if (_circProgressBar.progressCurrent >=1.0) {
        _circProgressBar.progressCurrent = 0.01;
        [_circProgressBar setNeedsDisplay];    }
    else
    {
        _circProgressBar.progressCurrent += 0.02;
        [_circProgressBar setNeedsDisplay];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
