//
//  GDM1.m
//  GDMediator_Example
//
//  Created by Guan on 2019/1/28.
//  Copyright © 2019 xinmuheart@163.com. All rights reserved.
//

#import "GDM1.h"
#import <GDProtocolMediator/GDProtocolMediator.h>

#pragma mark - GDM1ProtocolMediator (私有)

// 调停家 1号代理
GDProtocolMediatorBegin(GDM1Protocol)
    GDM1 *gd1 = [[GDM1 alloc] init];
    return gd1;// 业务模块实现
GDProtocolMediatorEnd


#pragma mark - UserInfoProtocolMediator (私有) /GDM2_UserInfoProtocol(2号代理)/GDM3_UserInfoProtocol(2号代理)

// 调停家 2号代理
GDProtocolMediatorBegin(UserInfoProtocol)
    return [[self.class alloc] init];// 业务模块实现
GDProtocolMediatorMethodEnd

- (nonnull NSString *)getUserDisplayNameWithScene:(nonnull NSString *)scene logined:(BOOL)logined {
    return @"test user display name";
}

- (void)updateUserDisplayNameWithScene:(nonnull NSString *)scene logined:(BOOL)logined userDisplayName:(nonnull NSString *)userDisplayName {
    // this is a test method
    NSLog(@"hahahahahaha");
}

- (BOOL)userLogined {
    return YES;
}

GDProtocolMediatorClassEnd


#pragma mark - GDM1

@implementation GDM1

- (void)GDM1_doSomething {
    
}

#pragma mark - GDM1Protocol(1号代理)

- (nonnull NSString *)getUserDisplayNameWithScene:(nonnull NSString *)scene logined:(BOOL)logined {
    return @"test user display name";
}

- (void)updateUserDisplayNameWithScene:(nonnull NSString *)scene logined:(BOOL)logined userDisplayName:(nonnull NSString *)userDisplayName {
    // this is a test method
    NSLog(@"hahahahahaha");
    [self GDM1_doSomething];// for Testing
}

- (BOOL)userLogined {
    return YES;
}

@end
