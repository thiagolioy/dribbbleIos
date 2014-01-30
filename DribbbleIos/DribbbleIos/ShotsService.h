//
//  ShotsService.h
//  DribbbleIos
//
//  Created by Thiago Lioy on 1/30/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^FetchShotsListCompletionBlock)(NSArray *shots);

@interface ShotsService : NSObject

-(void)fetchShotsList:(NSString *)listType
           completion:(FetchShotsListCompletionBlock)block;

@end
