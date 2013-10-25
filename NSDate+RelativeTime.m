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
const uint MONTH = WEEK*4;
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
    } else if(deltaSeconds < 1.5*MINUTE) {
        return future ? @"A minute from now" : @"A minute ago";
    } else if(deltaSeconds < HOUR) {
        return future ? [NSString stringWithFormat: @"%ld minutes from now", lroundf((float)deltaSeconds/(float)MINUTE)] : [NSString stringWithFormat: @"%ld minutes ago", lroundf((float)deltaSeconds/(float)MINUTE)];
    } else if(deltaSeconds < 1.5*HOUR) {
        return future ? @"An hour from now" : @"An hour ago";
    } else if(deltaSeconds < DAY) {
        return future ? [NSString stringWithFormat: @"%ld hours from now", lroundf((float)deltaSeconds/(float)HOUR)] : [NSString stringWithFormat: @"%ld hours ago", lroundf((float)deltaSeconds/(float)HOUR)];
    } else if(deltaSeconds < 1.5*DAY) {
        return future ? @"A day from now" : @"A day ago";
    } else if(deltaSeconds < WEEK) {
        return future ? [NSString stringWithFormat: @"%ld days from now", lroundf((float)deltaSeconds/(float)DAY)] : [NSString stringWithFormat: @"%ld days ago", lroundf((float)deltaSeconds/(float)DAY)];
    } else if(deltaSeconds < 1.5*WEEK) {
        return future ? @"A week from now" : @"A week ago";
    } else if(deltaSeconds < MONTH) {
        return future ? [NSString stringWithFormat: @"%ld weeks from now", lroundf((float)deltaSeconds/(float)WEEK)] : [NSString stringWithFormat: @"%ld weeks ago", lroundf((float)deltaSeconds/(float)WEEK)];
    } else if(deltaSeconds < 1.5*MONTH) {
        return future ? @"A month from now" : @"A month ago";
    } else if(deltaSeconds < YEAR) {
        return future ? [NSString stringWithFormat: @"%ld months from now", lroundf((float)deltaSeconds/(float)MONTH)] : [NSString stringWithFormat: @"%ld months ago", lroundf((float)deltaSeconds/(float)MONTH)];
    } else {
        return @"now";
    }
}

@end
