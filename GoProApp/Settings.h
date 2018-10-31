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

#pragma mark - SETTINGS

// types of settings [dependent on one another]
// types of settings with interger values [QUESTION: what is best to transfer these values? NSNumber, NSInteger, int, float]
// GENERAL SETTINGS for cross mode
@property (nonatomic, retain) NSString *mode; /*this is still in the status and should remain there - this may not be used 10.30.18*/

#pragma mark - VIDEO
//  17

// subMode = vidVideo, vidTL, vidAndPhoto, vidLooping ...
@property (nonatomic, retain) NSString *videoSubMode;

// quality = 4K, 2.7K, 1080p, 720p ...
@property (nonatomic, retain) NSString *videoResolution;

// frameRate = 24,30,48,60,80,120,240
@property (nonatomic, retain) NSString *videoFrameRate;

//
@property (nonatomic, retain) NSString *videoFOV;

// interval = 1,2,5,... [QUESTION: how to represent .5? - maybe using 11?]
@property (nonatomic, retain) NSString *videoTLInterval;

//
@property (nonatomic, retain) NSString *videoLoopingInterval;

//
@property (nonatomic, retain) NSString *videoPhotoVideoInterval;

//
@property (nonatomic, retain) NSString *videoLowLight;

//
@property (nonatomic, retain) NSString *videoSpotMeter;

//
@property (nonatomic, retain) NSString *videoProtune;

//
@property (nonatomic, retain) NSString *videoWhiteBalance;

//
@property (nonatomic, retain) NSString *videoColor;

//
@property (nonatomic, retain) NSString *videoManualExposure;

//
@property (nonatomic, retain) NSString *videoISOMode;

//
@property (nonatomic, retain) NSString *videoISOLimit;

//
@property (nonatomic, retain) NSString *videoSharpness;

//
@property (nonatomic, retain) NSString *videoEVComp;


#pragma mark - PHOTO
//  12

// subMode = vidVideo, vidTL, vidAndPhoto, vidLooping ...
@property (nonatomic, retain) NSString *photoSubMode;

//
@property (nonatomic, retain) NSString *photoContinuousRate;

//
@property (nonatomic, retain) NSString *photoMegapixels;

// Exposure = 1,2,5,... [QUESTION: how to represent AUTO? - maybe using 99?]
@property (nonatomic, retain) NSString *photoNightExposure;

//
@property (nonatomic, retain) NSString *photoSpotMeter;

//
@property (nonatomic, retain) NSString *photoProtune;

//
@property (nonatomic, retain) NSString *photoWhiteBalance;

//
@property (nonatomic, retain) NSString *photoColor;

//
@property (nonatomic, retain) NSString *photoSharpness;

//
@property (nonatomic, retain) NSString *photoEVComp;

//
@property (nonatomic, retain) NSString *photoISOMin;

//
@property (nonatomic, retain) NSString *photoISOLimit;


#pragma mark - MULTISHOT
//  15

//
@property (nonatomic, retain) NSString *MSDefaultSubMode;

// subMode = msBurst, msTL, msNL ...
@property (nonatomic, retain) NSString *MSSubMode;

//
@property (nonatomic, retain) NSString *MSNightExposure;

//
@property (nonatomic, retain) NSString *MSBurstRate;

//
@property (nonatomic, retain) NSString *MSTLInterval;

//
@property (nonatomic, retain) NSString *MSNLInterval;

//
@property (nonatomic, retain) NSString *MSMegapixels;

//
@property (nonatomic, retain) NSString *MSSpotMeter;

//
@property (nonatomic, retain) NSString *MSProtune;

//
@property (nonatomic, retain) NSString *MSWhiteBalance;

//
@property (nonatomic, retain) NSString *MSColor;

//
@property (nonatomic, retain) NSString *MSSharpness;

//
@property (nonatomic, retain) NSString *MSEVComp;

//
@property (nonatomic, retain) NSString *MSISOMin;

//
@property (nonatomic, retain) NSString *MSISOLimit;



@end
