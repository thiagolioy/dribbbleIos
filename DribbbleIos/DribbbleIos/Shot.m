//
//  Shot.m
//  DribbbleIos
//
//  Created by Thiago Lioy on 1/30/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import "Shot.h"

@implementation Shot

+(Shot*)shotWithDict:(NSDictionary*)dict{
    Shot *shot = [Shot new];
    shot.shotID = [dict objectForKey:@"id"];
    shot.title = [dict objectForKey:@"title"];
    shot.image400Url = [dict objectForKey:@"image_400_url"];
    shot.imageTeaserUrl = [dict objectForKey:@"image_teaser_url"];
    shot.imageUrl = [dict objectForKey:@"image_url"];
    
    return shot;
}

+(NSArray*)shotsWithDictArray:(NSArray*)array{
    NSMutableArray *shots = [NSMutableArray arrayWithCapacity:array.count];
    for(NSDictionary *dc in array)
        [shots addObject:[Shot shotWithDict:dc]];
    return (NSArray*)shots;
}
@end
