//
//  GDM3_UserInfoProtocol.h
//  GDProtocolMediator_Example
//
//  Created by Guan on 2019/2/2.
//  Copyright © 2019 xinmuheart@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 对应GDM1.m第27行的 UserInfoProtocolMediator.
@protocol GDM3_UserInfoProtocol <NSObject>

- (void)updateUserDisplayNameWithScene:(NSString *)scene logined:(BOOL)logined userDisplayName:(NSString *)userDisplayName;

@end

NS_ASSUME_NONNULL_END
