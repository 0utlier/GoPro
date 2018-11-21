//
//  SettingsObject.h
//  GoProApp
//
//  Created by JDSL on 11/13/18.
//  Copyright © 2018 JD Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsObject : NSObject

// description of what a Setting can have
@property (nonatomic, retain) NSString *title; // VideoResolution
@property (nonatomic, retain) NSString *value; // 1080p
@property (nonatomic, assign) BOOL switchStatus; // is it binary ON/OFF
// Does it have a switch? does it have a value? This is why we have the type at the end
@property (nonatomic, retain) NSString *paramType; // how classified between parameters


@end
