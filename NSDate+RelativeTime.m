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
    BOOL future = ([self timeIntervalSinceDate:now] > 0);
    int deltaSeconds = fabs(lroundf([self timeIntervalSinceDate:now]));
    
    if(deltaSeconds < 5) {
        return @"Now";
    } else if(deltaSeconds < MINUTE) {
        return future ? [NSString stringWithFormat: @"%d seconds from now", deltaSeconds] : [NSString stringWithFormat: @"%d seconds ago", deltaSeconds];
    } else if(deltaSeconds < 2*MINUTE) {
        return future ? @"A minute from now" : @"A minute ago";
    } else if(deltaSeconds < HOUR) {
        return future ? [NSString stringWithFormat: @"%d minutes from now", deltaSeconds/MINUTE] : [NSString stringWithFormat: @"%d minutes ago", deltaSeconds/MINUTE];
    } else if(deltaSeconds < 2*HOUR) {
        return future ? @"An hour from now" : @"An hour ago";
    } else {
        return @"now";
    }
}

@end
