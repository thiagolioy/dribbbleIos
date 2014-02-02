//
//  ShotCell.m
//  DribbbleIos
//
//  Created by Thiago Lioy on 2/1/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import "ShotCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation ShotCell

-(void)fillShotCell:(Shot*)shot{
    [_shotImageView setImageWithURL:[NSURL URLWithString:shot.imageUrl]];
    _titleLabel.text = shot.title;
}

@end
