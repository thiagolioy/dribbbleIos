#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "OCMock.h"

SpecBegin(DribbbleIosSpec)

describe(@"First Test", ^{
    
    it(@"should have an outlet for the password field", ^{
        NSString *newString = @"NewString";
        expect(newString).toNot.beNil();
    });
});

SpecEnd


