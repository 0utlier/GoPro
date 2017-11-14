//
//  Hero4.m
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "Hero4.h"

@implementation Hero4


+ (instancetype)sharedDAO
{
    static Hero4 *sharedDAO = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDAO = [[Hero4 alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedDAO;
}

#pragma mark - POWER DELEGATE
-(void)powerOn {
    self.urlForCurrentCall =@"http://10.5.5.9/bacpac/PW";
    [self printCurrentURL];
}
-(void)powerOff {
    self.urlForCurrentCall = @"http://10.5.5.9/gp/gpControl/command/system/sleep";
    [self printCurrentURL];

}

-(void)printCurrentURL {
    NSLog(@"%@",self.urlForCurrentCall);
}



 #pragma mark - POWER
 NSString *GPPowerON = @"http://10.5.5.9/bacpac/PW"; //(does not work yet)
 NSString *GPPowerOFF = @"http://10.5.5.9/gp/gpControl/command/system/sleep";


 #pragma mark - SHUTTER

NSString *GPShutterStart = @"http://10.5.5.9/gp/gpControl/command/shutter?p=1";
NSString *GPShutterStop = @"http://10.5.5.9/gp/gpControl/command/shutter?p=0";

/*
 #pragma mark - MODE
 MODES: (Primary modes:)
 
 Video:     http://10.5.5.9/gp/gpControl/command/mode?p=0
 Photo:     http://10.5.5.9/gp/gpControl/command/mode?p=1
 MultiShot: http://10.5.5.9/gp/gpControl/command/mode?p=2
========
 
 #pragma mark - SUB MODE
 SUB MODES: (Secondary modes:)
 
 Video (VIDEO):             http://10.5.5.9/gp/gpControl/command/sub_mode?mode=0&sub_mode=0
 TimeLapse Video (VIDEO):   http://10.5.5.9/gp/gpControl/command/sub_mode?mode=0&sub_mode=1
 Video + Photo (VIDEO):     http://10.5.5.9/gp/gpControl/command/sub_mode?mode=0&sub_mode=2
 Looping (VIDEO):           http://10.5.5.9/gp/gpControl/command/sub_mode?mode=0&sub_mode=3
 
 Single (PHOTO):        http://10.5.5.9/gp/gpControl/command/sub_mode?mode=1&sub_mode=0
 Continuous (PHOTO):    http://10.5.5.9/gp/gpControl/command/sub_mode?mode=1&sub_mode=1
 Night (PHOTO):         http://10.5.5.9/gp/gpControl/command/sub_mode?mode=1&sub_mode=2
 
 Burst (MultiShot):         http://10.5.5.9/gp/gpControl/command/sub_mode?mode=2&sub_mode=0
 Timelapse (MultiShot):     http://10.5.5.9/gp/gpControl/command/sub_mode?mode=2&sub_mode=1
 NightLapse (MultiShot):    http://10.5.5.9/gp/gpControl/command/sub_mode?mode=2&sub_mode=2
 ========
 
 #pragma mark - RESOLUTION & MP
 VIDEO RESOLUTIONS:
 
 4K: http://10.5.5.9/gp/gpControl/setting/2/1
 4K SuperView: http://10.5.5.9/gp/gpControl/setting/2/2
 2.7K: http://10.5.5.9/gp/gpControl/setting/2/4
 2.7K SuperView: http://10.5.5.9/gp/gpControl/setting/2/5
 2.7K 4:3: http://10.5.5.9/gp/gpControl/setting/2/6
 1440p: http://10.5.5.9/gp/gpControl/setting/2/7
 1080p SuperView: http://10.5.5.9/gp/gpControl/setting/2/8
 1080p: http://10.5.5.9/gp/gpControl/setting/2/9
 960p: http://10.5.5.9/gp/gpControl/setting/2/10
 720p SuperView: http://10.5.5.9/gp/gpControl/setting/2/11
 720p: http://10.5.5.9/gp/gpControl/setting/2/12
 WVGA: http://10.5.5.9/gp/gpControl/setting/2/13
 
 PHOTO MP:
 
 12MP Wide: http://10.5.5.9/gp/gpControl/setting/17/0
 7MP Wide: http://10.5.5.9/gp/gpControl/setting/17/1
 7MP Medium: http://10.5.5.9/gp/gpControl/setting/17/2
 5MP Wide: http://10.5.5.9/gp/gpControl/setting/17/3
 ========

 #pragma mark - FRAME RATE
 FRAMERATES:
 
 240fps: http://10.5.5.9/gp/gpControl/setting/3/0
 120fps: http://10.5.5.9/gp/gpControl/setting/3/1
 100fps: http://10.5.5.9/gp/gpControl/setting/3/2
    90fps: http://10.5.5.9/gp/gpControl/setting/3/3
 80fps: http://10.5.5.9/gp/gpControl/setting/3/4
 60fps: http://10.5.5.9/gp/gpControl/setting/3/5
    50fps: http://10.5.5.9/gp/gpControl/setting/3/6
 48fps: http://10.5.5.9/gp/gpControl/setting/3/7
 30fps: http://10.5.5.9/gp/gpControl/setting/3/8
 24fps: http://10.5.5.9/gp/gpControl/setting/3/9
 ========
 
 #pragma mark - INTERVAL & EXPOSURE
 VIDEO TL INTERVALS:
 0.5: http://10.5.5.9/gp/gpControl/setting/5/0
 1: http://10.5.5.9/gp/gpControl/setting/5/1
 2: http://10.5.5.9/gp/gpControl/setting/5/2
 5: http://10.5.5.9/gp/gpControl/setting/5/3
 10: http://10.5.5.9/gp/gpControl/setting/5/4
 30: http://10.5.5.9/gp/gpControl/setting/5/5
 60: http://10.5.5.9/gp/gpControl/setting/5/6
 
 PHOTO TL INTERVALS:
 
 0.5: http://10.5.5.9/gp/gpControl/setting/30/0
 1: http://10.5.5.9/gp/gpControl/setting/30/1
 2: http://10.5.5.9/gp/gpControl/setting/30/2
 5: http://10.5.5.9/gp/gpControl/setting/30/5
 10: http://10.5.5.9/gp/gpControl/setting/30/10
 30: http://10.5.5.9/gp/gpControl/setting/30/30
 60: http://10.5.5.9/gp/gpControl/setting/30/60

 NIGHT PHOTO EXPOSURES:
 
 Auto: http://10.5.5.9/gp/gpControl/setting/19/0
 2: http://10.5.5.9/gp/gpControl/setting/19/1
 5: http://10.5.5.9/gp/gpControl/setting/19/2
 10: http://10.5.5.9/gp/gpControl/setting/19/3
 15: http://10.5.5.9/gp/gpControl/setting/19/4
 20: http://10.5.5.9/gp/gpControl/setting/19/5
 30: http://10.5.5.9/gp/gpControl/setting/19/6
 
 NIGHT LAPSE EXPOSURES:
 
 Auto: http://10.5.5.9/gp/gpControl/setting/31/0
 2: http://10.5.5.9/gp/gpControl/setting/31/1
 5: http://10.5.5.9/gp/gpControl/setting/31/2
 10: http://10.5.5.9/gp/gpControl/setting/31/3
 15: http://10.5.5.9/gp/gpControl/setting/31/4
 20: http://10.5.5.9/gp/gpControl/setting/31/5
 30: http://10.5.5.9/gp/gpControl/setting/31/6


 ========
 
 #pragma mark - ???
 FOV:
 SPOT METER:
 PROTUNE
 
 */

#pragma mark - Singleton Methods


+ (id)sharedManager {
    static Hero4 *sharedMyHero4 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyHero4 = [[self alloc] init];
    });
    return sharedMyHero4;
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

@end
