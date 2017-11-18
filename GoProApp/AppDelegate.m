//
//  AppDelegate.m
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "AppDelegate.h"
#import "MethodManager.h"
#import "HeroProtocol.h"

// DEVICES IMPORT
#import "Hero4.h"
#import "HeroStrings.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*create a methodManager - use sharedDAO
     create an instance of H4
     create an instance of H3, etc.
     */
    HeroProtocol *deviceCurrent = [[HeroProtocol alloc]init];
    //    Hero3 *hero3 = [[Hero3 alloc]init];
    Hero4 *hero4 = [[Hero4 alloc]init];
    HeroStrings *heroStrings = [[HeroStrings alloc]init];
    
    //    deviceCurrent.heroDAO = hero3;
    deviceCurrent.heroDAO = hero4;
    [deviceCurrent.heroDAO powerOn];
    [deviceCurrent.heroDAO powerOff];
    
    [deviceCurrent.heroDAO shutterOn];
    [deviceCurrent.heroDAO shutterOff];
    
    deviceCurrent.heroDAO = heroStrings;
    [deviceCurrent.heroDAO powerOn];
    [deviceCurrent.heroDAO powerOff];
    
    [deviceCurrent.heroDAO shutterOn];
    [deviceCurrent.heroDAO shutterOff];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
