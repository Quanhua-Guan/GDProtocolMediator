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
        [[imp should] beKindOfClass:GDM1.class];
        
        [[[[GDM1 alloc] init] should] beKindOfClass:GDM1.class];
        
        // imp getUserDisplayName...
        [[[imp getUserDisplayNameWithScene:@"a" logined:YES] should] equal:@"test user display name"];
        
        // imp updateUserDisplayName...
        [[imp should] receive:@selector(GDM1_doSomething)];
        [imp updateUserDisplayNameWithScene:@"a" logined:YES userDisplayName:@"c"];
        
        // imp api userLogined
        [[theValue([imp userLogined]) should] beYes];
    });
});

SPEC_END
