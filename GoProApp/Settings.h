//
//  Settings.h
//  GoProApp
//
//  Created by JDSL on 9/22/18.
//  Copyright © 2018 JD Leonard. All rights reserved.
//
/* the Settings Object is to define all of the types of options that a GoPro can have
 it will travel throughout the app [thanks to the Method Manager] to define the following SettingTypes:*/
/*
 *Current = when GoPro is turned on and connected, the values currently set [usually will be default]
 *Available = depending on the GoPro, there will be different options to choose from (e.g. older GoPros do not have 1080p 240fps)
 *Desired = the user will choose from the available options and this will retain that information, then send HTTP calls to set the GoPro. Followed by setting the Current values as well.
 *Last Used = This is optional and lower priority, but this is for the user to access the "latest used settings" in case they want to quickly return after a new shot, or when they turn it back on
 */
#import <Foundation/Foundation.h>

@interface Settings : NSObject

// types of settings [dependent on one another]
    // mode = video, photo, multi-shot
@property (nonatomic, retain) NSString *mode;
    // subMode = vidVideo, vidTL, vidAndPhoto, vidLooping ...
@property (nonatomic, retain) NSString *subMode;
    // quality = 4K, 2.7K, 1080p, 720p ...
@property (nonatomic, retain) NSString *quality;

// types of settings with interger values [QUESTION: what is best to transfer these values? NSNumber, NSInteger, int, float]
    // frameRate = 24,30,48,60,80,120,240
@property (nonatomic) int frameRate;
// interval = 1,2,5,... [QUESTION: how to represent .5? - maybe using 11?]
@property (nonatomic) int interval;
// Exposure = 1,2,5,... [QUESTION: how to represent AUTO? - maybe using 99?]
@property (nonatomic) int exposure;

@end
