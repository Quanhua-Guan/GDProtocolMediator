//
//  GDM3.m
//  GDProtocolMediator_Example
//
//  Created by Guan on 2019/2/2.
//  Copyright © 2019 xinmuheart@163.com. All rights reserved.
//

#import "GDM3.h"
#import "GDM3_UserInfoProtocol.h"
#import "GDProtocolMediator.h"

@implementation GDM3

- (void)GDM3_DoSomethingVersion2 {
    id<GDM3_UserInfoProtocol> implementor = [GDProtocolMediator implementorOfProtocol:@protocol(GDM3_UserInfoProtocol)];
    
    NSLog(@"%@-%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    //
    [implementor updateUserDisplayNameWithScene:@"test" logined:YES userDisplayName:@"YuYu"];
}

@end
