//
//  HeroProtocol.m
//  GoProApp
//
//  Created by JD Leonard on 11/13/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "HeroProtocol.h"

@implementation HeroProtocol

// list of the calls that need to be made

- (void)createAvailableSettings{}

#pragma mark - POWER & SHUTTER
- (void)powerOn{}
- (void)powerOff{}
- (void)shutterOn{}
- (void)shutterOff{}

#pragma mark - MODES
- (void)modeVideo{}
- (void)modePhoto{}
- (void)modeMulti{}

#pragma mark - SUB MODES
//video
- (void)subVidVideo{}
- (void)subVidTimeLapse{}
- (void)subVidAndPhoto{}
- (void)subVidLooping{}
//photo
- (void)subPhoPhoto{}
- (void)subPhoContin{}
- (void)subPhoNight{}
//multi
- (void)subMulBurst{}
- (void)subMulTimeLapse{}
- (void)subMulNightLapse{}


@end
