//
//  AppDelegate.h
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MethodManager/MethodManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+(AppDelegate*) sharedDelegate;

@end

