//
//  GDProtocolMediator.m
//  GDMediator_Example
//
//  Created by Guan on 2019/1/28.
//  Copyright © 2019 xinmuheart@163.com. All rights reserved.
//

#import "GDProtocolMediator.h"

@implementation GDProtocolMediator

+ (id _Nullable)implementorOfProtocol:(Protocol *)protocol
{
    NSAssert(protocol != nil, @"Protocol Must Be Non-null!");
    if (protocol == nil) {
        return nil;
    }
    
    NSString *protocolName = NSStringFromProtocol(protocol);
    NSString *implementorClassName = [protocolName stringByAppendingString:@"Mediator"];
    Class class = NSClassFromString(implementorClassName);
    
    NSAssert(class != nil, [implementorClassName stringByAppendingString:@" Must Be Implemented As Class!"]);
    if (class == nil) {
        return nil;
    }
    
    if ([class respondsToSelector:@selector(implementor)]) {
        return [class performSelector:@selector(implementor)];
    }
    
    NSAssert(NO, [implementorClassName stringByAppendingString:@" Must Implements selector of +implementor!"]);
    return nil;
}

@end
