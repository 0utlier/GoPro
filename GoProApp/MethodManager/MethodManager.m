//
//  MethodManager.m
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "MethodManager.h"

@implementation MethodManager


#pragma mark - Singleton Methods


+ (id)sharedManager {
    static MethodManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

#pragma mark - START UP

- (void)startUpApp {
    /*
     open app
     [check wifi]
     choose gopro
     [check gopro and assign object]
     opens view of gopro
     */
}

- (void)assignDeviceManager: (NSNumber *)device/*(*UIViewController or whatever to pass in right one)*/ {
    self.dao = device;
}

#pragma mark - CALLS


@end
