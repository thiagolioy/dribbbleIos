//
//  ShotsListViewControllerSpec.m
//  DribbbleIos
//
//  Created by Thiago Lioy on 1/30/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//
#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "OCMock.h"
#import "ShotsListViewController.h"


SpecBegin(ShotsListViewControllerSpec)

describe(@"ShotsListViewController", ^{
    
    
    it(@"should be instantiated from the storyboard",^{
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"mainStoryboard" bundle:nil];
        UINavigationController *nav = [mainStoryboard instantiateInitialViewController];
        ShotsListViewController *vc = (ShotsListViewController*)[nav visibleViewController];
        expect(vc).toNot.beNil();
    });
   
});

SpecEnd
