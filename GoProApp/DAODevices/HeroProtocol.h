//
//  HeroProtocol.h
//  GoProApp
//
//  Created by JD Leonard on 11/13/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Settings.h"
/*This is the Device Manager for the GoPro Hero
 All of the
 Calls
 Properties
 Information pertaining directly and specifically to all devices*/

@class HeroProtocol;

@protocol HeroDAO <NSObject>

@required

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

#pragma mark - QUALITY
//types of qualities [too many to have all different calls]
- (void)changeQuality:(NSString *)quality;



// get status from call to GoPro - JSON is returned. Assign to dictionary of settings/status
- (NSString *)assignCurrentSettings: (NSString *)setting;

// list the available settings for current device
- (void)createAvailableSettings;

// make the comparable dictionary to assign readable value to the JSON
- (void)createHardCodeDictionary;



#pragma mark - AVAILABLE
@property (nonatomic, retain) NSMutableArray *availableModes;
@property (nonatomic, retain) NSMutableArray *availableSubModes;
@property (nonatomic, retain) NSMutableArray *availableResolutions;
@property (nonatomic, retain) NSMutableArray *availableFrameRates;
@property (nonatomic, retain) NSMutableArray *availableTLIntervals;
@property (nonatomic, retain) NSMutableArray *availableTLExposure;

// hardcoded dictionary to define "keys" for the status/settings
@property (nonatomic, retain) NSDictionary *dictionaryStatusDefinition;
@property (nonatomic, retain) NSDictionary *dictionarySettingsDefinition;

/*=============================================================*/
@optional
/*maybe HDR?*/
@end


@interface HeroProtocol : NSObject

// any class of any type that implements the DAO delegate protocol
@property (nonatomic, strong) id<HeroDAO> heroDAO;


@end
