//
//  GDAppDelegate.m
//  GDProtocolMediator
//
//  Created by xinmuheart@163.com on 01/28/2019.
//  Copyright (c) 2019 xinmuheart@163.com. All rights reserved.
//

#import "GDAppDelegate.h"
#import "GDM2.h"
#import "GDM3.h"

@implementation GDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Testing V1
    GDM2 *m2 = [[GDM2 alloc] init];
    [m2 GDM2_DoSomething];
    
    [m2 GDM2_DoSomethingVersion2];
    
    // Testing V2
    GDM3 *m3 = [[GDM3 alloc] init];
    [m3 GDM3_DoSomethingVersion2];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
