//
//  Temperature.h
//  WeatherForcast
//
//  Created by shirish gone on 23/11/16.
//  Copyright © 2016 Shirish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Temperature : NSObject

@property (nonatomic, readwrite) double day;
@property (nonatomic, readwrite) double min;
@property (nonatomic, readwrite) double max;
@property (nonatomic, readwrite) double night;
@property (nonatomic, readwrite) double eve;
@property (nonatomic, readwrite) double morn;

@end
