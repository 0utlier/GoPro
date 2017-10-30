//
//  MethodManager.m
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "MethodManager.h"

@implementation MethodManager

- (void)assignDeviceManager: (NSNumber *)device/*(*UIViewController or whatever to pass in right one)*/ {
    self.dao = device;
}

@end
