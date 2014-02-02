//
//  ShotCell.h
//  DribbbleIos
//
//  Created by Thiago Lioy on 2/1/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shot.h"

@interface ShotCell : UITableViewCell

@property(nonatomic,strong) IBOutlet UILabel *titleLabel;
@property(nonatomic,strong) IBOutlet UIImageView *shotImageView;

-(void)fillShotCell:(Shot*)shot;
@end
