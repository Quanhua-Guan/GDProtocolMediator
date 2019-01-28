//
//  GDM1.h
//  GDMediator_Example
//
//  Created by Guan on 2019/1/28.
//  Copyright © 2019 xinmuheart@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDM1Protocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface GDM1 : NSObject <GDM1Protocol>

@property (nonatomic, strong) NSString *name;

- (void)GDM1_doSomething;

@end

NS_ASSUME_NONNULL_END
