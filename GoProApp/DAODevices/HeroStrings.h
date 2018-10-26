//
//  HeroStrings.h
//  GoProApp
//
//  Created by JD Leonard on 11/17/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeroProtocol.h"

/*This is the Device Manager for the GoPro Hero TESTING
 All of the:
 Calls
 Properties
 Information pertaining directly and specifically to this device*/

@interface HeroStrings : NSObject <HeroDAO>

/* // I do not need to write out the functions in the h file, as long as the protocol has it

+ (instancetype)sharedDAO;
- (void)createAvailableSettings;

#pragma mark - POWER
- (void)powerOn;
- (void)powerOff;

#pragma mark - MODES
- (void)modeVideo;
- (void)modePhoto;
- (void)modeMulti;

#pragma mark - SUB MODES
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

// make the comparable dictionary to assign readable value to the JSON
- (void)createHardCodeDictionary;
// obtain the JSON and return the dictionary, with use of CompletionHandler
- (void)fetchGoProSettingsAndStatusJSONWithCompletion:(void (^)(NSDictionary *myDictionary))completionHandler;


#pragma mark - AVAILABLE
@property (nonatomic, retain) NSMutableArray *availableModes;
@property (nonatomic, retain) NSMutableArray *availableSubModes;
@property (nonatomic, retain) NSMutableArray *availableResolutions;
@property (nonatomic, retain) NSMutableArray *availableFrameRates;
@property (nonatomic, retain) NSMutableArray *availableTLIntervals;
@property (nonatomic, retain) NSMutableArray *availableTLExposure;

// hardcoded dictionary to define "keys" for the status/settings
@property (nonatomic, retain) NSDictionary *dictionaryHardcode;
@property (nonatomic, retain) NSDictionary *dictionaryStatusDefinition;
@property (nonatomic, retain) NSDictionary *dictionarySettingsDefinition;
@property (nonatomic, retain) NSDictionary *testDictionary;
@property (nonatomic, retain) Settings *testSettings;


#pragma mark - CURRENT INFO
@property (nonatomic, retain) NSString *deviceName;

@property (nonatomic, retain) NSString *urlForCurrentCall;

#pragma mark - READABLE FUNCTIONS
// return readable values

#pragma mark - Status

- (NSString *) readableBatteryLevel:(int)value;

- (NSString *) readableBattery:(int)value;

- (NSString *) readableModeCurrent:(int)value;

- (NSString *) readableSubModeCurrentVideo:(int)value;

- (NSString *) readableSubModeCurrentPhoto:(int)value;

- (NSString *) readableSubModeCurrentMultiShot:(int)value;

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

- (NSString *) readablePhotoShutter:(int)value;

- (NSString *) readablePhotoSpotMeter:(int)value;

- (NSString *) readablePhotoProtune:(int)value;

- (NSString *) readablePhotoWhiteBalance:(int)value;

- (NSString *) readablePhotoColor:(int)value;

- (NSString *) readablePhotoSharpness:(int)value;

- (NSString *) readablePhotoEVComp:(int)value;

- (NSString *) readablePhotoISONMin:(int)value;

- (NSString *) readablePhotoISONMax:(int)value;




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

- (NSString *) readableMSISONMin:(int)value;

- (NSString *) readableMSISONMax:(int)value;

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

*/

@end
