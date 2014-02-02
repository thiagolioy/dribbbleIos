//
//  ShotCellSpec.m
//  DribbbleIos
//
//  Created by Thiago Lioy on 2/1/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//
#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "OCMock.h"
#import "Shot.h"
#import "ShotsListViewController.h"
#import "Factory.h"
#import "ShotCell.h"

SpecBegin(ShotCellSpec)

describe(@"ShotCell", ^{
    __block ShotsListViewController *_shotsVC;
    __block id _mockShotsService;
    __block id <UITableViewDataSource> _dataSource;
    __block ShotCell *_shotCell;
    
    beforeEach(^{
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"mainStoryboard" bundle:nil];
        UINavigationController *nav = [mainStoryboard instantiateInitialViewController];
        _shotsVC = (ShotsListViewController*)[nav visibleViewController];
        
        UIView *view = _shotsVC.view;
        expect(view).toNot.beNil();
        
        _mockShotsService = [OCMockObject mockForClass:[ShotsService class]];
        _shotsVC.shotsService = _mockShotsService;
        
        [[_mockShotsService stub] fetchShotsList:[OCMArg any] completion:[OCMArg checkWithBlock:^BOOL(FetchShotsListCompletionBlock block) {
            NSArray *shots = [Shot shotsWithDictArray:[NSArray arrayWithObjects:[Factory shotDict],[Factory shotDict], nil]];
            block(shots);
            return YES;
        }]];
        
        [_shotsVC viewDidLoad];
        _dataSource = _shotsVC.shotsTableView.dataSource;
        _shotCell = (ShotCell*)[_dataSource tableView:_shotsVC.shotsTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    });
    
    it(@"should have a imageView to display the shot image",^{
        expect(_shotCell.shotImageView).toNot.beNil();
    });
    it(@"should have a label to display the title",^{
        expect(_shotCell.titleLabel).toNot.beNil();
    });
    
    describe(@".fillShotCell", ^{
        beforeEach(^{
            Shot *newShot = [Shot new];
            newShot.title = @"Title";
            [_shotCell fillShotCell:newShot];
        });
        
        it(@"should fill the shotCell with the shot title",^{
            expect([_shotCell.titleLabel.text isEqualToString:@"Title"]).to.beTruthy();
        });
    });
});

SpecEnd

