//
//  GDProtocolMediatorSpec.m
//  GDProtocolMediator
//
//  Created by Guan on 2019/1/28.
//  Copyright 2019 xinmuheart@163.com. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "GDProtocolMediator.h"
#import "GDM1.h"
#import "GDM1Protocol.h"

@interface GDProtocolMediator (test)

+ (NSMutableDictionary *)cachedTarget;
+ (dispatch_queue_t)synchronizationQueue;

@end


SPEC_BEGIN(GDProtocolMediatorSpec)

describe(@"GDProtocolMediator", ^{
    it(@"Let's TESTING", ^{
        /**
         把测试用例看做一个业务模块, 模块1是提供功能的模块(通过接口GDM1Protocol提供)
         
         从上至下:
         业务模块层: Module1(GDM1), Module2(GDM2)
         协议层: ModuleAPIs(GDM1Protocol)
         稿定调停家: GDProtocolMediator
         
         */
        
        NSObject<GDM1Protocol> *imp = (GDM1 *)[GDProtocolMediator implementorOfProtocol:@protocol(GDM1Protocol)];
        
        // should be GDM1 instance
        [[NSStringFromClass(imp.class) should] equal:@"GDM1"];
        [[imp should] beKindOfClass:[NSObject class]];
        
        [[[[GDM1 alloc] init] should] beKindOfClass:GDM1.class];
        
        // imp getUserDisplayName...
        [[[imp getUserDisplayNameWithScene:@"a" logined:YES] should] equal:@"test user display name"];
        
        // imp updateUserDisplayName...
        [[imp should] receive:@selector(GDM1_doSomething)];
        [imp updateUserDisplayNameWithScene:@"a" logined:YES userDisplayName:@"c"];
        
        // imp api userLogined
        [[theValue([imp userLogined]) should] beYes];
    });
    
    it(@"synchronizationQueue", ^{
        [[[GDProtocolMediator synchronizationQueue] should] beNonNil];
        [[[GDProtocolMediator synchronizationQueue] should] beIdenticalTo:[GDProtocolMediator synchronizationQueue]];
    });
    
    it(@"cachedTarget", ^{
        [[[GDProtocolMediator cachedTarget] should] beNonNil];
        [[[GDProtocolMediator cachedTarget] should] beIdenticalTo:[GDProtocolMediator cachedTarget]];
        [[GDProtocolMediator cachedTarget] isKindOfClass:NSMutableDictionary.class];
    });
    
    it(@"cache target should be empty after memory warning", ^{
        NSMutableDictionary *dictionary = @{@"a" : @"b"}.mutableCopy;
        [[dictionary should] receive:@selector(removeAllObjects)];//1 这两行不能调换位置
        [GDProtocolMediator stub:@selector(cachedTarget) andReturn:dictionary];//2 这两行不能调换位置, 否则本行验证不通过.
        
        [dictionary removeAllObjects];
        [NSNotificationCenter.defaultCenter postNotificationName:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    });
});

SPEC_END
