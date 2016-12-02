//
//  WeatherDataParser.h
//  WeatherForcast
//
//  Created by shirish gone on 23/11/16.
//  Copyright © 2016 Shirish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherDataParser : NSObject

+ (instancetype)sharedInstance;
- (NSArray *)parseWeatherData:(NSData *)data;
@end
