//
//  GDProtocolMediator.h
//  GDMediator_Example
//
//  Created by Guan on 2019/1/28.
//  Copyright © 2019 xinmuheart@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** 为了简化[稿定调停家代理]的实现而创建的宏 */
#define GDProtocolMediatorBegin(_Protocol_)\
@interface _Protocol_##Mediator : NSObject<GDProtocolMediatorProtocol>\
@end\
@implementation _Protocol_##Mediator\
+ (id)implementor {\
    // 请返回协议##Protocol##的协议实现者(类型id)\

#define GDProtocolMediatorEnd }@end
#define GDProtocolMediatorMethodEnd }
#define GDProtocolMediatorClassEnd @end

/**
 稿定调停家代理
 创建协议实现者的中介者需要遵循的协议.
 实现该协议的中介者位于提供功能的模块中(可以把它看成稿定调停家的代理).
 */
@protocol GDProtocolMediatorProtocol <NSObject>

/**
 获取协议实现者

 @return 协议实现者实例
 */
+ (id)implementor;

@end


/**
 稿定调停家, 基于协议的调停者(中介者), 用于模块间解耦调用.
 */
@interface GDProtocolMediator : NSObject

/**
 返回协议的实现者, 一个协议对应一个实现者
 
 - 实现者需要实现协议,例如协议A: GDProtocolA, 那么, 实现者模块必须实现类: GDProtocolAMediator, (1). 该类必须遵循协议GDProtocolMediatorProtocol, (2). 该类必须实现方法: +implementor
 
 @code
 /// 方法1. 建议使用宏:GDProtocolMediatorBegin和GDProtocolMediatorEnd (需要依赖GDProtocolMediator.h)
 GDProtocolMediatorBegin(GDProtocolA)
 return theRealProtocolImplementor;//FIXME: 业务模块返回协议GDProtocolA的实现者
 GDProtocolMediatorEnd
 
 /// 方法2. 手写(不需要依赖GDProtocolMediator), 代码如下:
 @interface GDProtocolAMediator : NSObject
 
 @end
 
 @implementation GDProtocolAMediator
 
 + (id)implementor {
    return theRealProtocolImplementor;//FIXME: 业务模块返回协议GDProtocolA的实现者
 }
 
 @end
 
 @endcode
 
 @param protocol 协议
 @return 协议实现者
 */
+ (id _Nullable)implementorOfProtocol:(Protocol *)protocol;

@end

NS_ASSUME_NONNULL_END
