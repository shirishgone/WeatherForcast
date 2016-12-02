//
//  DataEngine.m
//  WeatherForcast
//
//  Created by shirish gone on 23/11/16.
//  Copyright © 2016 Shirish. All rights reserved.
//

#import "DataEngine.h"
#import "WeatherDataParser.h"

@implementation DataEngine

+ (instancetype)sharedInstance {
    static DataEngine *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DataEngine alloc] init];
    });
    return sharedInstance;
}

- (void)fetchWeatherRecords:(void (^)(NSArray *records))completion {

    NSMutableArray *records = [[NSMutableArray alloc] init];
    NSString *url = @"http://api.openweathermap.org/data/2.5/forecast/daily?q=London&units=metric&cnt=17&appid=c87d3c85497bdd80ce287079cc2b4a1c";
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:url]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                // handle response
                if (error == nil)
                {
                    NSArray *responseArray = [[WeatherDataParser sharedInstance] parseWeatherData:data];
                    [records addObjectsFromArray:responseArray];
                    completion(records);
                }else{
                    completion(records);
                }
                
            }] resume];
}

@end
