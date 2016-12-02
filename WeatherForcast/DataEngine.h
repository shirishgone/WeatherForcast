//
//  DataEngine.h
//  WeatherForcast
//
//  Created by shirish gone on 23/11/16.
//  Copyright © 2016 Shirish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataEngine : NSObject
+ (instancetype)sharedInstance ;
- (void)fetchWeatherRecords:(void (^)(NSArray *records))completion ;
@end
