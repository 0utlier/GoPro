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
 All of the
 Calls
 Properties
 Information pertaining directly and specifically to this device*/

@interface HeroStrings : NSObject <HeroDAO>

+ (instancetype)sharedDAO;

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



#pragma mark - AVAILABLE
@property (nonatomic, retain) NSMutableArray *availableModes;
@property (nonatomic, retain) NSMutableArray *availableSubModes;
@property (nonatomic, retain) NSMutableArray *availableResolutions;
@property (nonatomic, retain) NSMutableArray *availableFrameRates;
@property (nonatomic, retain) NSMutableArray *availableTLSeconds;

/*
 @property (nonatomic, retain) NSMutableArray *availableIntervals;
 */
#pragma mark - CURRENT INFO
@property (nonatomic, retain) NSString *deviceName;

@property (nonatomic, retain) NSString *urlForCurrentCall;


@end
