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

GDProtocolMediatorBegin(GDM1Protocol)
    GDM1 *gd1 = [[GDM1 alloc] init];
    return gd1;// 业务模块实现
GDProtocolMediatorEnd

#pragma mark - GDM1

@implementation GDM1

- (void)GDM1_doSomething {
    
}

#pragma mark - GDM1Protocol

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
