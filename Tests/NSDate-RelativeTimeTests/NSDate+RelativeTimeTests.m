#import "NSDate+RelativeTime.h"
#import "Kiwi.h"

SPEC_BEGIN(RelativeTimeSpec)

const int SECOND = 1;
const int MINUTE = 60*SECOND;
const int HOUR = 60*MINUTE;
const int DAY = HOUR*24;
const int WEEK = DAY*7;
const int MONTH = WEEK*4;
const int YEAR = DAY*365;

describe(@"The NSDate class", ^{
    
    context(@"with a RelativeTime category", ^{
        
        it(@"should respond to the relativeTime method", ^{
            NSDate *date = [[NSDate alloc] init];
            [[date should] respondToSelector:@selector(relativeTime)];
        });
        
        it(@"should parse 2 seconds from now as Now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:2*SECOND];
            
            [[[date relativeTime] should] equal:@"Now"];
        });
        
        it(@"should parse 2 seconds ago as Now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-2*SECOND];
            
            [[[date relativeTime] should] equal:@"Now"];
        });
        
        it(@"should parse 59 seconds from now as 59 seconds from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:59*SECOND];
            
            [[[date relativeTime] should] equal:@"59 seconds from now"];
        });
        
        it(@"should parse 59 seconds ago as 59 seconds ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-59*SECOND];
            
            [[[date relativeTime] should] equal:@"59 seconds ago"];
        });
        
        it(@"should parse 1 minute from now as A minute from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:1*MINUTE];
            
            [[[date relativeTime] should] equal:@"A minute from now"];
        });
        
        it(@"should parse 1 minute ago as A minute ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-1*MINUTE];
            
            [[[date relativeTime] should] equal:@"A minute ago"];
        });
        
        it(@"should parse 89 seconds from now as A minute from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:89*SECOND];
            
            [[[date relativeTime] should] equal:@"A minute from now"];
        });
        
        it(@"should parse 89 minute ago as A minute ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-89*SECOND];
            
            [[[date relativeTime] should] equal:@"A minute ago"];
        });
        
        it(@"should parse 90 seconds from now as 2 minutes from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:90*SECOND];
            
            [[[date relativeTime] should] equal:@"2 minutes from now"];
        });
        
        it(@"should parse 90 minute ago as 2 minutes ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-90*SECOND];
            
            [[[date relativeTime] should] equal:@"2 minutes ago"];
        });
        
        it(@"should parse 59 minutes from now as 59 minutes from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:59*MINUTE];
            
            [[[date relativeTime] should] equal:@"59 minutes from now"];
        });
        
        it(@"should parse 59 minutes ago as A minute ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-59*MINUTE];
            
            [[[date relativeTime] should] equal:@"59 minutes ago"];
        });
        
        it(@"should parse 1 hour from now as An hour from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:1*HOUR];
            
            [[[date relativeTime] should] equal:@"An hour from now"];
        });
        
        it(@"should parse 1 hour ago as An hour ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-1*HOUR];
            
            [[[date relativeTime] should] equal:@"An hour ago"];
        });
        
        it(@"should parse 20 hours from now as 20 hours from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:20*HOUR];
            
            [[[date relativeTime] should] equal:@"20 hours from now"];
        });
        
        it(@"should parse 20 hours ago as 20 hours ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-20*HOUR];
            
            [[[date relativeTime] should] equal:@"20 hours ago"];
        });
        
        it(@"should parse 1 day from now as A day from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:1*DAY];
            
            [[[date relativeTime] should] equal:@"A day from now"];
        });
        
        it(@"should parse 1 day ago as A day ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-1*DAY];
            
            [[[date relativeTime] should] equal:@"A day ago"];
        });
        
        it(@"should parse 6 days from now as 6 days from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:6*DAY];
            
            [[[date relativeTime] should] equal:@"6 days from now"];
        });
        
        it(@"should parse 6 days ago as 6 days ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-6*DAY];
            
            [[[date relativeTime] should] equal:@"6 days ago"];
        });
    });
});

SPEC_END