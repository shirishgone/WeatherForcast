//
//  ViewController.m
//  WeatherForcast
//
//  Created by shirish gone on 23/11/16.
//  Copyright © 2016 Shirish. All rights reserved.
//

#import "ViewController.h"
#import "DataEngine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[DataEngine sharedInstance] fetchWeatherRecords:^(NSArray *records) {
        NSLog(@"Results: %@", records);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
