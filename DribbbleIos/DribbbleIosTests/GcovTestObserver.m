//
//  GcovTestObserver.m
//  DribbbleIos
//
//  Created by Thiago Lioy on 1/30/14.
//  Copyright (c) 2014 Thiago Lioy. All rights reserved.
//

#import "GcovTestObserver.h"

@implementation GcovTestObserver

- (void)stopObserving
{
    [super stopObserving];
    UIApplication* application = [UIApplication sharedApplication];
    [application.delegate applicationWillTerminate:application];
}

@end
