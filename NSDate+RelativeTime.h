//
//  NSDate+RelativeTime.h
//  NSDate-RelativeTime
//
//  Created by Bart van Zon on 10/20/13.
//  Copyright (c) 2013 Bart van Zon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (RelativeTime)

typedef NS_OPTIONS(NSUInteger, RTTimeMask)
{
    RTTimeMaskNone = 0,
    RTTimeMaskSeconds = 1 << 1,
    RTTimeMaskMinutes = 1 << 2,
    RTTimeMaskHours = 1 << 3,
    RTTimeMaskDays = 1 << 4,
    RTTimeMaskWeeks = 1 << 5,
    RTTimeMaskMonths = 1 << 6
    
};

-(NSString *)relativeTime;
-(NSString *)relativeTimeWithMask:(RTTimeMask)mask;

@end
