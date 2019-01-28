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
    
    __block NSObject *target = nil;
    dispatch_sync(self.synchronizationQueue, ^{
        target = self.cachedTarget[implementorClassName];
        if (target == nil) {
            target = [[class alloc] init];
            self.cachedTarget[implementorClassName] = target;
        }
    });
    
    if ([target respondsToSelector:@selector(implementor)]) {
        return [target performSelector:@selector(implementor)];
    }
    
    NSAssert(NO, [implementorClassName stringByAppendingString:@" Must Implements selector of +implementor!"]);
    return nil;
}

/**
 目标类实例缓存
 */
+ (NSMutableDictionary *)cachedTarget {
    static NSMutableDictionary *cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [NSMutableDictionary dictionary];
        // 内存不足时的处理
        [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationDidReceiveMemoryWarningNotification
                                                        object:nil
                                                         queue:nil
                                                    usingBlock:^(NSNotification * _Nonnull note) {
                                                        dispatch_async([GDProtocolMediator synchronizationQueue], ^{
                                                            [[GDProtocolMediator cachedTarget] removeAllObjects];
                                                        });
                                                    }];
    });
    
    return cache;
}

/**
 同步队列
 */
+ (dispatch_queue_t)synchronizationQueue {
    static dispatch_queue_t synchronizationQueue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *name = [NSString stringWithFormat:@"com.gaoding.gdprotocolmediator.synchronizationqueue-%@", [[NSUUID UUID] UUIDString]];
        synchronizationQueue = dispatch_queue_create([name cStringUsingEncoding:NSASCIIStringEncoding], DISPATCH_QUEUE_SERIAL);
    });
    return synchronizationQueue;
}


@end
