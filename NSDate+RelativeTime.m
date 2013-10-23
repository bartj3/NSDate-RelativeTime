//
//  NSDate+RelativeTime.m
//  NSDate-RelativeTime
//
//  Created by Bart van Zon on 10/20/13.
//  Copyright (c) 2013 Bart van Zon. All rights reserved.
//

#import "NSDate+RelativeTime.h"

@implementation NSDate (RelativeTime)

const uint MINUTE = 60;
const uint HOUR = 60*MINUTE;
const uint DAY = HOUR*24;
const uint WEEK = DAY*7;
const uint MONTH = DAY*30;
const uint YEAR = DAY*365;

-(NSString *)relativeTime
{
    NSDate *now = [NSDate date];
    double deltaSeconds = fabs([self timeIntervalSinceDate:now]);
    
    return @"now";
}

@end
