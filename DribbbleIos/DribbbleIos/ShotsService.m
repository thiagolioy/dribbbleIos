//
//  ShotsService.m
//  DribbbleIos
//
//  Created by Thiago Lioy on 1/30/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import "ShotsService.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>
#import "ShotsListResponse.h"

#define LIST_URL @"shots/%@"

@implementation ShotsService

-(void)fetchShotsList:(NSString *)listType
           completion:(FetchShotsListCompletionBlock)block{
    
    AFNetworkActivityIndicatorManager.sharedManager.enabled = YES;
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.dribbble.com/"]];
    NSString *url = [NSString stringWithFormat:LIST_URL,listType];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        ShotsListResponse *response = [ShotsListResponse shotsListResponseWithDict:responseObject];
        block(response.shots);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         block([NSArray array]);
    }];
}

@end
