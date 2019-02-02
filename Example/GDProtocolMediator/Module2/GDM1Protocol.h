//
//  GDM1Protocol.h
//  GDMediator_Example
//
//  Created by Guan on 2019/1/28.
//  Copyright © 2019 xinmuheart@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GDM1Protocol <NSObject>

- (BOOL)userLogined;

- (NSString *)getUserDisplayNameWithScene:(NSString *)scene logined:(BOOL)logined;

- (void)updateUserDisplayNameWithScene:(NSString *)scene logined:(BOOL)logined userDisplayName:(NSString *)userDisplayName;

@end

NS_ASSUME_NONNULL_END
