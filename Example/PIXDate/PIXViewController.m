//
//  PIXViewController.m
//  PIXDate
//
//  Created by dolphin su on 07/24/2014.
//  Copyright (c) 2014 dolphin su. All rights reserved.
//

#import "PIXViewController.h"
#import "NSDate+PIXCategory.h"

@interface PIXViewController ()

@end

@implementation PIXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    for (int i=0; i<100; i++) {
        NSDate *thisDate = [NSDate dateWithTimeIntervalSinceNow:(-1*((double)(arc4random()%60*60*24*365*2)))];
        NSTimeInterval thisInterval = [thisDate timeIntervalSince1970];
        NSString *thisDateString = [NSDate PIXTimeIntervalStringDistanceNowFromTimeInterval1970:thisInterval];
        NSLog(@"this date: %@", [thisDate description]);
        NSLog(@"this date String: %@", thisDateString);
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
