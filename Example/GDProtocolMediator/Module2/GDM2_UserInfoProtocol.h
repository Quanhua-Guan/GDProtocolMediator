//
//  GDM2_UserInfoProtocol.h
//  GDProtocolMediator_Example
//
//  Created by Guan on 2019/2/2.
//  Copyright © 2019 xinmuheart@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GDM2_UserInfoProtocol <NSObject>

- (BOOL)userLogined;

- (NSString *)getUserDisplayNameWithScene:(NSString *)scene logined:(BOOL)logined;

@end

NS_ASSUME_NONNULL_END
