#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "OCMock.h"
#import "Dummy.h"

SpecBegin(DribbbleIosSpec)

describe(@"First Test", ^{
    
    it(@"should have an outlet for the password field", ^{
        expect([Dummy returnsTrue]).to.beTruthy();
    });
});

SpecEnd


