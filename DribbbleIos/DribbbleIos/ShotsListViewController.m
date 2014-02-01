//
//  ShotsListViewController.m
//  DribbbleIos
//
//  Created by Thiago Lioy on 1/30/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import "ShotsListViewController.h"

@interface ShotsListViewController ()
@property(nonatomic,strong) NSMutableArray *shotsArray;
@end

@implementation ShotsListViewController


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        _shotsService = [ShotsService new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [_shotsService fetchShotsList:@"popular" completion:^(NSArray *shots) {
        if(!_shotsArray)
            _shotsArray = [NSMutableArray arrayWithCapacity:shots.count];
        [_shotsArray addObjectsFromArray:shots];
        [_shotsTableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _shotsArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

@end
