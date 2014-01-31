//
//  ShotsListViewController.h
//  DribbbleIos
//
//  Created by Thiago Lioy on 1/30/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShotsService.h"

@interface ShotsListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) IBOutlet UITableView *shotsTableView;
@property(nonatomic,strong) IBOutlet ShotsService *shotsService;

@end
