//
//  ShotsListResponse.m
//  DribbbleIos
//
//  Created by Thiago Lioy on 1/30/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import "ShotsListResponse.h"
#import "Shot.h"

@implementation ShotsListResponse


+(ShotsListResponse*)shotsListResponseWithDict:(NSDictionary*)dict{
    ShotsListResponse *response = [ShotsListResponse new];
    response.page = [dict objectForKey:@"page"];
    response.perPage = [dict objectForKey:@"per_page"];
    response.pages = [dict objectForKey:@"pages"];
    response.total = [dict objectForKey:@"total"];
    response.shots = [Shot shotsWithDictArray:(NSArray*)[dict objectForKey:@"shots"]];
    return response;
}

@end
