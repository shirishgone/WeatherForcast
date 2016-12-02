//
//  WeatherDataParser.m
//  WeatherForcast
//
//  Created by shirish gone on 23/11/16.
//  Copyright © 2016 Shirish. All rights reserved.
//

#import "WeatherDataParser.h"
#import "Weather.h"

@implementation WeatherDataParser

+ (instancetype)sharedInstance {
    static WeatherDataParser *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WeatherDataParser alloc] init];
    });
    return sharedInstance;
}

- (NSArray *)parseWeatherData:(NSData *)data {
    NSMutableArray *results = [[NSMutableArray alloc] init];
    
    id completeResponse = [NSJSONSerialization JSONObjectWithData:data
                                                          options:NSJSONReadingAllowFragments error:nil];
    NSArray *list = [completeResponse valueForKey:@"list"];
    NSLog(@"Results : %@", results);
    
    for (NSDictionary *listItem in list) {
        NSString *mainString = [[[listItem valueForKey:@"weather"] objectAtIndex:0] valueForKey:@"main"];
        NSString *descriptionString = [[[listItem valueForKey:@"weather"] objectAtIndex:0] valueForKey:@"description"];
        
        Weather *weatherItem = [[Weather alloc] init];
        weatherItem.mainDescription = mainString;
        weatherItem.shortDescription = descriptionString;
    
        [results addObject:weatherItem];
    }
    return results;

}

@end
