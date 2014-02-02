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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)fillShotCell:(Shot*)shot{
    [_shotImageView setImageWithURL:[NSURL URLWithString:shot.imageUrl]];
    _titleLabel.text = shot.title;
}

@end
