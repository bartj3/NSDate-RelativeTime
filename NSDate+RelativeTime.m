//
//  NSDate+RelativeTime.m
//  NSDate-RelativeTime
//
//  Created by Bart van Zon on 10/20/13.
//  Copyright (c) 2013 Bart van Zon. All rights reserved.
//

#import "NSDate+RelativeTime.h"

@implementation NSDate (RelativeTime)

const int SECOND = 1;
const int MINUTE = 60*SECOND;
const int HOUR = 60*MINUTE;
const int DAY = HOUR*24;
const int WEEK = DAY*7;
const int MONTH = WEEK*4;
const int YEAR = DAY*365;

-(NSString *)relativeTime
{
    return [self relativeTimeWithMask:RTTimeMaskSeconds|RTTimeMaskMinutes|RTTimeMaskHours|RTTimeMaskDays|RTTimeMaskWeeks|RTTimeMaskMonths];
}

-(NSString *)relativeTimeWithMask:(RTTimeMask)mask
{
    NSDate *currentDate = [NSDate date];
    int deltaSeconds = fabs(lroundf([self timeIntervalSinceDate:currentDate]));
    BOOL dateInFuture = ([self timeIntervalSinceDate:currentDate] > 0);
    
    if(mask & RTTimeMaskSeconds && deltaSeconds < 2*SECOND) {
        return [self NSDateRelativeTimeLocalizedStrings: @"Now"];
    } else if(mask & RTTimeMaskSeconds && deltaSeconds < MINUTE) {
        return [self formattedStringForCurrentDate:currentDate count:deltaSeconds past:@"%d seconds ago" future:@"%d seconds from now"];
    } else if(mask & RTTimeMaskMinutes && deltaSeconds < 1.5*MINUTE) {
        return !dateInFuture ? [self NSDateRelativeTimeLocalizedStrings: @"A minute ago"] : [self NSDateRelativeTimeLocalizedStrings: @"A minute from now"];
    } else if(mask & RTTimeMaskMinutes && deltaSeconds < HOUR) {
        int minutes = (int)lroundf((float)deltaSeconds/(float)MINUTE);
        return [self formattedStringForCurrentDate:currentDate count:minutes past:@"%d minutes ago" future:@"%d minutes from now"];
    } else if(mask & RTTimeMaskHours && deltaSeconds < 1.5*HOUR) {
        return !dateInFuture ? [self NSDateRelativeTimeLocalizedStrings: @"An hour ago"] : [self NSDateRelativeTimeLocalizedStrings: @"An hour from now"];
    } else if(mask & RTTimeMaskHours && deltaSeconds < DAY) {
        int hours = (int)lroundf((float)deltaSeconds/(float)HOUR);
        return [self formattedStringForCurrentDate:currentDate count:hours past:@"%d hours ago" future:@"%d hours from now"];
    } else if(mask & RTTimeMaskDays && deltaSeconds < 1.5*DAY) {
        return !dateInFuture ? [self NSDateRelativeTimeLocalizedStrings: @"A day ago"] : [self NSDateRelativeTimeLocalizedStrings: @"A day from now"];
    } else if(mask & RTTimeMaskDays && deltaSeconds < WEEK) {
        int days = (int)lroundf((float)deltaSeconds/(float)DAY);
        return [self formattedStringForCurrentDate:currentDate count:days past:@"%d days ago" future:@"%d days from now"];
    } else if(mask & RTTimeMaskWeeks && deltaSeconds < 1.5*WEEK) {
        return !dateInFuture ? [self NSDateRelativeTimeLocalizedStrings: @"A week ago"] : [self NSDateRelativeTimeLocalizedStrings: @"A week from now"];
    } else if(mask & RTTimeMaskWeeks && deltaSeconds < MONTH) {
        int weeks = (int)lroundf((float)deltaSeconds/(float)WEEK);
        return [self formattedStringForCurrentDate:currentDate count:weeks past:@"%d weeks ago" future:@"%d weeks from now"];
    } else if(mask & RTTimeMaskMonths && deltaSeconds < 1.5*MONTH) {
        return !dateInFuture ? [self NSDateRelativeTimeLocalizedStrings: @"A month ago"] : [self NSDateRelativeTimeLocalizedStrings: @"A month from now"];
    } else if(mask & RTTimeMaskMonths && deltaSeconds < YEAR) {
        int months = (int)lroundf((float)deltaSeconds/(float)MONTH);
        return [self formattedStringForCurrentDate:currentDate count:months past:@"%d months ago" future:@"%d months from now"];
    } else if(deltaSeconds < 1.5*YEAR) {
        return !dateInFuture ? [self NSDateRelativeTimeLocalizedStrings: @"A year ago"] : [self NSDateRelativeTimeLocalizedStrings: @"A year from now"];
    } else {
        int years = (int)lroundf((float)deltaSeconds/(float)YEAR);
        return [self formattedStringForCurrentDate:currentDate count:years past:@"%d years ago" future:@"%d years from now"];
    }
}

-(NSString *)formattedStringForCurrentDate:(NSDate *)currentDate count:(int)count past:(NSString *)past future:(NSString *)future
{
    if ([self timeIntervalSinceDate:currentDate] > 0) {
        return [NSString stringWithFormat: [self NSDateRelativeTimeLocalizedStrings: future], count];
    } else {
        return [NSString stringWithFormat: [self NSDateRelativeTimeLocalizedStrings: past], count];
    }
}

-(NSString *)NSDateRelativeTimeLocalizedStrings:(NSString *)key
{
    return NSLocalizedStringFromTableInBundle(key, @"NSDate+RelativeTime", [NSBundle bundleWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"NSDate+RelativeTime.bundle"]], nil);
}

@end
