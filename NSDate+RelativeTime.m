//
//  NSDate+RelativeTime.m
//  NSDate-RelativeTime
//
//  Created by Bart van Zon on 10/20/13.
//  Copyright (c) 2013 Bart van Zon. All rights reserved.
//

#import "NSDate+RelativeTime.h"

@interface NSDate_RelativeTime : NSObject

+(NSString *)localizedString:(NSString *)key;

@end

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
    NSDate *currentDate = [NSDate date];
    long deltaSeconds = labs(lroundf([self timeIntervalSinceDate:currentDate]));
    BOOL dateInFuture = ([self timeIntervalSinceDate:currentDate] > 0);
    
    if(deltaSeconds < 2*SECOND) {
        return [NSDate_RelativeTime localizedString: @"Now"];
    } else if(deltaSeconds < MINUTE) {
        return [self formattedStringForCurrentDate:currentDate count:deltaSeconds past:@"%d seconds ago" future:@"%d seconds from now"];
    } else if(deltaSeconds < 1.5*MINUTE) {
        return !dateInFuture ? [NSDate_RelativeTime localizedString: @"A minute ago"] : [NSDate_RelativeTime localizedString: @"A minute from now"];
    } else if(deltaSeconds < HOUR) {
        int minutes = (int)lroundf((float)deltaSeconds/(float)MINUTE);
        return [self formattedStringForCurrentDate:currentDate count:minutes past:@"%d minutes ago" future:@"%d minutes from now"];
    } else if(deltaSeconds < 1.5*HOUR) {
        return !dateInFuture ? [NSDate_RelativeTime localizedString: @"An hour ago"] : [NSDate_RelativeTime localizedString: @"An hour from now"];
    } else if(deltaSeconds < DAY) {
        int hours = (int)lroundf((float)deltaSeconds/(float)HOUR);
        return [self formattedStringForCurrentDate:currentDate count:hours past:@"%d hours ago" future:@"%d hours from now"];
    } else if(deltaSeconds < 1.5*DAY) {
        return !dateInFuture ? [NSDate_RelativeTime localizedString: @"A day ago"] : [NSDate_RelativeTime localizedString: @"A day from now"];
    } else if(deltaSeconds < WEEK) {
        int days = (int)lroundf((float)deltaSeconds/(float)DAY);
        return [self formattedStringForCurrentDate:currentDate count:days past:@"%d days ago" future:@"%d days from now"];
    } else if(deltaSeconds < 1.5*WEEK) {
        return !dateInFuture ? [NSDate_RelativeTime localizedString: @"A week ago"] : [NSDate_RelativeTime localizedString: @"A week from now"];
    } else if(deltaSeconds < MONTH) {
        int weeks = (int)lroundf((float)deltaSeconds/(float)WEEK);
        return [self formattedStringForCurrentDate:currentDate count:weeks past:@"%d weeks ago" future:@"%d weeks from now"];
    } else if(deltaSeconds < 1.5*MONTH) {
        return !dateInFuture ? [NSDate_RelativeTime localizedString: @"A month ago"] : [NSDate_RelativeTime localizedString: @"A month from now"];
    } else if(deltaSeconds < YEAR) {
        int months = (int)lroundf((float)deltaSeconds/(float)MONTH);
        return [self formattedStringForCurrentDate:currentDate count:months past:@"%d months ago" future:@"%d months from now"];
    } else if(deltaSeconds < 1.5*YEAR) {
        return !dateInFuture ? [NSDate_RelativeTime localizedString: @"A year ago"] : [NSDate_RelativeTime localizedString: @"A year from now"];
    } else {
        int years = (int)lroundf((float)deltaSeconds/(float)YEAR);
        return [self formattedStringForCurrentDate:currentDate count:years past:@"%d years ago" future:@"%d years from now"];
    }
}

-(NSString *)formattedStringForCurrentDate:(NSDate *)currentDate count:(long)count past:(NSString *)past future:(NSString *)future
{
    if ([self timeIntervalSinceDate:currentDate] > 0) {
        return [NSString stringWithFormat: [NSDate_RelativeTime localizedString: future], count];
    } else {
        return [NSString stringWithFormat: [NSDate_RelativeTime localizedString: past], count];
    }
}

@end

@implementation NSDate_RelativeTime

+(NSString *)localizedString:(NSString *)key
{
    static NSBundle *bundle;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bundle = [NSBundle bundleWithPath:[[[NSBundle bundleForClass:self] resourcePath] stringByAppendingPathComponent:@"NSDate+RelativeTime.bundle"]];
    });
    return NSLocalizedStringFromTableInBundle(key, @"NSDate+RelativeTime", bundle, nil);
}

@end
