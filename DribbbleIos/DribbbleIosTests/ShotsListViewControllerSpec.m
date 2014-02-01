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
#import "Shot.h"
#import "Factory.h"

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
    
    it(@"should have a datasource wired on the shots tableview", ^{
        expect(shotsVC.shotsTableView.dataSource).toNot.beNil();
    });
    
    it(@"should have a delegate wired on the shots tableview", ^{
        expect(shotsVC.shotsTableView.delegate).toNot.beNil();
    });
    it(@"should have a default shots service",^{
        expect(shotsVC.shotsService).notTo.beNil();
    });
    
    describe(@"load shots data", ^{
        __block id _mockShotsService;
        
        beforeEach(^{
            _mockShotsService = [OCMockObject mockForClass:[ShotsService class]];
            shotsVC.shotsService = _mockShotsService;
        });
        
        afterEach(^{
            [_mockShotsService verify];
        });
        
        it(@"should load data on view did load using shots service", ^{
            [[_mockShotsService expect] fetchShotsList:[OCMArg any] completion:[OCMArg any]];
            [shotsVC viewDidLoad];
        });
        
        it(@"should have 2 rows after load mock data",^{
            [[_mockShotsService stub] fetchShotsList:[OCMArg any] completion:[OCMArg checkWithBlock:^BOOL(FetchShotsListCompletionBlock block) {
                NSArray *shots = [Shot shotsWithDictArray:[NSArray arrayWithObjects:[Factory shotDict],[Factory shotDict], nil]];
                block(shots);
                return YES;
            }]];
            
            [shotsVC viewDidLoad];
            
            id <UITableViewDataSource> dataSource = shotsVC.shotsTableView.dataSource;
            expect([dataSource tableView:shotsVC.shotsTableView numberOfRowsInSection:0] == 2).to.beTruthy();
        });
        
        
    });
    
});

SpecEnd
