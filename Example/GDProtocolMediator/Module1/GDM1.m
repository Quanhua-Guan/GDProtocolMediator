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

/// 调停家 2号代理
/// 此处的"UserInfoProtocol"需要手写, 是唯一容易出错的地方!!
/// 因为没有对UserInfoProtocol进行依赖, 所以Xcode不会有补全提示.
/// 对应的调用者模块中可能存在协议 GDM1_UserInfoProtocol, GDM2_UserInfoProtocol, GDM3_UserInfoProtocol等等...
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
