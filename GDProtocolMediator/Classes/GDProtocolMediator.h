//
//  GDProtocolMediator.h
//  GDMediator_Example
//
//  Created by Guan on 2019/1/28.
//  Copyright © 2019 xinmuheart@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GDProtocolMediatorProtocol <NSObject>

/**
 获取实现类

 @return 实现类
 */
+ (id)implementor;

@end

@interface GDProtocolMediator : NSObject

/**
 返回协议的实现者, 一个协议对应一个实现者
 
 实现者需要实现协议,例如协议A: GDProtocolA, 那么, 实现者模块必须实现类: GDProtocolAMediator, (1). 该类必须遵循协议GDProtocolMediatorProtocol, (2). 该类必须实现方法: +implementor
 代码如下:
 @code
 
 @interface GDProtocolAMediator : NSObject
 
 @end
 
 @implementation GDProtocolAMediator
 
 + (id)implementor {
    return theRealProtocolImplementor;//FIXME: 业务模块实现
 }
 
 @end
 
 @endcode
 
 @param protocol 协议
 @return 协议实现者
 */
+ (id _Nullable)implementorOfProtocol:(Protocol *)protocol;

@end

NS_ASSUME_NONNULL_END
