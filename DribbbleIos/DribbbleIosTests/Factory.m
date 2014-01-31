//
//  Factory.m
//  DribbbleIos
//
//  Created by Thiago Lioy on 1/30/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import "Factory.h"

@implementation Factory

+(NSDictionary*)shotDict{
    return @{@"id":[NSString stringWithFormat:@"%d",arc4random_uniform(100000)],
                               @"title":@"Coming Soon",
                               @"image_url":@"http://d13yacurqjgara.cloudfront.net/users/7249/screenshots/1401076/cattle_cs.jpg",
                               @"image_teaser_url":@"http://d13yacurqjgara.cloudfront.net/users/7249/screenshots/1401076/cattle_cs_teaser.jpg",
                               @"image_400_url":@"http://d13yacurqjgara.cloudfront.net/users/7249/screenshots/1401076/cattle_cs_1x.jpg"};
}
+(NSDictionary*)shotListResponseDict{
    return @{@"page":@"1",
             @"per_page":@"15",
             @"pages":@"50",
             @"total":@"750",
             @"shots":[NSArray array]};
}
@end
