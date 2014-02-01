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
        
        describe(@"shotsTableView", ^{
            it(@"should have 2 rows after load mock data",^{
               id mockShotsService = [OCMockObject mockForClass:[ShotsService class]];
                //Setter Injection
                shotsVC.shotsService = mockShotsService;
                
                [[mockShotsService stub] fetchShotsList:[OCMArg any] completion:[OCMArg checkWithBlock:^BOOL(FetchShotsListCompletionBlock block) {
                    NSArray *shots = [Shot shotsWithDictArray:[NSArray arrayWithObjects:[Factory shotDict],[Factory shotDict], nil]];
                    block(shots);
                    return YES;
                }]];
                
                //Act
                [shotsVC viewDidLoad];
                
                [mockShotsService verify];
                id <UITableViewDataSource> dataSource = shotsVC.shotsTableView.dataSource;
                expect([dataSource tableView:shotsVC.shotsTableView numberOfRowsInSection:0] == 2).to.beTruthy();
            });
        });
        
    });
    
});

SpecEnd
