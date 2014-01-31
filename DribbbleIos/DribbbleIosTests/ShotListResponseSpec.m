//
//  ShotListResponseSpec.m
//  DribbbleIos
//
//  Created by Thiago Lioy on 1/30/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "ShotsListResponse.h"
#import "Factory.h"

SpecBegin(ShotListResponseSpec)

describe(@"ShotListResponse", ^{
    
    describe(@".shotsListResponseWithDict", ^{
        __block ShotsListResponse *response;
        beforeEach(^{
            response = [ShotsListResponse shotsListResponseWithDict:[Factory shotListResponseDict]];
        });
        
        it(@"should be instantiated from a json dictionary",^{
            expect(response).notTo.beNil();
        });
        
        it(@"should have a page",^{
            expect(response.page).notTo.beNil();
        });
        
        it(@"should have a pages",^{
            expect(response.pages).notTo.beNil();
        });
        
        it(@"should have a total",^{
            expect(response.total).notTo.beNil();
        });
        
        it(@"should have a per page",^{
            expect(response.perPage).notTo.beNil();
        });
        
        it(@"should have an empty shots array",^{
            expect(response.shots).notTo.beNil();
            expect(response.shots.count == 0).to.beTruthy();
        });
        
    });
});
SpecEnd