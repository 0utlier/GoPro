//
//  HeroProtocol.h
//  GoProApp
//
//  Created by JD Leonard on 11/13/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>
/*This is the Device Manager for the GoPro Hero
 All of the
 Calls
 Properties
 Information pertaining directly and specifically to all devices*/

@class HeroProtocol;

@protocol HeroDAO <NSObject>

@required

- (void)createAvailableSettings;

#pragma mark - POWER & SHUTTER
- (void)powerOn;
- (void)powerOff;
- (void)shutterOn;
- (void)shutterOff;

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

#pragma mark - AVAILABLE
@property (nonatomic, retain) NSMutableArray *availableModes;
@property (nonatomic, retain) NSMutableArray *availableSubModes;
@property (nonatomic, retain) NSMutableArray *availableResolutions;
@property (nonatomic, retain) NSMutableArray *availableFrameRates;
/*
 @property (nonatomic, retain) NSMutableArray *availableIntervals;
 */





@optional
/*maybe HDR?*/
@end


@interface HeroProtocol : NSObject

// any class of any type that implements the DAO delegate protocol
@property (nonatomic, strong) id<HeroDAO> heroDAO;


@end
