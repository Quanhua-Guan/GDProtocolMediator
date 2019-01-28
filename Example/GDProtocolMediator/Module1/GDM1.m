//
//  GDM1.m
//  GDMediator_Example
//
//  Created by Guan on 2019/1/28.
//  Copyright © 2019 xinmuheart@163.com. All rights reserved.
//

#import "GDM1.h"

@interface GDM1ProtocolMediator : NSObject

@end

@implementation GDM1ProtocolMediator

+ (id)implementor {
    return [[GDM1 alloc] init];// 业务模块实现
}

@end


@implementation GDM1

- (void)doSomething {
    
}

#pragma mark - GDM1Protocol

- (nonnull NSString *)getUserDisplayNameWithScene:(nonnull NSString *)scene logined:(BOOL)logined {
    return @"test user display name";
}

- (void)updateUserDisplayNameWithScene:(nonnull NSString *)scene logined:(BOOL)logined userDisplayName:(nonnull NSString *)userDisplayName {
    // this is a test method
    NSLog(@"hahahahahaha");
}

- (BOOL)userLogined {
    return arc4random() % 2 == 0;
}

@end
