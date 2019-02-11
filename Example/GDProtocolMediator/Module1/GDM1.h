//
//  GDM1.h
//  GDMediator_Example
//
//  Created by Guan on 2019/1/28.
//  Copyright © 2019 xinmuheart@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GDM1 : NSObject /*<GDM1Protocol> // 不产生依赖, 依然可以实现对应的Protocol */

@property (nonatomic, strong) NSString *name;

- (void)GDM1_doSomething;

@end

NS_ASSUME_NONNULL_END
