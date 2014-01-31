//
//  Shot.h
//  DribbbleIos
//
//  Created by Thiago Lioy on 1/30/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shot : NSObject

@property(nonatomic,strong) NSString *shotID;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *imageUrl;
@property(nonatomic,strong) NSString *imageTeaserUrl;
@property(nonatomic,strong) NSString *image400Url;

+(Shot*)shotWithDict:(NSDictionary*)dict;
+(NSArray*)shotsWithDictArray:(NSArray*)array;
@end
