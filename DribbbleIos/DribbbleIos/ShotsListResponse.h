//
//  ShotsListResponse.h
//  DribbbleIos
//
//  Created by Thiago Lioy on 1/30/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShotsListResponse : NSObject

@property(nonatomic,strong) NSString *page;
@property(nonatomic,strong) NSString *pages;
@property(nonatomic,strong) NSString *perPage;
@property(nonatomic,strong) NSString *total;
@property(nonatomic,strong) NSArray *shots;

+(ShotsListResponse*)shotsListResponseWithDict:(NSDictionary*)dict;

@end
