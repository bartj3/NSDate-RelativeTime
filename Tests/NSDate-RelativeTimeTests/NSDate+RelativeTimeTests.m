#import "NSDate+RelativeTime.h"
#import "Kiwi.h"

SPEC_BEGIN(RelativeTimeSpec)

const uint MINUTE = 60;
const uint HOUR = 60*MINUTE;
const uint DAY = HOUR*24;
const uint WEEK = DAY*7;
const uint MONTH = DAY*30;
const uint YEAR = DAY*365;

describe(@"The NSDate class", ^{
    
    context(@"with a RelativeTime category", ^{
        
        it(@"should respond to the relativeTime method", ^{
            NSDate *date = [[NSDate alloc] init];
            [[date should] respondToSelector:@selector(relativeTime)];
        });
        
        it(@"should parse 2 seconds from now as Now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:2];
            
            [[[date relativeTime] should] equal:@"Now"];
        });
        
        it(@"should parse 2 seconds ago as Now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-2];
            
            [[[date relativeTime] should] equal:@"Now"];
        });
        
        it(@"should parse 20 seconds from now as 20 seconds from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:20];
            
            [[[date relativeTime] should] equal:@"20 seconds from now"];
        });
        
        it(@"should parse 20 seconds ago as 20 seconds ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-20];
            
            [[[date relativeTime] should] equal:@"20 seconds ago"];
        });
        
        it(@"should parse 1 minute from now as A minute from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:1*MINUTE];
            
            [[[date relativeTime] should] equal:@"A minute from now"];
        });
        
        it(@"should parse 1 minute ago as A minute ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-1*MINUTE];
            
            [[[date relativeTime] should] equal:@"A minute ago"];
        });
        
        it(@"should parse 12 minute from now as 12 minutes from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:12*MINUTE];
            
            [[[date relativeTime] should] equal:@"12 minutes from now"];
        });
        
        it(@"should parse 12 minute ago as A minute ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-12*MINUTE];
            
            [[[date relativeTime] should] equal:@"12 minutes ago"];
        });
        
        it(@"should parse 1 hour from now as An hour from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:1*HOUR];
            
            [[[date relativeTime] should] equal:@"An hour from now"];
        });
        
        it(@"should parse 1 hour ago as An hour ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-1*HOUR];
            
            [[[date relativeTime] should] equal:@"An hour ago"];
        });
    });
});

SPEC_END