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
        
        it(@"should parse 1 second from now as Now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:SECOND];
            
            [[[date relativeTime] should] equal:@"Now"];
        });
        
        it(@"should parse 1 second ago as Now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-SECOND];
            
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
        
        it(@"should parse 1 week from now as A week from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:1*WEEK];
            
            [[[date relativeTime] should] equal:@"A week from now"];
        });
        
        it(@"should parse 1 week ago as A week ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-1*WEEK];
            
            [[[date relativeTime] should] equal:@"A week ago"];
        });
        
        it(@"should parse 3 weeks from now as 3 weeks from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:3*WEEK];
            
            [[[date relativeTime] should] equal:@"3 weeks from now"];
        });
        
        it(@"should parse 3 weeks ago as 3 weeks ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-3*WEEK];
            
            [[[date relativeTime] should] equal:@"3 weeks ago"];
        });
        
        it(@"should parse 1 month from now as A month from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:1*MONTH];
            
            [[[date relativeTime] should] equal:@"A month from now"];
        });
        
        it(@"should parse 1 month ago as A month ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-1*MONTH];
            
            [[[date relativeTime] should] equal:@"A month ago"];
        });
        
        it(@"should parse 11 months from now as 11 months from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:11*MONTH];
            
            [[[date relativeTime] should] equal:@"11 months from now"];
        });
        
        it(@"should parse 11 months ago as 11 months ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-11*MONTH];
            
            [[[date relativeTime] should] equal:@"11 months ago"];
        });
        
        it(@"should parse 1 year from now as A year from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:1*YEAR];
            
            [[[date relativeTime] should] equal:@"A year from now"];
        });
        
        it(@"should parse 1 year ago as A month ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-1*YEAR];
            
            [[[date relativeTime] should] equal:@"A year ago"];
        });
        
        it(@"should parse 11 years from now as 11 years from now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:11*YEAR];
            
            [[[date relativeTime] should] equal:@"11 years from now"];
        });
        
        it(@"should parse 11 years ago as 11 years ago", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-11*YEAR];
            
            [[[date relativeTime] should] equal:@"11 years ago"];
        });
        
        it(@"should translate the relative time", ^{
            //pending
        });
        
    });
    
});

SPEC_END