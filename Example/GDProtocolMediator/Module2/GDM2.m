//
//  GDM2.m
//  GDMediator_Example
//
//  Created by Guan on 2019/1/28.
//  Copyright © 2019 xinmuheart@163.com. All rights reserved.
//

#import "GDM2.h"
#import "GDM1Protocol.h"
#import "GDProtocolMediator.h"

@implementation GDM2

- (void)GDM2_DoSomething {
    id<GDM1Protocol> implementor = [GDProtocolMediator implementorOfProtocol:@protocol(GDM1Protocol)];
    //
    NSString *userDisplayName = [implementor getUserDisplayNameWithScene:@"abc" logined:YES];
    NSLog(@"%@", userDisplayName);
    
    //
    BOOL logined = [implementor userLogined];
    NSLog(@"user %@ logined", logined ? @"IS" : @"IS NOT");
    
    //
    [implementor updateUserDisplayNameWithScene:@"test" logined:YES userDisplayName:@"YuYu"];
    
}

@end
