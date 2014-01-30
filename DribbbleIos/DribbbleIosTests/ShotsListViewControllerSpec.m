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
#import "ShotsService.h"

SpecBegin(ShotsListViewControllerSpec)

describe(@"ShotsListViewController", ^{
    __block ShotsListViewController *shotsVC;
    beforeEach(^{
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"mainStoryboard" bundle:nil];
        UINavigationController *nav = [mainStoryboard instantiateInitialViewController];
        shotsVC = (ShotsListViewController*)[nav visibleViewController];
        
        UIView *view = shotsVC.view;
        expect(view).toNot.beNil();
    });
    
    
    it(@"should be instantiated from the storyboard",^{
        expect(shotsVC).toNot.beNil();
        expect(shotsVC).to.beInstanceOf([ShotsListViewController class]);
    });
   
    
    it(@"should have an outlet for the shots tableview", ^{
        expect(shotsVC.shotsTableView).toNot.beNil();
    });
    
    describe(@"load shots data", ^{
        it(@"should have a default shots service",^{
            expect(shotsVC.shotsService).notTo.beNil();
        });
        
        it(@"should load data with the shots service", ^{
            //Arrange
            id mockShotsService = [OCMockObject mockForClass:[ShotsService class]];
            [[mockShotsService expect] fetchShotsList:[OCMArg any] completion:[OCMArg any]];
            
            //Setter Injection
            shotsVC.shotsService = mockShotsService;
            
            //Act
            [shotsVC viewDidLoad];
            
            //assert
            [mockShotsService verify];
        });
    });
    
});

SpecEnd
