//
//  HeroProtocol.h
//  GoProApp
//
//  Created by JD Leonard on 11/13/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingsObject.h"
#import "CommandPathObject.h"

/*This is the Device Manager for the GoPro Hero
 All of the
 Calls
 Properties
 Information pertaining directly and specifically to all devices*/

@class HeroProtocol;

@protocol HeroDAO <NSObject>

@required

+ (instancetype)sharedDAO;

// this can be a ViewDidLoad for the object. Anything hard coded that needs to be set
-(void)objectDidLoad;

#pragma mark - POWER & SHUTTER
- (void)powerOn;
- (void)powerOff;
- (void)shutterOn;
- (void)shutterOff;

#pragma mark - MODES
- (void)changeMode:(NSString *)mode;

//types of mode
- (void)modeVideo;
- (void)modePhoto;
- (void)modeMulti;

#pragma mark - SUB MODES
- (void)changeSubMode:(NSString *)subMode; // this will contain the switchCase/if statements that will send the below calls depending on that the input is

//video
- (void)subVidVideo;
- (void)subVidTimeLapse;
- (void)subVidAndPhoto;
- (void)subVidLooping;
//photo
- (void)subPhoPhoto;
- (void)subPhoContin;
- (void)subPhoNight;
//multi
- (void)subMulBurst;
- (void)subMulTimeLapse;
- (void)subMulNightLapse;


#pragma mark - SETTINGS / STATUS

// split up JSON after FETCH complete
- (void)splitJSON;

// obtain the JSON and return the dictionary, with use of CompletionHandler
-(void)fetchGoProSettingsAndStatusJSONWithCompletion:(void (^)(NSDictionary *myDictionary))completionHandler;



- (NSMutableArray *)assignCurrentStatusSettingsArray;
- (NSMutableArray *)assignCurrentVideoSettingsArray;
- (NSMutableArray *)assignCurrentPhotoSettingsArray;
- (NSMutableArray *)assignCurrentMultiShotSettingsArray;

// list the available settings for current device
- (void)createHardCodeAvailableSettings;

// make the comparable dictionary to assign readable value to the JSON
- (void)createHardCodeDictionary;

// list all HTTP calls for given setting request [without the front part - just the tail]
- (void)createHardCodeCommandPaths;

- (NSMutableArray *)showAvailableArray:(NSString *)title;

#pragma mark - AVAILABLE PROPERTIES
@property (nonatomic, retain) NSMutableArray *availableModes;

#pragma mark - Video Available
// Available VIDEO

@property (nonatomic, retain) NSMutableArray *availableVideoSubMode;
@property (nonatomic, retain) NSMutableArray *availableVideoResolution;
@property (nonatomic, retain) NSMutableArray *availableVideoFrameRate;
@property (nonatomic, retain) NSMutableArray *availableVideoFOV;
@property (nonatomic, retain) NSMutableArray *availableVideoTLInterval;
@property (nonatomic, retain) NSMutableArray *availableVideoLoopingInterval;
@property (nonatomic, retain) NSMutableArray *availableVideoPhotoVideoInterval;
@property (nonatomic, retain) NSMutableArray *availableVideoLowLight;
@property (nonatomic, retain) NSMutableArray *availableVideoSpotMeter;
@property (nonatomic, retain) NSMutableArray *availableVideoProtune;
@property (nonatomic, retain) NSMutableArray *availableVideoWhiteBalance;
@property (nonatomic, retain) NSMutableArray *availableVideoColor;
@property (nonatomic, retain) NSMutableArray *availableVideoManualExposure;
@property (nonatomic, retain) NSMutableArray *availableVideoISOMode;
@property (nonatomic, retain) NSMutableArray *availableVideoISOLimit;
@property (nonatomic, retain) NSMutableArray *availableVideoSharpness;
@property (nonatomic, retain) NSMutableArray *availableVideoEVComp;


#pragma mark - Photo Available
// Available PHOTO

@property (nonatomic, retain) NSMutableArray *availablePhotoSubMode;
@property (nonatomic, retain) NSMutableArray *availablePhotoContinuousRate;
@property (nonatomic, retain) NSMutableArray *availablePhotoMegaPixels;
@property (nonatomic, retain) NSMutableArray *availablePhotoNightExposure;
@property (nonatomic, retain) NSMutableArray *availablePhotoSpotMeter;
@property (nonatomic, retain) NSMutableArray *availablePhotoProtune;
@property (nonatomic, retain) NSMutableArray *availablePhotoWhiteBalance;
@property (nonatomic, retain) NSMutableArray *availablePhotoColor;
@property (nonatomic, retain) NSMutableArray *availablePhotoSharpness;
@property (nonatomic, retain) NSMutableArray *availablePhotoEVComp;
@property (nonatomic, retain) NSMutableArray *availablePhotoISOMin;
@property (nonatomic, retain) NSMutableArray *availablephotoISOLimit;

#pragma mark - MultiShot Available
// Available MULTISHOT

@property (nonatomic, retain) NSMutableArray *availableMSDefaultSubMode;
@property (nonatomic, retain) NSMutableArray *availableMSSubMode;
@property (nonatomic, retain) NSMutableArray *availableMSNightExposure;
@property (nonatomic, retain) NSMutableArray *availableMSBurstRate;
@property (nonatomic, retain) NSMutableArray *availableMSTLInterval;
@property (nonatomic, retain) NSMutableArray *availableMSNLInterval;
@property (nonatomic, retain) NSMutableArray *availableMSMegaPixels;
@property (nonatomic, retain) NSMutableArray *availableMSSpotMeter;
@property (nonatomic, retain) NSMutableArray *availableMSProtune;
@property (nonatomic, retain) NSMutableArray *availableMSWhiteBalance;
@property (nonatomic, retain) NSMutableArray *availableMSColor;
@property (nonatomic, retain) NSMutableArray *availableMSSharpness;
@property (nonatomic, retain) NSMutableArray *availableMSEVComp;
@property (nonatomic, retain) NSMutableArray *availableMSISOMin;
@property (nonatomic, retain) NSMutableArray *availableMSISOLimit;

// hardcoded dictionary to define "keys" for the status/settings
@property (nonatomic, retain) NSDictionary *dictionaryStatusDefinition;
@property (nonatomic, retain) NSDictionary *dictionarySettingsDefinition;
@property (nonatomic, retain) NSDictionary *dictionaryStatusHardcode;
@property (nonatomic, retain) NSDictionary *dictionarySettingsHardcode;
@property (nonatomic, retain) NSDictionary *dictionaryAvailableArrays;

/*
// settings for status, other and modes
@property (nonatomic, retain) Status *statusSettings;
@property (nonatomic, retain) Settings *otherSettings;
@property (nonatomic, retain) Settings *videoSettings;
@property (nonatomic, retain) Settings *photoSettings;
@property (nonatomic, retain) Settings *multiShotSettings;
*/

@property (nonatomic, retain) NSString *currentMode;
@property (nonatomic, retain) NSMutableArray *currentSettingsArray;

@property (nonatomic, retain) NSString *urlForCurrentCall; // for passing through the HTTP call


#pragma mark - READABLE FUNCTIONS
// return readable values

#pragma mark - Status

- (NSString *) readableBatteryLevel:(int)value;

- (NSString *) readableBattery:(int)value;

- (NSString *) readableModeCurrent:(int)value;

//- (NSString *) readableSubModeCurrentVideo:(int)value;

//- (NSString *) readableSubModeCurrentPhoto:(int)value;

//- (NSString *) readableSubModeCurrentMultiShot:(int)value;

- (NSString *) readableStreamingStatus:(int)value;

- (NSString *) readableSDCard:(int)value;


#pragma mark - Video Settings
// Video Mode based parameters -- readableVideo

- (NSString *) readableVideoSubMode:(int)value;

- (NSString *) readableVideoResolution:(int)value;

- (NSString *) readableVideoFrameRate:(int)value;

- (NSString *) readableVideoFOV:(int)value;

- (NSString *) readableVideoTLInterval:(int)value;

- (NSString *) readableVideoLoopingInterval:(int)value;

- (NSString *) readableVideoPhotoVideoInterval:(int)value;

- (NSString *) readableVideoLowLight:(int)value;

- (NSString *) readableVideoSpotMeter:(int)value;

- (NSString *) readableVideoProtune:(int)value;

- (NSString *) readableVideoWhiteBalance:(int)value;

- (NSString *) readableVideoColor:(int)value;

- (NSString *) readableVideoManualExposure:(int)value;

- (NSString *) readableVideoISOMode:(int)value;

- (NSString *) readableVideoISOLimit:(int)value;

- (NSString *) readableVideoSharpness:(int)value;

- (NSString *) readableVideoEVComp:(int)value;


#pragma mark - Photo Settings
// Photo Mode based parameters -- readablePhoto

- (NSString *) readablePhotoSubMode:(int)value;

- (NSString *) readablePhotoContinuousRate:(int)value;

- (NSString *) readablePhotoMegaPixels:(int)value;

- (NSString *) readablePhotoNightExposure:(int)value;

- (NSString *) readablePhotoSpotMeter:(int)value;

- (NSString *) readablePhotoProtune:(int)value;

- (NSString *) readablePhotoWhiteBalance:(int)value;

- (NSString *) readablePhotoColor:(int)value;

- (NSString *) readablePhotoSharpness:(int)value;

- (NSString *) readablePhotoEVComp:(int)value;

- (NSString *) readablePhotoISOMin:(int)value;

- (NSString *) readablephotoISOLimit:(int)value;



#pragma mark - MultiShot Settings
// MultiShot Mode based parameters -- readableMS

- (NSString *) readableMSDefaultSubMode:(int)value;

- (NSString *) readableMSSubMode:(int)value;

- (NSString *) readableMSNightExposure:(int)value;

- (NSString *) readableMSBurstRate:(int)value;

- (NSString *) readableMSTLInterval:(int)value;

- (NSString *) readableMSNLInterval:(int)value;

- (NSString *) readableMSMegaPixels:(int)value;

- (NSString *) readableMSSpotMeter:(int)value;

- (NSString *) readableMSProtune:(int)value;

- (NSString *) readableMSWhiteBalance:(int)value;

- (NSString *) readableMSColor:(int)value;

- (NSString *) readableMSSharpness:(int)value;

- (NSString *) readableMSEVComp:(int)value;

- (NSString *) readableMSISOMin:(int)value;

- (NSString *) readableMSISOLimit:(int)value;

#pragma mark - Other Settings
// Other parameters -- readableOther

- (NSString *) readableOtherLCD:(int)value;

- (NSString *) readableOtherLCDBrightness:(int)value;

- (NSString *) readableOtherLCDLock:(int)value;

- (NSString *) readableOtherLCDTimeOutSleep:(int)value;

- (NSString *) readableOtherOrientation:(int)value;

- (NSString *) readableOtherDefaultBootMode:(int)value;

- (NSString *) readableOtherQuickCapture:(int)value;

- (NSString *) readableOtherLED:(int)value;

- (NSString *) readableOtherVolumeBeeps:(int)value;

- (NSString *) readableOtherVideoFormat:(int)value;

- (NSString *) readableOtherOnScreenData:(int)value;

- (NSString *) readableOtherAutoPowerOff:(int)value;



/*=============================================================*/
@optional
/*maybe HDR?*/
@end


@interface HeroProtocol : NSObject

// any class of any type that implements the DAO delegate protocol
@property (nonatomic, strong) id<HeroDAO> heroDAO;


@end
