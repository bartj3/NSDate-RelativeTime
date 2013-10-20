#import "NSDate+RelativeTime.h"
#import "Kiwi.h"

SPEC_BEGIN(RelativeTimeSpec)

describe(@"The NSDate class", ^{
    __block NSDate *date;
    
    beforeEach(^{
        date = [[NSDate alloc] init];
    });
    
    context(@"with a RelativeTime category", ^{
        
        it(@"should respond to the relativeTime method", ^{
            [[date should] respondToSelector:@selector(relativeTime)];
        });
    });
});

SPEC_END