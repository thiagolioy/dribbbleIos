//
//  ShotSpec.m
//  DribbbleIos
//
//  Created by Thiago Lioy on 1/30/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "Shot.h"
#import "Factory.h"

SpecBegin(ShotSpec)

describe(@"Shot", ^{
    
    describe(@".shotWithDict", ^{
        __block Shot *shot;
        beforeEach(^{
            shot = [Shot shotWithDict:[Factory shotDict]];
        });
        
        it(@"should be instantiated from a json dictionary",^{
            expect(shot).notTo.beNil();
        });
        
        it(@"should have a shotID",^{
            expect(shot.shotID).notTo.beNil();
        });
        
        it(@"should have a shotID",^{
            expect(shot.shotID).notTo.beNil();
        });
        
        it(@"should have a title",^{
            expect(shot.title).notTo.beNil();
        });
        
        it(@"should have a imageUrl",^{
            expect(shot.imageUrl).notTo.beNil();
        });
        
        it(@"should have a imageTeaserUrl",^{
            expect(shot.imageTeaserUrl).notTo.beNil();
        });
        
        it(@"should have a image400Url",^{
            expect(shot.image400Url).notTo.beNil();
        });
    
    
    });
    
    describe(@".shotsWithDictArray", ^{
        __block NSArray *shots;
        
        beforeEach(^{
            NSArray *array = [NSArray arrayWithObjects:[Factory shotDict],[Factory shotDict], nil];
            shots = [Shot shotsWithDictArray:array];
        });
        
        it(@"should be instantiated from an array of dictionaries",^{
            expect(shots).notTo.beNil();
        });
        
        it(@"should have 2 shots inside array",^{
            expect(shots.count == 2).to.beTruthy();
        });
        
        it(@"should be instance of a Shot class",^{
            expect(shots[0]).to.beInstanceOf([Shot class]);
        });
    });
    
    
});

SpecEnd
