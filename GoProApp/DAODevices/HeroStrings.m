//
//  HeroStrings.m
//  GoProApp
//
//  Created by JD Leonard on 11/17/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "HeroStrings.h"

@implementation HeroStrings
/*I do not see Shutter in here? Did I just completely leave it out? How about power? 08.17.20*/
/*08.19.20 yes I can see those functions do not exist yet. For ANY of the system settings yet. Need to incorporate in the protocol - then here*/

-(void)objectDidLoad {
    
    [self createHardCodeDictionary];
    
}

-(void)testForStreamVLC {
    // this is where the stream will go
}

# pragma mark - DICTIONARIES HARDCODE ASSIGN

// this is for comparison to the JSON that comes in. It will make that readable
- (void)createHardCodeDictionary {
    // status hardcode dictionary // labeled if there is an existing function already created
    NSDictionary *myStatusDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                                        @"1",  @"battery", // function
                                        @"2",  @"batteryLevel", // function
                                        @"43", @"modeCurrent", // function
                                        @"44", @"subModeCurrent", // function
                                        @"13", @"currentVideoDuration",
                                        @"39", @"capturedMultiShot",
                                        @"31", @"clientsConnected",
                                        @"32", @"streamingStatus", // function
                                        @"8",  @"recordingProcessing", // function
                                        @"33", @"sdCardPresent", // function
                                        @"34", @"remainingPhotos",
                                        @"35", @"remainingVideoTime",
                                        @"36", @"capturedBatchPhotos",
                                        @"37", @"capturedVideos",
                                        @"38", @"capturedPhotosAll",
                                        @"39", @"capturedVideosAll",
                                        @"54", @"remainingBytes",
                                        nil];
//    NSLog(@"Hardcoded Status Dict: %@", myStatusDictionary);
    
    self.dictionaryStatusHardcode = myStatusDictionary;
    
    /*============================================== ============================================== ============================================== */
    // settings hardcode dictionary
    
    NSDictionary *mySettingsDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                                          
                                          // Video Dictionary Portion
                                          @"68", @"videoSubMode",
                                          @"2",  @"videoResolution",
                                          @"3",  @"videoFrameRate",
                                          @"4",  @"videoFOV",
                                          @"5",  @"videoTLInterval",
                                          @"6",  @"videoLoopingInterval",
                                          @"7",  @"videoPhotoVideoInterval",
                                          @"8",  @"videoLowLight",
                                          @"9",  @"videoSpotMeter",
                                          @"10", @"videoProtune",
                                          @"11", @"videoWhiteBalance",
                                          @"12", @"videoColor",
                                          @"73", @"videoManualExposure",
                                          @"74", @"videoISOMode",
                                          @"13", @"videoISOLimit",
                                          @"14", @"videoSharpness",
                                          @"15", @"videoEVComp",
                                          
                                          // Photo Dictionary Portion
                                          @"69", @"photoSubMode",
                                          @"18", @"photoContinuousRate",
                                          @"17", @"photoMegapixels",
                                          @"19", @"photoNightExposure",
                                          @"20", @"photoSpotMeter",
                                          @"21", @"photoProtune",
                                          @"22", @"photoWhiteBalance",
                                          @"23", @"photoColor",
                                          @"25", @"photoSharpness",
                                          @"26", @"photoEVComp",
                                          @"75", @"photoISOMin",
                                          @"24", @"photoISOLimit",
                                          
                                          // MultiShot Dictionary Portion
                                          @"27", @"MSDefaultSubMode",
                                          @"70", @"MSSubMode",
                                          @"31", @"MSNightExposure",
                                          @"29", @"MSBurstRate",
                                          @"30", @"MSTLInterval",
                                          @"32", @"MSNLInterval",
                                          @"28", @"MSMegapixels",
                                          @"33", @"MSSpotMeter",
                                          @"34", @"MSProtune",
                                          @"35", @"MSWhiteBalance",
                                          @"36", @"MSColor",
                                          @"38", @"MSSharpness",
                                          @"39", @"MSEVComp",
                                          @"76", @"MSISOMin",
                                          @"37", @"MSISOLimit",
                                          
                                          // Other Dictionary Portion
                                          @"72", @"otherLCD",
                                          @"49", @"otherLCDBrightness",
                                          @"50", @"otherLCDLock",
                                          @"51", @"otherLCDTimeOutsleep",
                                          @"52", @"otherOrientation",
                                          @"53", @"otherDefaultBootMode",
                                          @"54", @"otherQuickCapture",
                                          @"55", @"otherLED",
                                          @"56", @"otherVolumeBeeps",
                                          @"57", @"otherVideoFormat",
                                          @"58", @"otherOnScreenData",
                                          @"59", @"otherAutoPowerOff",
                                          nil];
    
//    NSLog(@"Hardcoded Settings Dict: %@", mySettingsDictionary);
    
    self.dictionarySettingsHardcode = mySettingsDictionary;
    
   
}


// method for comparing hardcode dictionaries

- (int)compareStatusHardcode:(NSString *)key {
    return [[self.dictionaryStatusDefinition valueForKey:[self.dictionaryStatusHardcode valueForKey:key]]intValue];
}

- (int)compareSettingsHardcode:(NSString *)key {
    return [[self.dictionarySettingsDefinition valueForKey:[self.dictionarySettingsHardcode valueForKey:key]]intValue];
}

// function to assign the JSON values to the settings, displayed in VCs
// this will need to be broken up for given usage of the mode. no need to display video specs, if photo is current. [07.11.20 Looks like this sorting is done in the if statement below]
-(NSMutableArray *)assignCurrentStatusSettingsArray {
    SettingsObject *battery = [[SettingsObject alloc]init];
    battery.title = @"Battery";
    battery.value = [self readableBattery:[self compareStatusHardcode:@"battery"]];
    battery.paramType = @"typeSystemSettings";
    SettingsObject *batteryLevel = [[SettingsObject alloc]init];
    batteryLevel.title = @"Battery Level";
    batteryLevel.value = [self readableBatteryLevel:[self compareStatusHardcode:@"batteryLevel"]];
    batteryLevel.paramType = @"typeSystemSettings";
    SettingsObject *mode = [[SettingsObject alloc]init];
    mode.title = @"Mode";
    mode.value = [self readableModeCurrent:[self compareStatusHardcode:@"modeCurrent"]];
    mode.paramType = @"typeSystemSettings";
    SettingsObject *sdCardPresent = [[SettingsObject alloc]init];
    sdCardPresent.title = @"SD Card";
    sdCardPresent.value = [self readableSDCard:[self compareStatusHardcode:@"sdCardPresent"]];
    sdCardPresent.paramType = @"typeSystemSettings";
    //    sdCardPresent.switchStatus = [self binaryAssignment:sdCardPresent];
    SettingsObject *streamingStatus = [[SettingsObject alloc]init];
    streamingStatus.title = @"Streaming";
    streamingStatus.value = [self readableStreamingStatus:[self compareStatusHardcode:@"streamingStatus"]];
    streamingStatus.paramType = @"typeSystemSettings";
    //    streamingStatus.switchStatus = [self binaryAssignment:streamingStatus];
    
    /* I don't know why this is here 08.19.20 - looks like duplicate
     streamingStatus.title = @"Streaming";
     streamingStatus.value = [self readableStreamingStatus:[self compareStatusHardcode:@"streamingStatus"]];
     streamingStatus.paramType = @"typeSystemSettings";*/
    SettingsObject *recordingStatus = [[SettingsObject alloc]init];
    recordingStatus.title = @"Recording";
    recordingStatus.value = [self readableRecordingStatus:[self compareStatusHardcode:@"recordingProcessing"]];
    recordingStatus.paramType = @"typeSystemSettings";
    
    // create an array with all current settingsObjects
    NSMutableArray *statusSettingsArray = [[NSMutableArray alloc]initWithObjects:battery, batteryLevel, mode, sdCardPresent, streamingStatus, recordingStatus, nil];
    [self printMyArray:statusSettingsArray];
    
    NSLog(@"remain photos = %d", [self compareStatusHardcode:@"remainingPhotos"]);
    
    NSLog(@"settings object created, and now values assigned");
    
    // create an array depending on which currentMode is being used
    NSMutableArray *currentSettingArray = [[NSMutableArray alloc]init];
    
    // check which mode, to assign proper settings to the given mode
    if ([mode.value isEqualToString:@"Video"]) {
        NSLog(@"User is using %@", mode.value);
        //        [self assignCurrentVideoSettings];
        currentSettingArray = [self assignCurrentVideoSettingsArray];
    }
    else if ([mode.value isEqualToString:@"Photo"]) {
        NSLog(@"User is using %@", mode.value);
        //        [self assignCurrentPhotoSettings];
        currentSettingArray = [self assignCurrentPhotoSettingsArray];
    }
    else if ([mode.value isEqualToString:@"MultiShot"]) {
        NSLog(@"User is using %@", mode.value);
        //        [self assignCurrentMultiShotSettings];
        currentSettingArray = [self assignCurrentMultiShotSettingsArray];
    }
    else if ([mode.value isEqualToString:@"Settings"]) {
        NSLog(@"User is in the %@", mode.value);
        [self assignCurrentVideoSettingsArray];
        [self assignCurrentPhotoSettingsArray];
        [self assignCurrentMultiShotSettingsArray];
    }
    else
        NSLog(@"No current mode found, cannot assign current settings");
    self.currentSettingsArray = currentSettingArray;
    return currentSettingArray;
}


-(NSMutableArray *)assignCurrentVideoSettingsArray {
    SettingsObject *mode = [[SettingsObject alloc] init];
    mode.title = @"Mode";
    mode.value = [self readableModeCurrent:[self compareStatusHardcode:@"mode"]];
    mode.paramType = @"typeVideo";
    SettingsObject *videoSubMode = [[SettingsObject alloc] init];
    videoSubMode.title = @"Sub Mode";
    videoSubMode.value = [self readableVideoSubMode:[self compareSettingsHardcode:@"videoSubMode"]];
    videoSubMode.paramType = @"typeVideo";
    SettingsObject *videoResolution = [[SettingsObject alloc] init];
    videoResolution.title = @"Resolution";
    videoResolution.value = [self readableVideoResolution:[self compareSettingsHardcode:@"videoResolution"]];
    videoResolution.paramType = @"typeVideo";
    SettingsObject *videoFrameRate = [[SettingsObject alloc] init];
    videoFrameRate.title = @"Frame Rate";
    videoFrameRate.value = [self readableVideoFrameRate:[self compareSettingsHardcode:@"videoFrameRate"]];
    videoFrameRate.paramType = @"typeVideo";
    SettingsObject *videoFOV = [[SettingsObject alloc] init];
    videoFOV.title = @"FOV";
    videoFOV.value = [self readableVideoFOV:[self compareSettingsHardcode:@"videoFOV"]];
    videoFOV.paramType = @"typeVideo";
    SettingsObject *videoTLInterval = [[SettingsObject alloc] init];
    videoTLInterval.title = @"Time Lapse Interval";
    videoTLInterval.value = [self readableVideoTLInterval:[self compareSettingsHardcode:@"videoTLInterval"]];
    videoTLInterval.paramType = @"typeVideo";
    SettingsObject *videoLoopingInterval = [[SettingsObject alloc] init];
    videoLoopingInterval.title = @"Looping Interval";
    videoLoopingInterval.value = [self readableVideoLoopingInterval:[self compareSettingsHardcode:@"videoLoopingInterval"]];
    videoLoopingInterval.paramType = @"typeVideo";
    SettingsObject *videoPhotoVideoInterval = [[SettingsObject alloc] init];
    videoPhotoVideoInterval.title = @"Photo Video Interval";
    videoPhotoVideoInterval.value = [self readableVideoPhotoVideoInterval:[self compareSettingsHardcode:@"videoPhotoVideoInterval"]];
    videoPhotoVideoInterval.paramType = @"typeVideo";
    SettingsObject *videoLowLight = [[SettingsObject alloc] init];
    videoLowLight.title = @"Low Light";
    videoLowLight.value = [self readableVideoLowLight:[self compareSettingsHardcode:@"videoLowLight"]];
    videoLowLight.paramType = @"typeVideoBinary";
    videoLowLight.switchStatus = [self binaryAssignment:videoLowLight];
    SettingsObject *videoSpotMeter = [[SettingsObject alloc] init];
    videoSpotMeter.title = @"Spot Meter";
    videoSpotMeter.value = [self readableVideoSpotMeter:[self compareSettingsHardcode:@"videoSpotMeter"]];
    videoSpotMeter.paramType = @"typeVideoBinary";
    videoSpotMeter.switchStatus = [self binaryAssignment:videoSpotMeter];
    SettingsObject *videoProtune = [[SettingsObject alloc] init];
    videoProtune.title = @"Protune";
    videoProtune.value = [self readableVideoProtune:[self compareSettingsHardcode:@"videoProtune"]];
    videoProtune.paramType = @"typeVideoBinary";
    videoProtune.switchStatus = [self binaryAssignment:videoProtune];
    SettingsObject *videoWhiteBalance = [[SettingsObject alloc] init];
    videoWhiteBalance.title = @"White Balance";
    videoWhiteBalance.value = [self readableVideoWhiteBalance:[self compareSettingsHardcode:@"videoWhiteBalance"]];
    videoWhiteBalance.paramType = @"typeVideo";
    SettingsObject *videoColor = [[SettingsObject alloc] init];
    videoColor.title = @"Color";
    videoColor.value = [self readableVideoColor:[self compareSettingsHardcode:@"videoColor"]];
    videoColor.paramType = @"typeVideo";
    SettingsObject *videoManualExposure = [[SettingsObject alloc] init];
    videoManualExposure.title = @"Manual Exposure";
    videoManualExposure.value = [self readableVideoManualExposure:[self compareSettingsHardcode:@"videoManualExposure"]];
    videoManualExposure.paramType = @"typeVideo";
    SettingsObject *videoISOMode = [[SettingsObject alloc] init];
    videoISOMode.title = @"ISO Mode";
    videoISOMode.value = [self readableVideoISOMode:[self compareSettingsHardcode:@"videoISOMode"]];
    videoISOMode.paramType = @"typeVideo";
    SettingsObject *videoISOLimit = [[SettingsObject alloc] init];
    videoISOLimit.title = @"ISO Limit";
    videoISOLimit.value = [self readableVideoISOLimit:[self compareSettingsHardcode:@"videoISOLimit"]];
    videoISOLimit.paramType = @"typeVideo";
    SettingsObject *videoSharpness = [[SettingsObject alloc] init];
    videoSharpness.title = @"Sharpness";
    videoSharpness.value = [self readableVideoSharpness:[self compareSettingsHardcode:@"videoSharpness"]];
    videoSharpness.paramType = @"typeVideo";
    SettingsObject *videoEVComp = [[SettingsObject alloc] init];
    videoEVComp.title = @"EV Comp";
    videoEVComp.value = [self readableVideoEVComp:[self compareSettingsHardcode:@"videoEVComp"]];
    videoEVComp.paramType = @"typeVideo";
    
    // make the array and add the objects
    NSMutableArray *settingsArray = [[NSMutableArray alloc]initWithObjects:mode, videoSubMode, videoResolution, videoFrameRate, videoFOV, videoTLInterval, videoLoopingInterval, videoPhotoVideoInterval, videoLowLight, videoSpotMeter, videoProtune, videoWhiteBalance, videoColor, videoManualExposure, videoISOMode, videoISOLimit, videoSharpness, videoEVComp, nil];
    
    [self printMyArray:settingsArray];
    
    return settingsArray;
    
    
}

-(NSMutableArray *)assignCurrentMultiShotSettingsArray {
    // MultiShot param type
    SettingsObject *mode = [[SettingsObject alloc] init];
    mode.title = @"Mode";
    mode.value = [self readableModeCurrent:[self compareStatusHardcode:@"modeCurrent"]];
    mode.paramType = @"typeMS";
    SettingsObject *MSSubMode = [[SettingsObject alloc] init];
    MSSubMode.title = @"Sub Mode";
    MSSubMode.value = [self readableMSSubMode:[self compareSettingsHardcode:@"MSSubMode"]];
    MSSubMode.paramType = @"typeMS";
    SettingsObject *MSDefaultSubMode = [[SettingsObject alloc] init];
    MSDefaultSubMode.title = @"Default Sub Mode";
    MSDefaultSubMode.value = [self readableMSDefaultSubMode:[self compareSettingsHardcode:@"MSDefaultSubMode"]];
    MSDefaultSubMode.paramType = @"typeMS";
    SettingsObject *MSNightExposure = [[SettingsObject alloc] init];
    MSNightExposure.title = @"Night Exposure Interval";
    MSNightExposure.value = [self readableMSNightExposure:[self compareSettingsHardcode:@"MSNightExposure"]];
    MSNightExposure.paramType = @"typeMS";
    SettingsObject *MSBurstRate = [[SettingsObject alloc] init];
    MSBurstRate.title = @"Burst Rate";
    MSBurstRate.value = [self readableMSBurstRate:[self compareSettingsHardcode:@"MSBurstRate"]];
    MSBurstRate.paramType = @"typeMS";
    SettingsObject *MSTLInterval = [[SettingsObject alloc] init];
    MSTLInterval.title = @"Time Lapse Interval";
    MSTLInterval.value = [self readableMSTLInterval:[self compareSettingsHardcode:@"MSTLInterval"]];
    MSTLInterval.paramType = @"typeMS";
    SettingsObject *MSNLInterval = [[SettingsObject alloc] init];
    MSNLInterval.title = @"Night Lapse Interval";
    MSNLInterval.value = [self readableMSNLInterval:[self compareSettingsHardcode:@"MSNLInterval"]];
    MSNLInterval.paramType = @"typeMS";
    SettingsObject *MSMegapixels = [[SettingsObject alloc] init];
    MSMegapixels.title = @"Megapixels";
    MSMegapixels.value = [self readableMSMegaPixels:[self compareSettingsHardcode:@"MSMegapixels"]];
    MSMegapixels.paramType = @"typeMS";
    SettingsObject *MSSpotMeter = [[SettingsObject alloc] init];
    MSSpotMeter.title = @"Spot Meter";
    MSSpotMeter.value = [self readableMSSpotMeter:[self compareSettingsHardcode:@"MSSpotMeter"]];
    MSSpotMeter.paramType = @"typeMSBinary";
    MSSpotMeter.switchStatus = [self binaryAssignment:MSSpotMeter];
    SettingsObject *MSProtune = [[SettingsObject alloc] init];
    MSProtune.title = @"Protune";
    MSProtune.value = [self readableMSProtune:[self compareSettingsHardcode:@"MSProtune"]];
    MSProtune.paramType = @"typeMSBinary";
    MSProtune.switchStatus = [self binaryAssignment:MSProtune];
    SettingsObject *MSWhiteBalance = [[SettingsObject alloc] init];
    MSWhiteBalance.title = @"White Balance";
    MSWhiteBalance.value = [self readableMSWhiteBalance:[self compareSettingsHardcode:@"MSWhiteBalance"]];
    MSWhiteBalance.paramType = @"typeMS";
    SettingsObject *MSColor = [[SettingsObject alloc] init];
    MSColor.title = @"Color";
    MSColor.value = [self readableMSColor:[self compareSettingsHardcode:@"MSColor"]];
    MSColor.paramType = @"typeMS";
    SettingsObject *MSSharpness = [[SettingsObject alloc] init];
    MSSharpness.title = @"Sharpness";
    MSSharpness.value = [self readableMSSharpness:[self compareSettingsHardcode:@"MSSharpness"]];
    MSSharpness.paramType = @"typeMS";
    SettingsObject *MSEVComp = [[SettingsObject alloc] init];
    MSEVComp.title = @"EV Comp";
    MSEVComp.value = [self readableMSEVComp:[self compareSettingsHardcode:@"MSEVComp"]];
    MSEVComp.paramType = @"typeMS";
    SettingsObject *MSISOMin = [[SettingsObject alloc] init];
    MSISOMin.title = @"ISO Min";
    MSISOMin.value = [self readableMSISOMin:[self compareSettingsHardcode:@"MSISOMin"]];
    MSISOMin.paramType = @"typeMS";
    SettingsObject *MSISOLimit = [[SettingsObject alloc] init];
    MSISOLimit.title = @"ISO Limit";
    MSISOLimit.value = [self readableMSISOLimit:[self compareSettingsHardcode:@"MSISOLimit"]];
    MSISOLimit.paramType = @"typeMS";
    
    // make the array and add the objects
    NSMutableArray *settingsArray = [[NSMutableArray alloc]initWithObjects:mode,MSSubMode,MSDefaultSubMode, MSNightExposure, MSBurstRate, MSTLInterval, MSNLInterval, MSMegapixels, MSSpotMeter, MSProtune, MSWhiteBalance, MSColor, MSSharpness, MSEVComp, MSISOMin, MSISOLimit, nil];
    //    NSLog(@"my array of objects: %@", settingsArray);
    
    /*for (SettingsObject *test in settingsArray) {
     NSLog(@"%@, %@, %@, %d", test.title, test.value, test.paramType, test.switchStatus);
     
     }*/
    [self printMyArray:settingsArray];
    return settingsArray;
}

-(NSMutableArray *)assignCurrentPhotoSettingsArray {
    // photo param type
    SettingsObject *mode = [[SettingsObject alloc] init];
    mode.title = @"Mode";
    mode.value = [self readableModeCurrent:[self compareStatusHardcode:@"mode"]];
    mode.paramType = @"typePhoto";
    SettingsObject *photoSubMode = [[SettingsObject alloc] init];
    photoSubMode.title = @"Sub Mode";
    photoSubMode.value = [self readablePhotoSubMode:[self compareSettingsHardcode:@"photoSubMode"]];
    photoSubMode.paramType = @"typePhoto";
    SettingsObject *photoContinuousRate = [[SettingsObject alloc] init];
    photoContinuousRate.title = @"Continuous Rate";
    photoContinuousRate.value = [self readablePhotoContinuousRate:[self compareSettingsHardcode:@"photoContinuousRate"]];
    photoContinuousRate.paramType = @"typePhoto";
    SettingsObject *photoMegapixels = [[SettingsObject alloc] init];
    photoMegapixels.title = @"Megapixels";
    photoMegapixels.value = [self readablePhotoMegaPixels:[self compareSettingsHardcode:@"photoMegapixels"]];
    photoMegapixels.paramType = @"typePhoto";
    SettingsObject *photoNightExposure = [[SettingsObject alloc] init];
    photoNightExposure.title = @"Night Exposure";
    photoNightExposure.value = [self readablePhotoNightExposure:[self compareSettingsHardcode:@"photoNightExposure"]];
    photoNightExposure.paramType = @"typePhoto";
    
    // instead of value, it is a binary
    SettingsObject *photoSpotMeter = [[SettingsObject alloc] init];
    photoSpotMeter.title = @"Spot Meter";
    photoSpotMeter.value = [self readablePhotoSpotMeter:[self compareSettingsHardcode:@"photoSpotMeter"]];
    photoSpotMeter.paramType = @"typePhotoBinary";
    photoSpotMeter.switchStatus = [self binaryAssignment:photoSpotMeter];
    SettingsObject *photoProtune = [[SettingsObject alloc] init];
    photoProtune.title = @"Protune";
    photoProtune.value = [self readablePhotoProtune:[self compareSettingsHardcode:@"photoProtune"]];
    photoProtune.paramType = @"typePhotoBinary";
    photoProtune.switchStatus = [self binaryAssignment:photoProtune];
    
    SettingsObject *photoWhiteBalance = [[SettingsObject alloc] init];
    photoWhiteBalance.title = @"White Balance";
    photoWhiteBalance.value = [self readablePhotoWhiteBalance:[self compareSettingsHardcode:@"photoWhiteBalance"]];
    photoWhiteBalance.paramType = @"typePhoto";
    SettingsObject *photoColor = [[SettingsObject alloc] init];
    photoColor.title = @"Color";
    photoColor.value = [self readablePhotoColor:[self compareSettingsHardcode:@"photoColor"]];
    photoColor.paramType = @"typePhoto";
    SettingsObject *photoSharpness = [[SettingsObject alloc] init];
    photoSharpness.title = @"Sharpness";
    photoSharpness.value = [self readablePhotoSharpness:[self compareSettingsHardcode:@"photoSharpness"]];
    photoSharpness.paramType = @"typePhoto";
    SettingsObject *photoEVComp = [[SettingsObject alloc] init];
    photoEVComp.title = @"EV Comp";
    photoEVComp.value = [self readablePhotoEVComp:[self compareSettingsHardcode:@"photoEVComp"]];
    photoEVComp.paramType = @"typePhoto";
    SettingsObject *photoISOMin = [[SettingsObject alloc] init];
    photoISOMin.title = @"ISO Min";
    photoISOMin.value = [self readablePhotoISOMin:[self compareSettingsHardcode:@"photoISOMin"]];
    photoISOMin.paramType = @"typePhoto";
    SettingsObject *photoISOLimit = [[SettingsObject alloc] init];
    photoISOLimit.title = @"ISO Limit";
    photoISOLimit.value = [self readablephotoISOLimit:[self compareSettingsHardcode:@"photoISOLimit"]];
    photoISOLimit.paramType = @"typePhoto";
    
    // make the array and add the objects
    NSMutableArray *settingsArray = [[NSMutableArray alloc]initWithObjects:mode,photoSubMode,photoContinuousRate, photoMegapixels, photoNightExposure, photoSpotMeter, photoProtune, photoWhiteBalance, photoColor, photoSharpness, photoEVComp, photoISOMin, photoISOLimit, nil];
    //    NSLog(@"my array of objects: %@", settingsArray);
    [self printMyArray:settingsArray];
    
    return settingsArray;
}

// prints out all properties of the settingsObject within the received array
-(void)printMyArray:(NSMutableArray *)array {
    NSLog(@"SETTINGS, VALUE, TYPE:");
    
    for (SettingsObject *test in array) {
        if ([test.paramType containsString:@"Binary"]) {
            NSLog(@"%@, %@, %@, %d", test.title, test.value, test.paramType, test.switchStatus);
        }
        else
            NSLog(@"%@, %@, %@", test.title, test.value, test.paramType);
        
    }
}

-(BOOL)binaryAssignment:(SettingsObject *)setting {
    if ([setting.value isEqualToString:@"On"]) {
        NSLog(@"%@ switch is TRUE for ON", setting.title);
        return TRUE;
    }
    
    else {
        NSLog(@"%@ switch is FALSE for OFF", setting.title);
        return FALSE;
    }
    
}

// 07.11.20 I believe this is to RETURN arrays for all available calls for this particular GoPro
#pragma mark - COMMANDPATH

#pragma mark - Video Commands

- (NSMutableArray *)getModeOptions {
    CommandPathObject *modeVideo = [[CommandPathObject alloc]init];
    modeVideo.value = @"Video";
    modeVideo.commandPath = @"/mode?p=0";
    CommandPathObject *modePhoto = [[CommandPathObject alloc]init];
    modePhoto.value = @"Photo";
    modePhoto.commandPath = @"/mode?p=1";
    CommandPathObject *modeMulti = [[CommandPathObject alloc]init];
    modeMulti.value = @"Multishot";
    modeMulti.commandPath = @"/mode?p=2";
    NSMutableArray *myModes = [[NSMutableArray alloc]initWithObjects:modeVideo, modePhoto, modeMulti,nil];
    self.availableModes = myModes;
    return self.availableModes;
}


- (NSMutableArray *)getVideoResolution {
    CommandPathObject *qual4KSV = [[CommandPathObject alloc] init];
    qual4KSV.value = @"4K SuperView";
    qual4KSV.commandPath = @"2/2";
    CommandPathObject *qual4K = [[CommandPathObject alloc] init];
    qual4K.value = @"4K";
    qual4K.commandPath = @"2/1";
    CommandPathObject *qual27KSV = [[CommandPathObject alloc] init];
    qual27KSV.value = @"2.7K SuperView";
    qual27KSV.commandPath = @"2/5";
    CommandPathObject *qual27K = [[CommandPathObject alloc] init];
    qual27K.value = @"2.7K";
    qual27K.commandPath = @"2/4";
    CommandPathObject *qual27K_4_3 = [[CommandPathObject alloc] init];
    qual27K_4_3.value = @"2.7K 4:3";
    qual27K_4_3.commandPath = @"2/6";
    CommandPathObject *qual1440 = [[CommandPathObject alloc] init];
    qual1440.value = @"1440";
    qual1440.commandPath = @"2/7";
    CommandPathObject *qual1080SV = [[CommandPathObject alloc] init];
    qual1080SV.value = @"1080 SuperView";
    qual1080SV.commandPath = @"2/8";
    CommandPathObject *qual1080 = [[CommandPathObject alloc] init];
    qual1080.value = @"1080";
    qual1080.commandPath = @"2/9";
    CommandPathObject *qual960 = [[CommandPathObject alloc] init];
    qual960.value = @"960";
    qual960.commandPath = @"2/10";
    CommandPathObject *qual720SV = [[CommandPathObject alloc] init];
    qual720SV.value = @"720 SuperView";
    qual720SV.commandPath = @"2/11";
    CommandPathObject *qual720 = [[CommandPathObject alloc] init];
    qual720.value = @"720";
    qual720.commandPath = @"2/12";
    CommandPathObject *qualWVGA = [[CommandPathObject alloc] init];
    qualWVGA.value = @"WVGA";
    qualWVGA.commandPath = @"2/13";
    
    // 08.02.20 create array first, then set if statements, depending on FPS or sub mode [Time Lapse]
    
    NSMutableArray *myResolutions = [[NSMutableArray alloc]initWithObjects:qual4KSV, qual4K, qual27KSV, qual27K, qual27K_4_3, qual1440, qual1080SV, qual1080, qual960, qual720SV, qual720, qualWVGA, nil ];
    
    self.availableVideoResolution = myResolutions; // necessary for access later? or just return the array
    return myResolutions;
    
}
-(NSMutableArray *)getVideoFrameRate {
    CommandPathObject *fps240 = [[CommandPathObject alloc] init];
    fps240.value = @"240";
    fps240.commandPath = @"3/0";
    CommandPathObject *fps120 = [[CommandPathObject alloc] init];
    fps120.value = @"120";
    fps120.commandPath = @"3/1";
    CommandPathObject *fps100 = [[CommandPathObject alloc] init];
    fps100.value = @"100";
    fps100.commandPath = @"3/2";
    CommandPathObject *fps90 = [[CommandPathObject alloc] init];
    fps90.value = @"90";
    fps90.commandPath = @"3/3";
    CommandPathObject *fps80 = [[CommandPathObject alloc] init];
    fps80.value = @"80";
    fps80.commandPath = @"3/4";
    CommandPathObject *fps60 = [[CommandPathObject alloc] init];
    fps60.value = @"60";
    fps60.commandPath = @"3/5";
    CommandPathObject *fps50 = [[CommandPathObject alloc] init];
    fps50.value = @"50";
    fps50.commandPath = @"3/6";
    CommandPathObject *fps48 = [[CommandPathObject alloc] init];
    fps48.value = @"48";
    fps48.commandPath = @"3/7";
    CommandPathObject *fps30 = [[CommandPathObject alloc] init];
    fps30.value = @"30";
    fps30.commandPath = @"3/8";
    CommandPathObject *fps25 = [[CommandPathObject alloc] init];
    fps25.value = @"25";
    fps25.commandPath = @"3/9";
    CommandPathObject *fps24 = [[CommandPathObject alloc] init];
    // unsure how to proceed with below? 12.1.18 - necessary? call worthy? do i display it in the list?
    fps24.value = @"24";
    fps24.commandPath = @"";
    CommandPathObject *fps15 = [[CommandPathObject alloc] init];
    fps15.value = @"15";
    fps15.commandPath = @"";
    CommandPathObject *fps12_5 = [[CommandPathObject alloc] init];
    fps12_5.value = @"12.5";
    fps12_5.commandPath = @"";
    
    NSMutableArray *myFrameRates = [[NSMutableArray alloc]initWithObjects:fps240, fps120, fps100, fps90, fps80, fps60, fps50, fps48, fps30, fps25, fps24, fps15, fps12_5, nil];
    self.availableVideoFrameRate = myFrameRates;
    return self.availableVideoFrameRate;
}

- (NSMutableArray *)getVideoSubMode{ // different URL
    /* http://10.5.5.9/gp/gpControl/command/sub_mode?mode= */
    CommandPathObject *subMVideo = [[CommandPathObject alloc] init];
    subMVideo.value = @"Video";
    subMVideo.commandPath = @"0&sub_mode=0";
    CommandPathObject *subMTLVideo = [[CommandPathObject alloc] init];
    subMTLVideo.value = @"Time Lapse Video";
    subMTLVideo.commandPath = @"0&sub_mode=1";
    CommandPathObject *subMVideoAndPhoto = [[CommandPathObject alloc] init];
    subMVideoAndPhoto.value = @"Video And Photo";
    subMVideoAndPhoto.commandPath = @"0&sub_mode=2";
    CommandPathObject *subMLooping = [[CommandPathObject alloc] init];
    subMLooping.value = @"Looping";
    subMLooping.commandPath = @"0&sub_mode=3";
    
    NSMutableArray *mySubModes = [[NSMutableArray alloc]initWithObjects:subMVideo, subMTLVideo, subMVideoAndPhoto, subMLooping, nil];
    self.availableVideoSubMode = mySubModes;
    return self.availableVideoSubMode;
    
}

- (NSMutableArray *)getVideoFOV {
    CommandPathObject *fovWide = [[CommandPathObject alloc] init];
    fovWide.value = @"Wide";
    fovWide.commandPath = @"4/0";
    
    CommandPathObject *fovMedium = [[CommandPathObject alloc] init];
    fovMedium.value = @"Medium";
    fovMedium.commandPath = @"4/1";
    
    CommandPathObject *fovNarrow = [[CommandPathObject alloc] init];
    fovNarrow.value = @"Narrow";
    fovNarrow.commandPath = @"4/2";
    
    CommandPathObject *fovLinear = [[CommandPathObject alloc] init];
    fovLinear.value = @"Linear";
    fovLinear.commandPath = @"4/4";
    
    NSMutableArray *myFOVs = [[NSMutableArray alloc]initWithObjects: fovWide, fovMedium, fovNarrow, fovLinear, nil];
    self.availableVideoFOV = myFOVs;
    return self.availableVideoFOV;
}

- (NSMutableArray *)getVideoTLInterval {
    CommandPathObject *tlInterval_5 = [[CommandPathObject alloc] init];
    tlInterval_5.value = @".5";
    tlInterval_5.commandPath = @"5/0";
    CommandPathObject *tlInterval1 = [[CommandPathObject alloc] init];
    tlInterval1.value = @"1";
    tlInterval1.commandPath = @"5/1";
    CommandPathObject *tlInterval2 = [[CommandPathObject alloc] init];
    tlInterval2.value = @"2";
    tlInterval2.commandPath = @"5/2";
    CommandPathObject *tlInterval5 = [[CommandPathObject alloc] init];
    tlInterval5.value = @"5";
    tlInterval5.commandPath = @"5/3";
    CommandPathObject *tlInterval10 = [[CommandPathObject alloc] init];
    tlInterval10.value = @"10";
    tlInterval10.commandPath = @"5/4";
    CommandPathObject *tlInterval30 = [[CommandPathObject alloc] init];
    tlInterval30.value = @"30";
    tlInterval30.commandPath = @"5/5";
    CommandPathObject *tlInterval60 = [[CommandPathObject alloc] init];
    tlInterval60.value = @"60";
    tlInterval60.commandPath = @"5/6";
    
    NSMutableArray *myTLIntervals = [[NSMutableArray alloc]initWithObjects: tlInterval_5, tlInterval1, tlInterval2, tlInterval5, tlInterval10, tlInterval30, tlInterval60, nil];
    self.availableVideoTLInterval = myTLIntervals;
    return self.availableVideoTLInterval;
}

- (NSMutableArray *)getVideoLoopingInterval { // minutes
    CommandPathObject *loopingIntervalMax = [[CommandPathObject alloc] init];
    loopingIntervalMax.value = @"Max";
    loopingIntervalMax.commandPath = @"6/0";
    CommandPathObject *loopingInterval5 = [[CommandPathObject alloc] init];
    loopingInterval5.value = @"5";
    loopingInterval5.commandPath = @"6/1";
    CommandPathObject *loopingInterval20 = [[CommandPathObject alloc] init];
    loopingInterval20.value = @"20";
    loopingInterval20.commandPath = @"6/2";
    CommandPathObject *loopingInterval60 = [[CommandPathObject alloc] init];
    loopingInterval60.value = @"60";
    loopingInterval60.commandPath = @"6/3";
    CommandPathObject *loopingInterval120 = [[CommandPathObject alloc] init];
    loopingInterval120.value = @"120";
    loopingInterval120.commandPath = @"6/4";
    
    NSMutableArray *myLoopingIntervals = [[NSMutableArray alloc]initWithObjects: loopingIntervalMax, loopingInterval5, loopingInterval20,loopingInterval60, loopingInterval120, nil];
    self.availableVideoLoopingInterval = myLoopingIntervals;
    return self.availableVideoLoopingInterval;

    
}

- (NSMutableArray *)getVideoPhotoVideoInterval { // minutes
    CommandPathObject *pvInterval5 = [[CommandPathObject alloc] init];
    pvInterval5.value = @"5";
    pvInterval5.commandPath = @"7/1";
    CommandPathObject *pvInterval10 = [[CommandPathObject alloc] init];
    pvInterval10.value = @"10";
    pvInterval10.commandPath = @"7/2";
    CommandPathObject *pvInterval30 = [[CommandPathObject alloc] init];
    pvInterval30.value = @"30";
    pvInterval30.commandPath = @"7/3";
    CommandPathObject *pvInterval60 = [[CommandPathObject alloc] init];
    pvInterval60.value = @"60";
    pvInterval60.commandPath = @"7/4";
    
    NSMutableArray *myPhotoVideoIntervals = [[NSMutableArray alloc]initWithObjects: pvInterval5, pvInterval10, pvInterval30, pvInterval60, nil];
    self.availableVideoPhotoVideoInterval = myPhotoVideoIntervals;
    return self.availableVideoPhotoVideoInterval;

}

- (NSMutableArray *)getVideoWhiteBalance {
    CommandPathObject *whiteBalanceAuto = [[CommandPathObject alloc] init];
    whiteBalanceAuto.value = @"Auto";
    whiteBalanceAuto.commandPath = @"11/0";
    CommandPathObject *whiteBalance3000K = [[CommandPathObject alloc] init];
    whiteBalance3000K.value = @"3000K";
    whiteBalance3000K.commandPath = @"11/1";
    CommandPathObject *whiteBalance4000K = [[CommandPathObject alloc] init];
    whiteBalance4000K.value = @"4000K";
    whiteBalance4000K.commandPath = @"11/5";
    CommandPathObject *whiteBalance4800K = [[CommandPathObject alloc] init];
    whiteBalance4800K.value = @"4800K";
    whiteBalance4800K.commandPath = @"11/6";
    CommandPathObject *whiteBalance5500K = [[CommandPathObject alloc] init];
    whiteBalance5500K.value = @"5500K";
    whiteBalance5500K.commandPath = @"11/2";
    CommandPathObject *whiteBalance6000K = [[CommandPathObject alloc] init];
    whiteBalance6000K.value = @"6000K";
    whiteBalance6000K.commandPath = @"11/7";
    CommandPathObject *whiteBalance6500K = [[CommandPathObject alloc] init];
    whiteBalance6500K.value = @"6500K";
    whiteBalance6500K.commandPath = @"11/3";
    CommandPathObject *whiteBalanceNative = [[CommandPathObject alloc] init];
    whiteBalanceNative.value = @"Native";
    whiteBalanceNative.commandPath = @"11/4";
    
    NSMutableArray *myWhiteBalances = [[NSMutableArray alloc]initWithObjects: whiteBalanceAuto, whiteBalance3000K, whiteBalance4000K, whiteBalance4800K, whiteBalance5500K, whiteBalance6000K, whiteBalance6500K, whiteBalanceNative, nil];
    self.availableVideoWhiteBalance = myWhiteBalances;
    return self.availableVideoWhiteBalance;

}

- (NSMutableArray *)getVideoColor {
    CommandPathObject *colorFlat = [[CommandPathObject alloc] init];
    colorFlat.value = @"Flat";
    colorFlat.commandPath = @"12/1";
    CommandPathObject *colorGoProColor = [[CommandPathObject alloc] init];
    colorGoProColor.value = @"GoPro Color";
    colorGoProColor.commandPath = @"12/0";
    
    NSMutableArray *myColors = [[NSMutableArray alloc]initWithObjects: colorFlat, colorGoProColor, nil];
    self.availableVideoColor = myColors;
    return self.availableVideoColor;


}


- (NSMutableArray *)getVideoEVComp {
    CommandPathObject *evComp2_0 = [[CommandPathObject alloc] init];
    evComp2_0.value = @"2.0";
    evComp2_0.commandPath = @"15/0";
    CommandPathObject *evComp1_5 = [[CommandPathObject alloc] init];
    evComp1_5.value = @"1.5";
    evComp1_5.commandPath = @"15/1";
    CommandPathObject *evComp1_0 = [[CommandPathObject alloc] init];
    evComp1_0.value = @"1.0";
    evComp1_0.commandPath = @"15/2";
    CommandPathObject *evComp0_5 = [[CommandPathObject alloc] init];
    evComp0_5.value = @"0.5";
    evComp0_5.commandPath = @"15/3";
    CommandPathObject *evComp0 = [[CommandPathObject alloc] init];
    evComp0.value = @"0.0";
    evComp0.commandPath = @"15/4";
    CommandPathObject *evCompN0_5 = [[CommandPathObject alloc] init];
    evCompN0_5.value = @"-0.5";
    evCompN0_5.commandPath = @"15/5";
    CommandPathObject *evCompN1_0 = [[CommandPathObject alloc] init];
    evCompN1_0.value = @"-1.0";
    evCompN1_0.commandPath = @"15/6";
    CommandPathObject *evCompN1_5 = [[CommandPathObject alloc] init];
    evCompN1_5.value = @"-1.5";
    evCompN1_5.commandPath = @"15/7";
    CommandPathObject *evCompN2_0 = [[CommandPathObject alloc] init];
    evCompN2_0.value = @"-2.0";
    evCompN2_0.commandPath = @"15/8";
    
    NSMutableArray *myEVComp = [[NSMutableArray alloc]initWithObjects: evComp2_0,evCompN1_5,evCompN1_0,evComp0_5,evComp0,evCompN0_5,evCompN1_0,evCompN1_5,evCompN2_0, nil];
    self.availableVideoEVComp = myEVComp;
    return self.availableVideoEVComp;

}





- (NSMutableArray *)getVideoISOLimit {
    CommandPathObject *isoLimit100 = [[CommandPathObject alloc] init];
    isoLimit100.value = @"100";
    isoLimit100.commandPath = @"13/8";
    CommandPathObject *isoLimit200 = [[CommandPathObject alloc] init];
    isoLimit200.value = @"200";
    isoLimit200.commandPath = @"13/7";
    CommandPathObject *isoLimit400 = [[CommandPathObject alloc] init];
    isoLimit400.value = @"400";
    isoLimit400.commandPath = @"13/2";
    CommandPathObject *isoLimit800 = [[CommandPathObject alloc] init];
    isoLimit800.value = @"800";
    isoLimit800.commandPath = @"13/4";
    CommandPathObject *isoLimit1600 = [[CommandPathObject alloc] init];
    isoLimit1600.value = @"1600";
    isoLimit1600.commandPath = @"13/1";
    CommandPathObject *isoLimit3200 = [[CommandPathObject alloc] init];
    isoLimit3200.value = @"3200";
    isoLimit3200.commandPath = @"13/3";
    CommandPathObject *isoLimit6400 = [[CommandPathObject alloc] init];
    isoLimit6400.value = @"6400";
    isoLimit6400.commandPath = @"13/0";
    
    NSMutableArray *myISOLimit = [[NSMutableArray alloc]initWithObjects: isoLimit100, isoLimit200, isoLimit400, isoLimit800, isoLimit1600, isoLimit3200, isoLimit6400, nil];
    self.availableVideoISOLimit = myISOLimit;
    return self.availableVideoISOLimit;

}


- (NSMutableArray *)getVideoISOMode {
    CommandPathObject *isoModeMax = [[CommandPathObject alloc] init];
    isoModeMax.value = @"Max";
    isoModeMax.commandPath = @"74/0";
    CommandPathObject *isoModeLock = [[CommandPathObject alloc] init];
    isoModeLock.value = @"Lock";
    isoModeLock.commandPath = @"74/1";
    
    NSMutableArray *myISOMode = [[NSMutableArray alloc]initWithObjects:isoModeMax, isoModeLock, nil];
    self.availableVideoISOMode = myISOMode;
    return self.availableVideoISOMode;

}


- (NSMutableArray *)getVideoManualExposure {
    /* will get back to - see below 12.01.18*/
    CommandPathObject *manualExposureAuto = [[CommandPathObject alloc] init];
    manualExposureAuto.value = @"Auto";
    manualExposureAuto.commandPath = @"73/0";
    CommandPathObject *manualExposure24 = [[CommandPathObject alloc] init];
    manualExposure24.value = @"24";
    manualExposure24.commandPath = @"";
    CommandPathObject *manualExposure25 = [[CommandPathObject alloc] init];
    manualExposure25.value = @"25";
    manualExposure25.commandPath = @"";
    CommandPathObject *manualExposure30 = [[CommandPathObject alloc] init];
    manualExposure30.value = @"30";
    manualExposure30.commandPath = @"";
    CommandPathObject *manualExposure48 = [[CommandPathObject alloc] init];
    manualExposure48.value = @"48";
    manualExposure48.commandPath = @"";
    CommandPathObject *manualExposure50 = [[CommandPathObject alloc] init];
    manualExposure50.value = @"50";
    manualExposure50.commandPath = @"";
    CommandPathObject *manualExposure60 = [[CommandPathObject alloc] init];
    manualExposure60.value = @"60";
    manualExposure60.commandPath = @"";
    CommandPathObject *manualExposure80 = [[CommandPathObject alloc] init];
    manualExposure80.value = @"80";
    manualExposure80.commandPath = @"";
    CommandPathObject *manualExposure90 = [[CommandPathObject alloc] init];
    manualExposure90.value = @"90";
    manualExposure90.commandPath = @"";
    CommandPathObject *manualExposure96 = [[CommandPathObject alloc] init];
    manualExposure96.value = @"96";
    manualExposure96.commandPath = @"";
    CommandPathObject *manualExposure100 = [[CommandPathObject alloc] init];
    manualExposure100.value = @"100";
    manualExposure100.commandPath = @"";
    CommandPathObject *manualExposure120 = [[CommandPathObject alloc] init];
    manualExposure120.value = @"120";
    manualExposure120.commandPath = @"";
    CommandPathObject *manualExposure160 = [[CommandPathObject alloc] init];
    manualExposure160.value = @"160";
    manualExposure160.commandPath = @"";
    CommandPathObject *manualExposure180 = [[CommandPathObject alloc] init];
    manualExposure180.value = @"180";
    manualExposure180.commandPath = @"";
    CommandPathObject *manualExposure192 = [[CommandPathObject alloc] init];
    manualExposure192.value = @"192";
    manualExposure192.commandPath = @"";
    CommandPathObject *manualExposure200 = [[CommandPathObject alloc] init];
    manualExposure200.value = @"200";
    manualExposure200.commandPath = @"";
    CommandPathObject *manualExposure240 = [[CommandPathObject alloc] init];
    manualExposure240.value = @"240";
    manualExposure240.commandPath = @"";
    CommandPathObject *manualExposure320 = [[CommandPathObject alloc] init];
    manualExposure320.value = @"320";
    manualExposure320.commandPath = @"";
    CommandPathObject *manualExposure360 = [[CommandPathObject alloc] init];
    manualExposure360.value = @"360";
    manualExposure360.commandPath = @"";
    CommandPathObject *manualExposure400 = [[CommandPathObject alloc] init];
    manualExposure400.value = @"400";
    manualExposure400.commandPath = @"";
    CommandPathObject *manualExposure480 = [[CommandPathObject alloc] init];
    manualExposure480.value = @"480";
    manualExposure480.commandPath = @"";
    CommandPathObject *manualExposure960 = [[CommandPathObject alloc] init];
    manualExposure960.value = @"960";
    manualExposure960.commandPath = @"";
    
    NSMutableArray *myManualExposures = [[NSMutableArray alloc]initWithObjects: manualExposureAuto, manualExposure24, manualExposure25, manualExposure30, manualExposure48, manualExposure50, manualExposure60, manualExposure80, manualExposure90, manualExposure96, manualExposure100, manualExposure120, manualExposure160, manualExposure180, manualExposure192, manualExposure200, manualExposure240, manualExposure320, manualExposure360, manualExposure400, manualExposure480, manualExposure960, nil];
    self.availableVideoManualExposure = myManualExposures;
    return self.availableVideoManualExposure;

    /* // not a clue what to do with this? 12.1.18
     Manual Video Exposure:
     
     Auto Mode: http://10.5.5.9/gp/gpControl/setting/73/0
     
     EV compensation is enabled ONLY in Auto mode.
     
     For 24FPS:
     1/24: http://10.5.5.9/gp/gpControl/setting/73/3
     1/48: http://10.5.5.9/gp/gpControl/setting/73/6
     1/96: http://10.5.5.9/gp/gpControl/setting/73/11
     For 30FPS:
     1/30: http://10.5.5.9/gp/gpControl/setting/73/5
     1/60: http://10.5.5.9/gp/gpControl/setting/73/8
     1/120: http://10.5.5.9/gp/gpControl/setting/73/13
     For 48FPS:
     1/48: http://10.5.5.9/gp/gpControl/setting/73/6
     1/96: http://10.5.5.9/gp/gpControl/setting/73/11
     1/192: http://10.5.5.9/gp/gpControl/setting/73/16
     For 60FPS:
     1/60: http://10.5.5.9/gp/gpControl/setting/73/8
     1/120: http://10.5.5.9/gp/gpControl/setting/73/13
     1/240: http://10.5.5.9/gp/gpControl/setting/73/18
     For 90FPS:
     1/90: http://10.5.5.9/gp/gpControl/setting/73/10
     1/180: http://10.5.5.9/gp/gpControl/setting/73/15
     1/360: http://10.5.5.9/gp/gpControl/setting/73/20
     For 120FPS:
     1/120: http://10.5.5.9/gp/gpControl/setting/73/13
     1/240: http://10.5.5.9/gp/gpControl/setting/73/18
     1/480: http://10.5.5.9/gp/gpControl/setting/73/22
     For 240FPS:
     1/120: http://10.5.5.9/gp/gpControl/setting/73/18
     1/240: http://10.5.5.9/gp/gpControl/setting/73/22
     1/480: http://10.5.5.9/gp/gpControl/setting/73/23
     */
}


- (NSMutableArray *)getVideoSharpness {
    CommandPathObject *sharpnessHigh = [[CommandPathObject alloc] init];
    sharpnessHigh.value = @"High";
    sharpnessHigh.commandPath = @"14/0";
    CommandPathObject *sharpnessMedium = [[CommandPathObject alloc] init];
    sharpnessMedium.value = @"Medium";
    sharpnessMedium.commandPath = @"14/1";
    CommandPathObject *sharpnessLow = [[CommandPathObject alloc] init];
    sharpnessLow.value = @"Low";
    sharpnessLow.commandPath = @"14/2";
    
    NSMutableArray *mySharpness = [[NSMutableArray alloc]initWithObjects: sharpnessHigh, sharpnessMedium, sharpnessLow, nil];
    self.availableVideoSharpness = mySharpness;
    return self.availableVideoSharpness;

}

// Switch Binary Values

- (void)getVideoLowLight:(SettingsObject *)objectForSwitch {
    // create a commandPath to send to URL call [with value of object's title]
    CommandPathObject *lowLightObject = [[CommandPathObject alloc]init];
    lowLightObject.value = objectForSwitch.title;
    
    if (objectForSwitch.switchStatus == YES) {
        NSLog(@"Status for object %@ is YES!", objectForSwitch.title);
        // include commandPath for object
        lowLightObject.commandPath = @"8/0";
        // update the switchStatus
        objectForSwitch.switchStatus = NO;
    }
    else if (objectForSwitch.switchStatus == NO) {
        NSLog(@"Status for object %@ is NO!", objectForSwitch.title);
        // include commandPath for object
        lowLightObject.commandPath = @"8/1";
        // update the switchStatus
        objectForSwitch.switchStatus = YES;
    }
    
    [self sendCurrentURL:lowLightObject];
}

- (void)getVideoSpotMeter:(SettingsObject *)objectForSwitch {
    // create a commandPath to send to URL call [with value of object's title]
    CommandPathObject *spotMeterObject = [[CommandPathObject alloc]init];
    spotMeterObject.value = objectForSwitch.title;
    
    if (objectForSwitch.switchStatus == YES) {
        NSLog(@"Status for object %@ is YES!", objectForSwitch.title);
        // include commandPath for object
        spotMeterObject.commandPath = @"9/0";
        // update the switchStatus
        objectForSwitch.switchStatus = NO;
    }
    else if (objectForSwitch.switchStatus == NO) {
        NSLog(@"Status for object %@ is NO!", objectForSwitch.title);
        // include commandPath for object
        spotMeterObject.commandPath = @"9/1";
        // update the switchStatus
        objectForSwitch.switchStatus = YES;
    }
    
    [self sendCurrentURL:spotMeterObject];
}

- (void)getVideoProtune:(SettingsObject *)objectForSwitch {
    // create a commandPath to send to URL call [with value of object's title]
    CommandPathObject *protuneObject = [[CommandPathObject alloc]init];
    protuneObject.value = objectForSwitch.title;
    
    if (objectForSwitch.switchStatus == YES) {
        NSLog(@"Status for object %@ is YES!", objectForSwitch.title);
        // include commandPath for object
        protuneObject.commandPath = @"10/0";
        // update the switchStatus
        objectForSwitch.switchStatus = NO;
    }
    else if (objectForSwitch.switchStatus == NO) {
        NSLog(@"Status for object %@ is NO!", objectForSwitch.title);
        // include commandPath for object
        protuneObject.commandPath = @"10/1";
        // update the switchStatus
        objectForSwitch.switchStatus = YES;
    }
    
    [self sendCurrentURL:protuneObject];
}


#pragma mark - Photo Commands

- (NSMutableArray *)getPhotoColor {
    CommandPathObject *colorFlat = [[CommandPathObject alloc] init];
    colorFlat.value = @"Flat";
    colorFlat.commandPath = @"23/1";
    CommandPathObject *colorGoProColor = [[CommandPathObject alloc] init];
    colorGoProColor.value = @"GoPro Color";
    colorGoProColor.commandPath = @"23/0";
    
    NSMutableArray *myColors = [[NSMutableArray alloc]initWithObjects: colorFlat, colorGoProColor, nil];
    self.availablePhotoColor = myColors;
    return self.availablePhotoColor;
    
}


- (NSMutableArray *)getPhotoContinuousRate {
    CommandPathObject *continuous3 = [[CommandPathObject alloc] init];
    continuous3.value = @"3";
    continuous3.commandPath = @"18/0";
    CommandPathObject *continuous5 = [[CommandPathObject alloc] init];
    continuous5.value = @"5";
    continuous5.commandPath = @"18/1";
    CommandPathObject *continuous10 = [[CommandPathObject alloc] init];
    continuous10.value = @"10";
    continuous10.commandPath = @"18/2";
    
    NSMutableArray *myContinuousRates = [[NSMutableArray alloc]initWithObjects:continuous3, continuous5, continuous10, nil];
    self.availablePhotoContinuousRate = myContinuousRates;
    return self.availablePhotoContinuousRate;
}


- (NSMutableArray *)getPhotoEVComp {
    CommandPathObject *evComp2_0 = [[CommandPathObject alloc] init];
    evComp2_0.value = @"2.0";
    evComp2_0.commandPath = @"26/0";
    CommandPathObject *evComp1_5 = [[CommandPathObject alloc] init];
    evComp1_5.value = @"1.5";
    evComp1_5.commandPath = @"26/1";
    CommandPathObject *evComp1_0 = [[CommandPathObject alloc] init];
    evComp1_0.value = @"1.0";
    evComp1_0.commandPath = @"26/2";
    CommandPathObject *evComp0_5 = [[CommandPathObject alloc] init];
    evComp0_5.value = @"0.5";
    evComp0_5.commandPath = @"26/3";
    CommandPathObject *evComp0 = [[CommandPathObject alloc] init];
    evComp0.value = @"0.0";
    evComp0.commandPath = @"26/4";
    CommandPathObject *evCompN0_5 = [[CommandPathObject alloc] init];
    evCompN0_5.value = @"-0.5";
    evCompN0_5.commandPath = @"26/5";
    CommandPathObject *evCompN1_0 = [[CommandPathObject alloc] init];
    evCompN1_0.value = @"-1.0";
    evCompN1_0.commandPath = @"26/6";
    CommandPathObject *evCompN1_5 = [[CommandPathObject alloc] init];
    evCompN1_5.value = @"-1.5";
    evCompN1_5.commandPath = @"26/7";
    CommandPathObject *evCompN2_0 = [[CommandPathObject alloc] init];
    evCompN2_0.value = @"-2.0";
    evCompN2_0.commandPath = @"26/8";
    
    NSMutableArray *myEVComp = [[NSMutableArray alloc]initWithObjects: evComp2_0,evCompN1_5,evCompN1_0,evComp0_5,evComp0,evCompN0_5,evCompN1_0,evCompN1_5,evCompN2_0, nil];
    self.availablePhotoEVComp = myEVComp;
    return self.availablePhotoEVComp;
}


- (NSMutableArray *)getPhotoISOMin {
    CommandPathObject *isoMin100 = [[CommandPathObject alloc] init];
    isoMin100.value = @"100";
    isoMin100.commandPath = @"75/3";
    CommandPathObject *isoMin200 = [[CommandPathObject alloc] init];
    isoMin200.value = @"200";
    isoMin200.commandPath = @"75/2";
    CommandPathObject *isoMin400 = [[CommandPathObject alloc] init];
    isoMin400.value = @"400";
    isoMin400.commandPath = @"75/1";
    CommandPathObject *isoMin800 = [[CommandPathObject alloc] init];
    isoMin800.value = @"800";
    isoMin800.commandPath = @"75/0";
    
    NSMutableArray *myISOMin = [[NSMutableArray alloc]initWithObjects: isoMin100, isoMin200, isoMin400, isoMin800, nil];
    self.availablePhotoISOMin = myISOMin;
    return self.availablePhotoISOMin;
}


- (NSMutableArray *)getPhotoMegaPixels {
    CommandPathObject *megaPixel12w = [[CommandPathObject alloc] init];
    megaPixel12w.value = @"12MP Wide";
    megaPixel12w.commandPath = @"17/0";
    CommandPathObject *megaPixel7w = [[CommandPathObject alloc] init];
    megaPixel7w.value = @"7MP Wide";
    megaPixel7w.commandPath = @"17/1";
    CommandPathObject *megaPixel7m = [[CommandPathObject alloc] init];
    megaPixel7m.value = @"7MP Med";
    megaPixel7m.commandPath = @"17/2";
    CommandPathObject *megaPixel5m = [[CommandPathObject alloc] init];
    megaPixel5m.value = @"5MP Med";
    megaPixel5m.commandPath = @"17/3";
    
    
    NSMutableArray *myMegaPixels = [[NSMutableArray alloc]initWithObjects: megaPixel12w, megaPixel7w, megaPixel7m, megaPixel5m, nil];
    self.availablePhotoMegaPixels = myMegaPixels;
    return self.availablePhotoMegaPixels;
    
}


- (NSMutableArray *)getPhotoNightExposure {
    CommandPathObject *nightExposureAuto = [[CommandPathObject alloc] init];
    nightExposureAuto.value = @"Auto";
    nightExposureAuto.commandPath = @"19/0";
    CommandPathObject *nightExposure2 = [[CommandPathObject alloc] init];
    nightExposure2.value = @"2";
    nightExposure2.commandPath = @"19/1";
    CommandPathObject *nightExposure5 = [[CommandPathObject alloc] init];
    nightExposure5.value = @"5";
    nightExposure5.commandPath = @"19/2";
    CommandPathObject *nightExposure10 = [[CommandPathObject alloc] init];
    nightExposure10.value = @"10";
    nightExposure10.commandPath = @"19/3";
    CommandPathObject *nightExposure15 = [[CommandPathObject alloc] init];
    nightExposure15.value = @"15";
    nightExposure15.commandPath = @"19/4";
    CommandPathObject *nightExposure20 = [[CommandPathObject alloc] init];
    nightExposure20.value = @"20";
    nightExposure20.commandPath = @"19/5";
    CommandPathObject *nightExposure30 = [[CommandPathObject alloc] init];
    nightExposure30.value = @"30";
    nightExposure30.commandPath = @"19/6";
    
    
    NSMutableArray *myNightExposures = [[NSMutableArray alloc]initWithObjects: nightExposureAuto, nightExposure2, nightExposure5, nightExposure10, nightExposure15, nightExposure20, nightExposure30, nil];
    self.availablePhotoNightExposure = myNightExposures;
    return self.availablePhotoNightExposure;
}



- (NSMutableArray *)getPhotoSharpness {
    CommandPathObject *sharpnessHigh = [[CommandPathObject alloc] init];
    sharpnessHigh.value = @"High";
    sharpnessHigh.commandPath = @"25/0";
    CommandPathObject *sharpnessMedium = [[CommandPathObject alloc] init];
    sharpnessMedium.value = @"Medium";
    sharpnessMedium.commandPath = @"25/1";
    CommandPathObject *sharpnessLow = [[CommandPathObject alloc] init];
    sharpnessLow.value = @"Low";
    sharpnessLow.commandPath = @"25/2";
    
    NSMutableArray *mySharpness = [[NSMutableArray alloc]initWithObjects: sharpnessHigh, sharpnessMedium, sharpnessLow, nil];
    self.availablePhotoSharpness = mySharpness;
    return self.availablePhotoSharpness;
    
}


- (NSMutableArray *)getPhotoSubMode { // different URL
    /* http://10.5.5.9/gp/gpControl/command/sub_mode?mode= */
    CommandPathObject *subMPhotoSingle = [[CommandPathObject alloc] init];
    subMPhotoSingle.value = @"Single";
    subMPhotoSingle.commandPath = @"1&sub_mode=0";
    CommandPathObject *subMPhotoContinuous = [[CommandPathObject alloc] init];
    subMPhotoContinuous.value = @"Continuous";
    subMPhotoContinuous.commandPath = @"1&sub_mode=1";
    CommandPathObject *subMPhotoNight = [[CommandPathObject alloc] init];
    subMPhotoNight.value = @"Night";
    subMPhotoNight.commandPath = @"1&sub_mode=2";
    
    NSMutableArray *mySubModes = [[NSMutableArray alloc]initWithObjects:subMPhotoSingle, subMPhotoContinuous, subMPhotoNight, nil];
    self.availablePhotoSubMode = mySubModes;
    return self.availablePhotoSubMode;
    
}


- (NSMutableArray *)getPhotoWhiteBalance {
    CommandPathObject *whiteBalanceAuto = [[CommandPathObject alloc] init];
    whiteBalanceAuto.value = @"Auto";
    whiteBalanceAuto.commandPath = @"22/0";
    CommandPathObject *whiteBalance3000K = [[CommandPathObject alloc] init];
    whiteBalance3000K.value = @"3000K";
    whiteBalance3000K.commandPath = @"22/1";
    CommandPathObject *whiteBalance4000K = [[CommandPathObject alloc] init];
    whiteBalance4000K.value = @"4000K";
    whiteBalance4000K.commandPath = @"22/5";
    CommandPathObject *whiteBalance4800K = [[CommandPathObject alloc] init];
    whiteBalance4800K.value = @"4800K";
    whiteBalance4800K.commandPath = @"22/6";
    CommandPathObject *whiteBalance5500K = [[CommandPathObject alloc] init];
    whiteBalance5500K.value = @"5500K";
    whiteBalance5500K.commandPath = @"22/2";
    CommandPathObject *whiteBalance6000K = [[CommandPathObject alloc] init];
    whiteBalance6000K.value = @"6000K";
    whiteBalance6000K.commandPath = @"22/7";
    CommandPathObject *whiteBalance6500K = [[CommandPathObject alloc] init];
    whiteBalance6500K.value = @"6500K";
    whiteBalance6500K.commandPath = @"22/3";
    CommandPathObject *whiteBalanceNative = [[CommandPathObject alloc] init];
    whiteBalanceNative.value = @"Native";
    whiteBalanceNative.commandPath = @"22/4";
    
    NSMutableArray *myWhiteBalances = [[NSMutableArray alloc]initWithObjects: whiteBalanceAuto, whiteBalance3000K, whiteBalance4000K, whiteBalance4800K, whiteBalance5500K, whiteBalance6000K, whiteBalance6500K, whiteBalanceNative, nil];
    self.availablePhotoWhiteBalance = myWhiteBalances;
    return self.availablePhotoWhiteBalance;
    
}


- (NSMutableArray *)getPhotoISOLimit {
    CommandPathObject *isoLimit100 = [[CommandPathObject alloc] init];
    isoLimit100.value = @"100";
    isoLimit100.commandPath = @"24/3";
    CommandPathObject *isoLimit200 = [[CommandPathObject alloc] init];
    isoLimit200.value = @"200";
    isoLimit200.commandPath = @"24/2";
    CommandPathObject *isoLimit400 = [[CommandPathObject alloc] init];
    isoLimit400.value = @"400";
    isoLimit400.commandPath = @"24/1";
    CommandPathObject *isoLimit800 = [[CommandPathObject alloc] init];
    isoLimit800.value = @"800";
    isoLimit800.commandPath = @"24/0";
    
    NSMutableArray *myISOLimit = [[NSMutableArray alloc]initWithObjects: isoLimit100, isoLimit200, isoLimit400, isoLimit800, nil];
    self.availablephotoISOLimit = myISOLimit;
    return self.availablephotoISOLimit;
}

// Switch Binary Values
- (void)getPhotoSpotMeter:(SettingsObject *)objectForSwitch {
    // create a commandPath to send to URL call [with value of object's title]
    CommandPathObject *spotMeterObject = [[CommandPathObject alloc]init];
    spotMeterObject.value = objectForSwitch.title;
    
    if (objectForSwitch.switchStatus == YES) {
        NSLog(@"Status for object %@ is YES!", objectForSwitch.title);
        // include commandPath for object
        spotMeterObject.commandPath = @"20/0";
        // update the switchStatus
        objectForSwitch.switchStatus = NO;
    }
    else if (objectForSwitch.switchStatus == NO) {
        NSLog(@"Status for object %@ is NO!", objectForSwitch.title);
        // include commandPath for object
        spotMeterObject.commandPath = @"20/1";
        // update the switchStatus
        objectForSwitch.switchStatus = YES;
    }
    
    [self sendCurrentURL:spotMeterObject];
}

- (void)getPhotoProtune:(SettingsObject *)objectForSwitch {
    // create a commandPath to send to URL call [with value of object's title]
    CommandPathObject *protuneObject = [[CommandPathObject alloc]init];
    protuneObject.value = objectForSwitch.title;
    
    if (objectForSwitch.switchStatus == YES) {
        NSLog(@"Status for object %@ is YES!", objectForSwitch.title);
        // include commandPath for object
        protuneObject.commandPath = @"21/0";
        // update the switchStatus
        objectForSwitch.switchStatus = NO;
    }
    else if (objectForSwitch.switchStatus == NO) {
        NSLog(@"Status for object %@ is NO!", objectForSwitch.title);
        // include commandPath for object
        protuneObject.commandPath = @"21/1";
        // update the switchStatus
        objectForSwitch.switchStatus = YES;
    }
    
    [self sendCurrentURL:protuneObject];
}


#pragma mark - MultiShot Commands


- (NSMutableArray *)getMSBurstRate {
    CommandPathObject *threeOne = [[CommandPathObject alloc] init];
    threeOne.value = @"3 Photos / 1 Second";
    threeOne.commandPath = @"29/0";
    CommandPathObject *fiveOne = [[CommandPathObject alloc] init];
    fiveOne.value = @"5 Photos / 1 Second";
    fiveOne.commandPath = @"29/1";
    CommandPathObject *tenOne = [[CommandPathObject alloc] init];
    tenOne.value = @"10 Photos / 1 Second";
    tenOne.commandPath = @"29/2";
    CommandPathObject *tenTwo = [[CommandPathObject alloc] init];
    tenTwo.value = @"10 Photos / 2 Seconds";
    tenTwo.commandPath = @"29/3";
    CommandPathObject *tenThree = [[CommandPathObject alloc] init];
    tenThree.value = @"10 Photos / 3 Seconds";
    tenThree.commandPath = @"29/4";
    CommandPathObject *thirtyOne = [[CommandPathObject alloc] init];
    thirtyOne.value = @"30 Photos / 1 Second";
    thirtyOne.commandPath = @"29/5";
    CommandPathObject *thirtyTwo = [[CommandPathObject alloc] init];
    thirtyTwo.value = @"30 Photos / 2 Seconds";
    thirtyTwo.commandPath = @"29/6";
    CommandPathObject *thirtyThree = [[CommandPathObject alloc] init];
    thirtyThree.value = @"30 Photos / 3 Seconds";
    thirtyThree.commandPath = @"29/7";
    CommandPathObject *thirtySix = [[CommandPathObject alloc] init];
    thirtySix.value = @"30 Photos / 6 Seconds";
    thirtySix.commandPath = @"29/8";
    
    NSMutableArray *myBurstRates = [[NSMutableArray alloc]initWithObjects: threeOne, fiveOne, tenOne, tenTwo, tenThree, thirtyOne, thirtyTwo, thirtyThree, thirtySix, nil];
    self.availableMSBurstRate = myBurstRates;
    return self.availableMSBurstRate;
}


- (NSMutableArray *)getMSColor {
    CommandPathObject *colorFlat = [[CommandPathObject alloc] init];
    colorFlat.value = @"Flat";
    colorFlat.commandPath = @"36/1";
    CommandPathObject *colorGoProColor = [[CommandPathObject alloc] init];
    colorGoProColor.value = @"GoPro Color";
    colorGoProColor.commandPath = @"36/0";
    
    NSMutableArray *myColors = [[NSMutableArray alloc]initWithObjects: colorFlat, colorGoProColor, nil];
    self.availableMSColor = myColors;
    return self.availableMSColor;
}


- (NSMutableArray *)getMSDefaultSubMode {
    // I do not have the call for this... 12.01.18
    CommandPathObject *defaultSMBurst = [[CommandPathObject alloc] init];
    defaultSMBurst.value = @"Burst";
    defaultSMBurst.commandPath = @"";
    CommandPathObject *defaultSMTimeLapse = [[CommandPathObject alloc] init];
    defaultSMTimeLapse.value = @"Time Lapse";
    defaultSMTimeLapse.commandPath = @"";
    CommandPathObject *defaultSMNightLapse = [[CommandPathObject alloc] init];
    defaultSMNightLapse.value = @"Night Lapse";
    defaultSMNightLapse.commandPath = @"";
    
    NSMutableArray *myDefaultSubModes = [[NSMutableArray alloc]initWithObjects:defaultSMBurst, defaultSMTimeLapse, defaultSMNightLapse, nil];
    self.availableMSDefaultSubMode = myDefaultSubModes;
    return self.availableMSDefaultSubMode;
}


- (NSMutableArray *)getMSEVComp {
    CommandPathObject *evComp2_0 = [[CommandPathObject alloc] init];
    evComp2_0.value = @"2.0";
    evComp2_0.commandPath = @"39/0";
    CommandPathObject *evComp1_5 = [[CommandPathObject alloc] init];
    evComp1_5.value = @"1.5";
    evComp1_5.commandPath = @"39/1";
    CommandPathObject *evComp1_0 = [[CommandPathObject alloc] init];
    evComp1_0.value = @"1.0";
    evComp1_0.commandPath = @"39/2";
    CommandPathObject *evComp0_5 = [[CommandPathObject alloc] init];
    evComp0_5.value = @"0.5";
    evComp0_5.commandPath = @"39/3";
    CommandPathObject *evComp0 = [[CommandPathObject alloc] init];
    evComp0.value = @"0.0";
    evComp0.commandPath = @"39/4";
    CommandPathObject *evCompN0_5 = [[CommandPathObject alloc] init];
    evCompN0_5.value = @"-0.5";
    evCompN0_5.commandPath = @"39/5";
    CommandPathObject *evCompN1_0 = [[CommandPathObject alloc] init];
    evCompN1_0.value = @"-1.0";
    evCompN1_0.commandPath = @"39/6";
    CommandPathObject *evCompN1_5 = [[CommandPathObject alloc] init];
    evCompN1_5.value = @"-1.5";
    evCompN1_5.commandPath = @"39/7";
    CommandPathObject *evCompN2_0 = [[CommandPathObject alloc] init];
    evCompN2_0.value = @"-2.0";
    evCompN2_0.commandPath = @"39/8";
    
    NSMutableArray *myEVComp = [[NSMutableArray alloc]initWithObjects: evComp2_0,evCompN1_5,evCompN1_0,evComp0_5,evComp0,evCompN0_5,evCompN1_0,evCompN1_5,evCompN2_0, nil];
    self.availableMSEVComp = myEVComp;
    return self.availableMSEVComp;
}


- (NSMutableArray *)getMSISOLimit {
    CommandPathObject *isoLimit100 = [[CommandPathObject alloc] init];
    isoLimit100.value = @"100";
    isoLimit100.commandPath = @"37/3";
    CommandPathObject *isoLimit200 = [[CommandPathObject alloc] init];
    isoLimit200.value = @"200";
    isoLimit200.commandPath = @"37/2";
    CommandPathObject *isoLimit400 = [[CommandPathObject alloc] init];
    isoLimit400.value = @"400";
    isoLimit400.commandPath = @"37/1";
    CommandPathObject *isoLimit800 = [[CommandPathObject alloc] init];
    isoLimit800.value = @"800";
    isoLimit800.commandPath = @"37/0";
    
    NSMutableArray *myISOLimit = [[NSMutableArray alloc]initWithObjects: isoLimit100, isoLimit200, isoLimit400, isoLimit800, nil];
    self.availableMSISOLimit = myISOLimit;
    return self.availableMSISOLimit;
}


- (NSMutableArray *)getMSISOMin {
    CommandPathObject *isoMin100 = [[CommandPathObject alloc] init];
    isoMin100.value = @"100";
    isoMin100.commandPath = @"76/3";
    CommandPathObject *isoMin200 = [[CommandPathObject alloc] init];
    isoMin200.value = @"200";
    isoMin200.commandPath = @"76/2";
    CommandPathObject *isoMin400 = [[CommandPathObject alloc] init];
    isoMin400.value = @"400";
    isoMin400.commandPath = @"76/1";
    CommandPathObject *isoMin800 = [[CommandPathObject alloc] init];
    isoMin800.value = @"800";
    isoMin800.commandPath = @"76/0";
    
    NSMutableArray *myISOMin = [[NSMutableArray alloc]initWithObjects: isoMin100, isoMin200, isoMin400, isoMin800, nil];
    self.availableMSISOMin = myISOMin;
    return self.availableMSISOMin;
}


- (NSMutableArray *)getMSMegaPixels {
    CommandPathObject *megaPixel12w = [[CommandPathObject alloc] init];
    megaPixel12w.value = @"12MP Wide";
    megaPixel12w.commandPath = @"28/0";
    CommandPathObject *megaPixel7w = [[CommandPathObject alloc] init];
    megaPixel7w.value = @"7MP Wide";
    megaPixel7w.commandPath = @"28/1";
    CommandPathObject *megaPixel7m = [[CommandPathObject alloc] init];
    megaPixel7m.value = @"7MP Med";
    megaPixel7m.commandPath = @"28/2";
    CommandPathObject *megaPixel5m = [[CommandPathObject alloc] init];
    megaPixel5m.value = @"5MP Med";
    megaPixel5m.commandPath = @"28/3";
    
    
    NSMutableArray *myMegaPixels = [[NSMutableArray alloc]initWithObjects: megaPixel12w, megaPixel7w, megaPixel7m, megaPixel5m, nil];
    self.availableMSMegaPixels = myMegaPixels;
    return self.availableMSMegaPixels;
    
}


- (NSMutableArray *)getMSNLInterval {
    CommandPathObject *tlInterval_Continuous = [[CommandPathObject alloc] init];
    tlInterval_Continuous.value = @"Continuous";
    tlInterval_Continuous.commandPath = @"32/0";
    CommandPathObject *tlInterval_4 = [[CommandPathObject alloc] init];
    tlInterval_4.value = @"4 Seconds";
    tlInterval_4.commandPath = @"32/4";
    CommandPathObject *tlInterval_5 = [[CommandPathObject alloc] init];
    tlInterval_5.value = @"5 Seconds";
    tlInterval_5.commandPath = @"32/5";
    CommandPathObject *tlInterval10 = [[CommandPathObject alloc] init];
    tlInterval10.value = @"10 Seconds";
    tlInterval10.commandPath = @"32/10";
    CommandPathObject *tlInterval15 = [[CommandPathObject alloc] init];
    tlInterval15.value = @"15 Seconds";
    tlInterval15.commandPath = @"32/15";
    CommandPathObject *tlInterval20 = [[CommandPathObject alloc] init];
    tlInterval20.value = @"20 Seconds";
    tlInterval20.commandPath = @"32/20";
    CommandPathObject *tlInterval30 = [[CommandPathObject alloc] init];
    tlInterval30.value = @"30 Seconds";
    tlInterval30.commandPath = @"32/30";
    CommandPathObject *tlInterval60 = [[CommandPathObject alloc] init];
    tlInterval60.value = @"60 Seconds";
    tlInterval60.commandPath = @"32/60";
    CommandPathObject *tlInterval2m = [[CommandPathObject alloc]init];
    tlInterval2m.value = @"2 Minutes";
    tlInterval2m.commandPath = @"32/120";
    CommandPathObject *tlInterval5m = [[CommandPathObject alloc]init];
    tlInterval5m.value = @"5 Minutes";
    tlInterval5m.commandPath = @"32/300";
    CommandPathObject *tlInterval30m = [[CommandPathObject alloc]init];
    tlInterval30m.value = @"30 Minutes";
    tlInterval30m.commandPath = @"32/1800";
    CommandPathObject *tlInterval60m = [[CommandPathObject alloc]init];
    tlInterval60m.value = @"60 Minutes";
    tlInterval60m.commandPath = @"32/3600";




    
    NSMutableArray *myNLIntervals = [[NSMutableArray alloc]initWithObjects: tlInterval_Continuous, tlInterval_4, tlInterval_5, tlInterval10, tlInterval15, tlInterval20, tlInterval30, tlInterval60, tlInterval2m, tlInterval5m, tlInterval30m, tlInterval60m, nil];
    self.availableMSNLInterval = myNLIntervals;
    return self.availableMSNLInterval;
    
}


- (NSMutableArray *)getMSNightExposure {
    CommandPathObject *nightExposureAuto = [[CommandPathObject alloc] init];
    nightExposureAuto.value = @"Auto";
    nightExposureAuto.commandPath = @"31/0";
    CommandPathObject *nightExposure2 = [[CommandPathObject alloc] init];
    nightExposure2.value = @"2";
    nightExposure2.commandPath = @"31/1";
    CommandPathObject *nightExposure5 = [[CommandPathObject alloc] init];
    nightExposure5.value = @"5";
    nightExposure5.commandPath = @"31/2";
    CommandPathObject *nightExposure10 = [[CommandPathObject alloc] init];
    nightExposure10.value = @"10";
    nightExposure10.commandPath = @"31/3";
    CommandPathObject *nightExposure15 = [[CommandPathObject alloc] init];
    nightExposure15.value = @"15";
    nightExposure15.commandPath = @"31/4";
    CommandPathObject *nightExposure20 = [[CommandPathObject alloc] init];
    nightExposure20.value = @"20";
    nightExposure20.commandPath = @"31/5";
    CommandPathObject *nightExposure30 = [[CommandPathObject alloc] init];
    nightExposure30.value = @"30";
    nightExposure30.commandPath = @"31/6";
    
    
    NSMutableArray *myNightExposures = [[NSMutableArray alloc]initWithObjects: nightExposureAuto, nightExposure2, nightExposure5, nightExposure10, nightExposure15, nightExposure20, nightExposure30, nil];
    self.availableMSNightExposure = myNightExposures;
    return self.availableMSNightExposure;
}



- (NSMutableArray *)getMSSharpness {
    CommandPathObject *sharpnessHigh = [[CommandPathObject alloc] init];
    sharpnessHigh.value = @"High";
    sharpnessHigh.commandPath = @"38/0";
    CommandPathObject *sharpnessMedium = [[CommandPathObject alloc] init];
    sharpnessMedium.value = @"Medium";
    sharpnessMedium.commandPath = @"38/1";
    CommandPathObject *sharpnessLow = [[CommandPathObject alloc] init];
    sharpnessLow.value = @"Low";
    sharpnessLow.commandPath = @"38/2";
    
    NSMutableArray *mySharpness = [[NSMutableArray alloc]initWithObjects: sharpnessHigh, sharpnessMedium, sharpnessLow, nil];
    self.availableMSSharpness = mySharpness;
    return self.availableMSSharpness;
}



- (NSMutableArray *)getMSSubMode { // different URL
    /* http://10.5.5.9/gp/gpControl/command/sub_mode?mode= */
    CommandPathObject *subMBurst = [[CommandPathObject alloc] init];
    subMBurst.value = @"Burst";
    subMBurst.commandPath = @"2&sub_mode=0";
    CommandPathObject *subMTimeLapse = [[CommandPathObject alloc] init];
    subMTimeLapse.value = @"Time Lapse";
    subMTimeLapse.commandPath = @"2&sub_mode=1";
    CommandPathObject *subMNightLapse = [[CommandPathObject alloc] init];
    subMNightLapse.value = @"Night Lapse";
    subMNightLapse.commandPath = @"2&sub_mode=2";
    
    NSMutableArray *mySubModes = [[NSMutableArray alloc]initWithObjects:subMBurst, subMTimeLapse, subMNightLapse, nil];
    self.availableMSSubMode = mySubModes;
    return self.availableMSSubMode;
    
}


- (NSMutableArray *)getMSTLInterval {
    CommandPathObject *tlInterval_5 = [[CommandPathObject alloc] init];
    tlInterval_5.value = @".5";
    tlInterval_5.commandPath = @"30/0";
    CommandPathObject *tlInterval1 = [[CommandPathObject alloc] init];
    tlInterval1.value = @"1";
    tlInterval1.commandPath = @"30/1";
    CommandPathObject *tlInterval2 = [[CommandPathObject alloc] init];
    tlInterval2.value = @"2";
    tlInterval2.commandPath = @"30/2";
    CommandPathObject *tlInterval5 = [[CommandPathObject alloc] init];
    tlInterval5.value = @"5";
    tlInterval5.commandPath = @"30/5";
    CommandPathObject *tlInterval10 = [[CommandPathObject alloc] init];
    tlInterval10.value = @"10";
    tlInterval10.commandPath = @"30/10";
    CommandPathObject *tlInterval30 = [[CommandPathObject alloc] init];
    tlInterval30.value = @"30";
    tlInterval30.commandPath = @"30/30";
    CommandPathObject *tlInterval60 = [[CommandPathObject alloc] init];
    tlInterval60.value = @"60";
    tlInterval60.commandPath = @"30/60";
    
    NSMutableArray *myTLIntervals = [[NSMutableArray alloc]initWithObjects: tlInterval_5, tlInterval1, tlInterval2, tlInterval5, tlInterval10, tlInterval30, tlInterval60, nil];
    self.availableMSTLInterval = myTLIntervals;
    return self.availableMSTLInterval;
    
}


- (NSMutableArray *)getMSWhiteBalance {
    CommandPathObject *whiteBalanceAuto = [[CommandPathObject alloc] init];
    whiteBalanceAuto.value = @"Auto";
    whiteBalanceAuto.commandPath = @"35/0";
    CommandPathObject *whiteBalance3000K = [[CommandPathObject alloc] init];
    whiteBalance3000K.value = @"3000K";
    whiteBalance3000K.commandPath = @"35/1";
    CommandPathObject *whiteBalance4000K = [[CommandPathObject alloc] init];
    whiteBalance4000K.value = @"4000K";
    whiteBalance4000K.commandPath = @"35/5";
    CommandPathObject *whiteBalance4800K = [[CommandPathObject alloc] init];
    whiteBalance4800K.value = @"4800K";
    whiteBalance4800K.commandPath = @"35/6";
    CommandPathObject *whiteBalance5500K = [[CommandPathObject alloc] init];
    whiteBalance5500K.value = @"5500K";
    whiteBalance5500K.commandPath = @"35/2";
    CommandPathObject *whiteBalance6000K = [[CommandPathObject alloc] init];
    whiteBalance6000K.value = @"6000K";
    whiteBalance6000K.commandPath = @"35/7";
    CommandPathObject *whiteBalance6500K = [[CommandPathObject alloc] init];
    whiteBalance6500K.value = @"6500K";
    whiteBalance6500K.commandPath = @"35/3";
    CommandPathObject *whiteBalanceNative = [[CommandPathObject alloc] init];
    whiteBalanceNative.value = @"Native";
    whiteBalanceNative.commandPath = @"35/4";
    
    NSMutableArray *myWhiteBalances = [[NSMutableArray alloc]initWithObjects: whiteBalanceAuto, whiteBalance3000K, whiteBalance4000K, whiteBalance4800K, whiteBalance5500K, whiteBalance6000K, whiteBalance6500K, whiteBalanceNative, nil];
    self.availableMSWhiteBalance = myWhiteBalances;
    return self.availableMSWhiteBalance;
    
}

// Switch Binary Values
- (void)getMSSpotMeter:(SettingsObject *)objectForSwitch {
    // create a commandPath to send to URL call [with value of object's title]
    CommandPathObject *spotMeterObject = [[CommandPathObject alloc]init];
    spotMeterObject.value = objectForSwitch.title;
    
    if (objectForSwitch.switchStatus == YES) {
        NSLog(@"Status for object %@ is YES!", objectForSwitch.title);
        // include commandPath for object
        spotMeterObject.commandPath = @"33/0";
        // update the switchStatus
        objectForSwitch.switchStatus = NO;
    }
    else if (objectForSwitch.switchStatus == NO) {
        NSLog(@"Status for object %@ is NO!", objectForSwitch.title);
        // include commandPath for object
        spotMeterObject.commandPath = @"33/1";
        // update the switchStatus
        objectForSwitch.switchStatus = YES;
    }
    
    [self sendCurrentURL:spotMeterObject];
}

- (void)getMSProtune:(SettingsObject *)objectForSwitch {
    // create a commandPath to send to URL call [with value of object's title]
    CommandPathObject *protuneObject = [[CommandPathObject alloc]init];
    protuneObject.value = objectForSwitch.title;
    
    if (objectForSwitch.switchStatus == YES) {
        NSLog(@"Status for object %@ is YES!", objectForSwitch.title);
        // include commandPath for object
        protuneObject.commandPath = @"34/0";
        // update the switchStatus
        objectForSwitch.switchStatus = NO;
    }
    else if (objectForSwitch.switchStatus == NO) {
        NSLog(@"Status for object %@ is NO!", objectForSwitch.title);
        // include commandPath for object
        protuneObject.commandPath = @"34/1";
        // update the switchStatus
        objectForSwitch.switchStatus = YES;
    }
    
    [self sendCurrentURL:protuneObject];
}


#pragma mark - POWER & SHUTTER
//power
- (void)getPower:(SettingsObject *)objectForSwitch {
    // create a commandPath to send to URL call [with value of object's title]
    CommandPathObject *powerObject = [[CommandPathObject alloc]init];
    powerObject.value = objectForSwitch.title;
    
    // 08.19.20 currently we are not including turning back on. A little more involved
    if (objectForSwitch.switchStatus == YES) {
        NSLog(@"[08.19.20 NOT SET YET] Status for object %@ is NO!", objectForSwitch.title);
        // include commandPath for object
        powerObject.commandPath = @"NOT USING YET";
        // update the switchStatus
        objectForSwitch.switchStatus = NO;
    }
    else if (objectForSwitch.switchStatus == NO) {
        NSLog(@"Status for object %@ is YES!", objectForSwitch.title);
        // include commandPath for object
        // http://10.5.5.9/gp/gpControl/command/system/sleep
        powerObject.commandPath = @"/system/sleep";
        // update the switchStatus
        objectForSwitch.switchStatus = YES;
        NSLog(@"GoPro go good night");

    }
    
    [self sendCurrentURL:powerObject];
}

- (void)getRecording:(SettingsObject *)objectForSwitch {
    // create a commandPath to send to URL call [with value of object's title]
    CommandPathObject *recordingObject = [[CommandPathObject alloc]init];
    recordingObject.value = objectForSwitch.title;
    
    if (objectForSwitch.switchStatus == YES) {
        NSLog(@"Status for object %@ is YES!", objectForSwitch.title);
        // include commandPath for object
        recordingObject.commandPath = @"/shutter?p=0";
        // update the switchStatus
        objectForSwitch.switchStatus = NO;
    }
    else if (objectForSwitch.switchStatus == NO) {
        NSLog(@"Status for object %@ is NO!", objectForSwitch.title);
        // include commandPath for object
        recordingObject.commandPath = @"/shutter?p=1";
        // update the switchStatus
        objectForSwitch.switchStatus = YES;
    }
    
    [self sendCurrentURL:recordingObject];
}


#pragma mark - JSON Handling


// once JSON is acquired and parsed, split into settings and status to be used throughout app
-(void)splitJSON{
    
    // send signal to GoPro to recover current settings, and wait for completion
    [self fetchGoProSettingsAndStatusJSONWithCompletion:^(NSDictionary *myJSONDictionary) {
        // split dictionary into status and settings
        self.dictionaryStatusDefinition = [myJSONDictionary objectForKey:@"status"];
        self.dictionarySettingsDefinition = [myJSONDictionary objectForKey:@"settings"];
        
        NSLog(@"signal sent, and received JSON. Now splitting, and assigning to DAO's Setting Object");
        /*http://10.5.5.9/gp/gpControl/status*/
        NSLog(@"settingsDict = %@", self.dictionarySettingsDefinition);
        NSLog(@"statusDict = %@", self.dictionaryStatusDefinition);
        
        // use dictionaries and assign values
        [self assignCurrentStatusSettingsArray];
    }];
}




// send signal to GoPro to receive the JSON - turn that into dictionary - return
-(void)fetchGoProSettingsAndStatusJSONWithCompletion:(void (^)(NSDictionary *myDictionary))completionHandler {
    // create string and fetch status/settings from JSON
    NSString *urlString = @"http://10.5.5.9/gp/gpControl/status";
    NSURL *url = [NSURL URLWithString:urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"finished fetching data");
        
        // create the dictionary from the DATA received
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        //        NSLog(@"my dictionary: %@", jsonDictionary);
        
        //        self.testDictionary = jsonDictionary;
        //10.25.18 needs a check for either correct wifi connection, or that the data is not nil, or that the request hits something and doesnt just float waiting for a response
        NSError *err;
        if (err) {
            NSLog(@"failed to fetch");
            return;
        }
        // once all is complete, and obtained, return the handler
        //        completionHandler(self.testDictionary);
        completionHandler(jsonDictionary);
        
    }]
     resume];
    //    return self.testDictionary;
}

#pragma mark - Return Values
// return readable values // QUESTION 07.11.20 why is there no MegaPixel here?
- (NSMutableArray *)showAvailableArray:(NSString *)title {
    
   /* if ([title isEqualToString:@"Sub Mode"]) {
        if ([self.currentMode isEqualToString:@"Video"]) {
            return self.availableVideoSubMode;
        }
        else if ([self.currentMode isEqualToString:@"Photo"])
            return self.availablePhotoSubMode;
        else if ([self.currentMode isEqualToString:@"MultiShot"])
            return self.availableMSSubMode;
    }
    //    NSLog(@"The array seeking = %@", [titleToArray objectForKey:title]);
    return [self.dictionaryAvailableArrays objectForKey:title];
*/
    // check what title is submitted
    // run correct function, to return array, return given array
    
    if ([title isEqualToString:@"Mode"]) {
        return self.getModeOptions;
    }
    
    // VIDEO
    if ([title isEqualToString:@"Sub Mode"]) {
        return self.getVideoSubMode;
    }
    else if ([title isEqualToString:@"Resolution"]) {
        return self.getVideoResolution;
        
    }
    else if ([title isEqualToString:@"Frame Rate"]) {
        return self.getVideoFrameRate;
        
    }
    else if ([title isEqualToString:@"FOV"]) {
        return self.getVideoFOV;
        
    }
    else if ([title isEqualToString:@"Time Lapse Interval"]) {
        return self.getVideoTLInterval;
        
    }
    else if ([title isEqualToString:@"Looping Interval"]) {
        return self.getVideoLoopingInterval;
        
    }
    else if ([title isEqualToString:@"Photo Video Interval"]) {
        return self.getVideoPhotoVideoInterval;
        
    }
    else if ([title isEqualToString:@"White Balance"]) {
        return self.getVideoWhiteBalance;
        
    }
    else if ([title isEqualToString:@"Color"]) {
        return self.getVideoColor;
        
    }
    else if ([title isEqualToString:@"Manual Exposure"]) {
        return self.getVideoManualExposure;
    
    }
    else if ([title isEqualToString:@"ISO Mode"]) {
        return self.getVideoISOMode;

    }
    else if ([title isEqualToString:@"ISO Limit"]) {
        return self.getVideoISOLimit;

    }
    else if ([title isEqualToString:@"Sharpness"]) {
        return self.getVideoSharpness;

    }
    else if ([title isEqualToString:@"EV Comp"]) {
        return self.getVideoEVComp;
    }
    
    
    // PHOTO
    
    else if ([title isEqualToString:@"Sub Mode"]) {
        return self.getPhotoSubMode;
     }

    else if ([title isEqualToString:@"Continuous Rate"]) {
        return self.getPhotoContinuousRate;
     }

    else if ([title isEqualToString:@"Megapixels"]) {
        return self.getPhotoMegaPixels;
     }

    else if ([title isEqualToString:@"Night Exposure"]) {
        return self.getPhotoNightExposure;
     }

    else if ([title isEqualToString:@"White Balance"]) {
        return self.getPhotoWhiteBalance;
     }

    else if ([title isEqualToString:@"Color"]) {
        return self.getPhotoColor;
     }

    else if ([title isEqualToString:@"Sharpness"]) {
        return self.getPhotoSharpness;
     }

    else if ([title isEqualToString:@"EV Comp"]) {
        return self.getPhotoEVComp;
     }

    else if ([title isEqualToString:@"ISO Min"]) {
        return self.getPhotoISOMin;
     }

    else if ([title isEqualToString:@"ISO Limit"]) {
        return self.getPhotoISOLimit;
     }

    

    else return nil;


}

// if a binary value, check which one and make the call
- (void)switchStatusForObject:(SettingsObject *)objectForSwitch {
    if ([objectForSwitch.paramType isEqualToString:@"typeVideoBinary"]) {
        
        if ([objectForSwitch.title isEqualToString:@"Low Light"]) {
            [self getVideoLowLight:objectForSwitch];
        }
        else if ([objectForSwitch.title isEqualToString:@"Spot Meter"]) {
            [self getVideoSpotMeter:objectForSwitch];
        }
        else if ([objectForSwitch.title isEqualToString:@"Protune"]) {
            [self getVideoProtune:objectForSwitch];
        }
    }
    if ([objectForSwitch.paramType isEqualToString:@"typePhotoBinary"]) {
        
        if ([objectForSwitch.title isEqualToString:@"Spot Meter"]) {
            [self getPhotoSpotMeter:objectForSwitch];
        }
        else if ([objectForSwitch.title isEqualToString:@"Protune"]) {
            [self getPhotoProtune:objectForSwitch];
        }
    }
    if ([objectForSwitch.paramType isEqualToString:@"typeMSBinary"]) {
        
        if ([objectForSwitch.title isEqualToString:@"Spot Meter"]) {
            [self getMSSpotMeter:objectForSwitch];
        }
        else if ([objectForSwitch.title isEqualToString:@"Protune"]) {
            [self getMSProtune:objectForSwitch];
        }
    }
}


#pragma mark - READABLE FUNCTIONS
// return readable values

#pragma mark - Status
// maybe these get rewritten as switch case?

- (NSString *) readableBatteryLevel:(int)value {
    switch (value) {
        case 0:
            return @"Empty";
            break;
        case 1:
            return @"Low";
            break;
        case 2:
            return @"Halfway";
            break;
        case 3:
            return @"Full";
            break;
        case 4:
            return @"Charging";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableBattery:(int)value {
    switch (value) {
        case 0:
            return @"NoBattery";
            break;
        case 1:
            return @"BatteryAvailable";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableModeCurrent:(int)value {
    switch (value) {
        case 0:
            self.currentMode = @"Video";
            return @"Video";
            break;
        case 1:
            self.currentMode = @"Photo";
            return @"Photo";
            break;
        case 2:
            self.currentMode = @"MultiShot";
            return @"MultiShot";
            break;
        case 5:
            return @"Settings";
            break;
        default:
            return NULL;
            break;
    }
    
}
/*
 - (NSString *) readableSubModeCurrentVideo:(int)value {
 switch (value) {
 case 0:
 return @"Video";
 break;
 case 1:
 return @"TLVideo";
 break;
 case 2:
 return @"Video And Photo";
 break;
 
 default:
 return NULL;
 break;
 }
 }
 
 - (NSString *) readableSubModeCurrentPhoto:(int)value {
 switch (value) {
 case 0:
 return @"SinglePic";
 break;
 case 1:
 return @"Continuous";
 break;
 case 2:
 return @"NightPhoto";
 break;
 
 default:
 return NULL;
 break;
 }
 
 }
 
 - (NSString *) readableSubModeCurrentMultiShot:(int)value {
 switch (value) {
 case 0:
 return @"Burst";
 break;
 case 1:
 return @"Time Lapse";
 break;
 case 2:
 return @"Night Lapse";
 break;
 
 default:
 return NULL;
 break;
 }
 
 }*/

- (NSString *) readableStreamingStatus:(int)value {
    switch (value) {
        case 0:
            return @"Not Streaming";
            break;
        case 1:
            return @"Streaming";
            break;
            
        default:
            return NULL;
            break;
    }
    
}

- (NSString *) readableRecordingStatus:(int)value {
    switch (value) {
        case 0:
            return @"Not Recording";
            break;
        case 1:
            return @"Recording";
            break;
            
        default:
            return NULL;
            break;
    }
    
}


- (NSString *) readableSDCard:(int)value {
    switch (value) {
        case 0:
            return @"SDCardAvailable";
            break;
        case 2:
            return @"NoSDCard";
            break;
            
        default:
            return NULL;
            break;
    }
}


#pragma mark - Video Settings
// Video Mode based parameters -- readableVideo

- (NSString *) readableVideoSubMode:(int)value {
    switch (value) {
        case 0:
            return @"Video";
            break;
        case 1:
            return @"Time Lapse Video";
            break;
        case 2:
            return @"Video And Photo";
            break;
        case 3:
            return @"Looping";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoResolution:(int)value {
    switch (value) {
        case 1:
            return @"4K";
            break;
        case 2:
            return @"4K SuperView";
            break;
        case 4:
            return @"2.7K";
            break;
        case 5:
            return @"2.7K SuperView";
            break;
        case 6:
            return @"2.7K_4:3";
            break;
        case 7:
            return @"1440";
            break;
        case 8:
            return @"1080 SuperView";
            break;
        case 9:
            return @"1080";
            break;
        case 10:
            return @"960";
            break;
        case 11:
            return @"720 SuperView";
            break;
        case 12:
            return @"720";
            break;
        case 13:
            return @"WVGA";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoFrameRate:(int)value {
    switch (value) {
        case 0:
            return @"240";
            break;
        case 1:
            return @"120";
            break;
        case 2:
            return @"100";
            break;
        case 3:
            return @"90";
            break;
        case 4:
            return @"80";
            break;
        case 5:
            return @"60";
            break;
        case 6:
            return @"50";
            break;
        case 7:
            return @"48";
            break;
        case 8:
            return @"30";
            break;
        case 9:
            return @"25";
            break;
        case 10:
            return @"24";
            break;
        case 11:
            return @"15";
            break;
        case 12:
            return @"12.5";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoFOV:(int)value {
    switch (value) {
        case 0:
            return @"wide";
            break;
        case 1:
            return @"Medium";
            break;
        case 2:
            return @"Narrow";
            break;
        case 4:
            return @"Linear";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoTLInterval:(int)value { // seconds
    switch (value) {
        case 0:
            return @".5";
            break;
        case 1:
            return @"1";
            break;
        case 2:
            return @"2";
            break;
        case 3:
            return @"5";
            break;
        case 4:
            return @"10";
            break;
        case 5:
            return @"30";
            break;
        case 6:
            return @"60";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoLoopingInterval:(int)value { // minutes
    switch (value) {
        case 0:
            return @"Max";
            break;
        case 1:
            return @"5";
            break;
        case 2:
            return @"20";
            break;
        case 3:
            return @"60";
            break;
        case 4:
            return @"120";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoPhotoVideoInterval:(int)value { // 1 Photo/ %@ seconds
    switch (value) {
        case 1:
            return @"5";
            break;
        case 2:
            return @"10";
            break;
        case 3:
            return @"30";
            break;
        case 4:
            return @"60";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoLowLight:(int)value {
    switch (value) {
        case 1:
            return @"On";
            break;
        case 0:
            return @"Off";
            break;
            
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoSpotMeter:(int)value {
    switch (value) {
        case 1:
            return @"On";
            break;
        case 0:
            return @"Off";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoProtune:(int)value {
    switch (value) {
        case 1:
            return @"On";
            break;
        case 0:
            return @"Off";
            break;
            
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoWhiteBalance:(int)value {
    switch (value) {
        case 0:
            return @"Auto";
            break;
            
        case 1:
            return @"3000K";
            break;
        case 2:
            return @"5500K";
            break;
        case 3:
            return @"6500K";
            break;
        case 4:
            return @"Native";
            break;
        case 5:
            return @"4000K";
            break;
        case 6:
            return @"4800K";
            break;
        case 7:
            return @"6000K";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoColor:(int)value {
    switch (value) {
        case 1:
            return @"Flat";
            break;
        case 0:
            return @"GoPro Color";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoManualExposure:(int)value { // 1/%@
    switch (value) {
        case 0:
            return @"Auto";
            break;
        case 3:
            return @"24";
            break;
        case 4:
            return @"25";
            break;
        case 5:
            return @"30";
            break;
        case 6:
            return @"48";
            break;
        case 7:
            return @"50";
            break;
        case 8:
            return @"60";
            break;
        case 9:
            return @"80";
            break;
        case 10:
            return @"90";
            break;
        case 11:
            return @"96";
            break;
        case 12:
            return @"100";
            break;
        case 13:
            return @"120";
            break;
        case 14:
            return @"160";
            break;
        case 15:
            return @"180";
            break;
        case 16:
            return @"192";
            break;
        case 17:
            return @"200";
            break;
        case 18:
            return @"240";
            break;
        case 19:
            return @"320";
            break;
        case 20:
            return @"360";
            break;
        case 21:
            return @"400";
            break;
        case 22:
            return @"480";
            break;
        case 23:
            return @"960";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoISOMode:(int)value { // (v4.00FW)
    switch (value) {
        case 0:
            return @"Max";
            break;
        case 1:
            return @"Lock";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoISOLimit:(int)value {
    switch (value) {
        case 0:
            return @"6400";
            break;
        case 1:
            return @"1600";
            break;
        case 2:
            return @"400";
            break;
        case 3:
            return @"3200";
            break;
        case 4:
            return @"800";
            break;
        case 7:
            return @"200";
            break;
        case 8:
            return @"100";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoSharpness:(int)value {
    switch (value) {
        case 0:
            return @"High";
            break;
        case 1:
            return @"Medium";
            break;
        case 2:
            return @"Low";
            break;
        case 3: // GoPro Session 4 ONLY
            return @"On";
            break;
        case 4: // GoPro Session 4 ONLY
            return @"Off";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableVideoEVComp:(int)value {
    switch (value) {
        case 0:
            return @"2.0";
            break;
        case 1:
            return @"1.5";
            break;
        case 2:
            return @"1.0";
            break;
        case 3:
            return @"0.5";
            break;
        case 4:
            return @"0.0";
            break;
        case 5:
            return @"-0.5";
            break;
        case 6:
            return @"-1.0";
            break;
        case 7:
            return @"-1.5";
            break;
        case 8:
            return @"-2.0";
            break;
        default:
            return NULL;
            break;
    }
}


#pragma mark - Photo Settings
// Photo Mode based parameters -- readablePhoto

- (NSString *) readablePhotoSubMode:(int)value {
    switch (value) {
        case 0:
            return @"Single";
            break;
        case 1:
            return @"Continuous";
            break;
        case 2:
            return @"Night";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readablePhotoContinuousRate:(int)value { // %@ frames / second
    switch (value) {
        case 0:
            return @"3";
            break;
        case 1:
            return @"5";
            break;
        case 2:
            return @"10";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readablePhotoMegaPixels:(int)value {
    switch (value) {
        case 0:
            return @"12MP Wide";
            break;
        case 1:
            return @"7MP Wide";
            break;
        case 2:
            return @"7MP Med";
            break;
        case 3:
            return @"5MP Med";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readablePhotoNightExposure:(int)value {
    switch (value) {
        case 0:
            return @"Auto";
            break;
        case 1:
            return @"2";
            break;
        case 2:
            return @"5";
            break;
        case 3:
            return @"10";
            break;
        case 4:
            return @"15";
            break;
        case 5:
            return @"20";
            break;
        case 6:
            return @"30";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readablePhotoSpotMeter:(int)value {
    switch (value) {
        case 1:
            return @"On";
            break;
        case 0:
            return @"Off";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readablePhotoProtune:(int)value {
    switch (value) {
        case 1:
            return @"On";
            break;
        case 0:
            return @"Off";
            break;
        default:
            return NULL;
            break;
    }
}


- (NSString *) readablePhotoWhiteBalance:(int)value {
    switch (value) {
        case 0:
            return @"Auto";
            break;
            
        case 1:
            return @"3000K";
            break;
        case 2:
            return @"5500K";
            break;
        case 3:
            return @"6500K";
            break;
        case 4:
            return @"Native";
            break;
        case 5:
            return @"4000K";
            break;
        case 6:
            return @"4800K";
            break;
        case 7:
            return @"6000K";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readablePhotoColor:(int)value {
    switch (value) {
        case 1:
            return @"Flat";
            break;
        case 0:
            return @"GoPro Color";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readablePhotoSharpness:(int)value {
    switch (value) {
        case 0:
            return @"High";
            break;
        case 1:
            return @"Medium";
            break;
        case 2:
            return @"Low";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readablePhotoEVComp:(int)value {
    switch (value) {
        case 0:
            return @"2.0";
            break;
        case 1:
            return @"1.5";
            break;
        case 2:
            return @"1.0";
            break;
        case 3:
            return @"0.5";
            break;
        case 4:
            return @"0.0";
            break;
        case 5:
            return @"-0.5";
            break;
        case 6:
            return @"-1.0";
            break;
        case 7:
            return @"-1.5";
            break;
        case 8:
            return @"-2.0";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readablePhotoISOMin:(int)value {  // (v4.00FW)
    switch (value) {
        case 0:
            return @"800";
            break;
        case 1:
            return @"400";
            break;
        case 2:
            return @"200";
            break;
        case 3:
            return @"100";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readablephotoISOLimit:(int)value {  // (v4.00FW) AKA "Limit"
    switch (value) {
        case 0:
            return @"800";
            break;
        case 1:
            return @"400";
            break;
        case 2:
            return @"200";
            break;
        case 3:
            return @"100";
            break;
        default:
            return NULL;
            break;
    }
}




#pragma mark - MultiShot Settings
// MultiShot Mode based parameters -- readableMS

- (NSString *) readableMSDefaultSubMode:(int)value {
    switch (value) {
        case 0:
            return @"Burst";
            break;
        case 1:
            return @"Time Lapse";
            break;
        case 2:
            return @"Night Lapse";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableMSSubMode:(int)value {
    switch (value) {
        case 0:
            return @"Burst";
            break;
        case 1:
            return @"Time Lapse";
            break;
        case 2:
            return @"Night Lapse";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableMSNightExposure:(int)value { // for NightLapse/NightPhoto Shutter Exposure
    switch (value) {
        case 0:
            return @"Auto";
            break;
        case 1:
            return @"2";
            break;
        case 2:
            return @"5";
            break;
        case 3:
            return @"10";
            break;
        case 4:
            return @"15";
            break;
        case 5:
            return @"20";
            break;
        case 6:
            return @"30";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableMSBurstRate:(int)value {
    switch (value) {
        case 0:
            return @"3 Photos / 1 Second";
            break;
        case 1:
            return @"5 Photos / 1 Second";
            break;
        case 2:
            return @"10 Photos / 1 Second";
            break;
        case 3:
            return @"10 Photos / 2 Seconds";
            break;
        case 4:
            return @"10 Photos / 3 Seconds";
            break;
        case 5:
            return @"30 Photos / 1 Second";
            break;
        case 6:
            return @"30 Photos / 2 Seconds";
            break;
        case 7:
            return @"30 Photos / 3 Seconds";
            break;
        case 8:
            return @"30 Photos / 6 Seconds";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableMSTLInterval:(int)value { // seconds
    switch (value) {
        case 0:
            return @".5";
            break;
        case 1:
            return @"1";
            break;
        case 2:
            return @"2";
            break;
        case 3:
            return @"5";
            break;
        case 4:
            return @"10";
            break;
        case 5:
            return @"30";
            break;
        case 6:
            return @"60";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableMSNLInterval:(int)value {
    switch (value) {
        case 0:
            return @"Continuous";
            break;
        case 4:
            return @"4 Seconds";
            break;
        case 5:
            return @"5 Seconds";
            break;
        case 19:
            return @"10 Seconds";
            break;
        case 15:
            return @"15 Seconds";
            break;
        case 20:
            return @"20 Seconds";
            break;
        case 30:
            return @"30 Seconds";
            break;
        case 60:
            return @"1 Minute";
            break;
        case 120:
            return @"2 Minutes";
            break;
        case 300:
            return @"5 Minutes";
            break;
        case 1800:
            return @"30 Minutes";
            break;
        case 3600:
            return @"60 Minutes";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableMSMegaPixels:(int)value {
    switch (value) {
        case 0:
            return @"12MP Wide";
            break;
        case 1:
            return @"7MP Wide";
            break;
        case 2:
            return @"7MP Med";
            break;
        case 3:
            return @"5MP Med";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableMSSpotMeter:(int)value {
    switch (value) {
        case 1:
            return @"On";
            break;
        case 0:
            return @"Off";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableMSProtune:(int)value {
    switch (value) {
        case 1:
            return @"On";
            break;
        case 0:
            return @"Off";
            break;
            
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableMSWhiteBalance:(int)value {
    switch (value) {
        case 0:
            return @"Auto";
            break;
            
        case 1:
            return @"3000K";
            break;
        case 2:
            return @"5500K";
            break;
        case 3:
            return @"6500K";
            break;
        case 4:
            return @"Native";
            break;
        case 5:
            return @"4000K";
            break;
        case 6:
            return @"4800K";
            break;
        case 7:
            return @"6000K";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableMSColor:(int)value {
    switch (value) {
        case 1:
            return @"Flat";
            break;
        case 0:
            return @"GoPro Color";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableMSSharpness:(int)value {
    switch (value) {
        case 0:
            return @"High";
            break;
        case 1:
            return @"Medium";
            break;
        case 2:
            return @"Low";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableMSEVComp:(int)value {
    switch (value) {
        case 0:
            return @"2.0";
            break;
        case 1:
            return @"1.5";
            break;
        case 2:
            return @"1.0";
            break;
        case 3:
            return @"0.5";
            break;
        case 4:
            return @"0.0";
            break;
        case 5:
            return @"-0.5";
            break;
        case 6:
            return @"-1.0";
            break;
        case 7:
            return @"-1.5";
            break;
        case 8:
            return @"-2.0";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableMSISOMin:(int)value {  // (v4.00FW)
    switch (value) {
        case 0:
            return @"800";
            break;
        case 1:
            return @"400";
            break;
        case 2:
            return @"200";
            break;
        case 3:
            return @"100";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableMSISOLimit:(int)value {  // (v4.00FW) AKA "Limit"
    switch (value) {
        case 0:
            return @"800";
            break;
        case 1:
            return @"400";
            break;
        case 2:
            return @"200";
            break;
        case 3:
            return @"100";
            break;
        default:
            return NULL;
            break;
    }
}

#pragma mark - Other Settings
// Other parameters -- readableOther

- (NSString *) readableOtherLCD:(int)value {
    switch (value) {
        case 1:
            return @"On";
            break;
        case 0:
            return @"Off";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableOtherLCDBrightness:(int)value {
    switch (value) {
        case 0:
            return @"High";
            break;
        case 1:
            return @"Medium";
            break;
        case 2:
            return @"Low";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableOtherLCDLock:(int)value {
    switch (value) {
        case 1:
            return @"On";
            break;
        case 0:
            return @"Off";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableOtherLCDTimeOutSleep:(int)value {
    switch (value) {
        case 0:
            return @"Never";
            break;
        case 1:
            return @"1 Minute";
            break;
        case 2:
            return @"2 Minutes";
            break;
        case 3:
            return @"3 Minutes";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableOtherOrientation:(int)value {
    switch (value) {
        case 0:
            return @"Auto";
            break;
        case 1:
            return @"Up";
            break;
        case 2:
            return @"Down";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableOtherDefaultBootMode:(int)value {
    switch (value) {
        case 0:
            return @"Video";
            break;
        case 1:
            return @"Photo";
            break;
        case 2:
            return @"MultiShot";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableOtherQuickCapture:(int)value {
    switch (value) {
        case 1:
            return @"On";
            break;
        case 0:
            return @"Off";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableOtherLED:(int)value {
    switch (value) {
        case 0:
            return @"Off";
            break;
        case 1:
            return @"2 LEDs"; // Hero4Session if FULL LEDs
            break;
        case 2:
            return @"4 LEDs";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableOtherVolumeBeeps:(int)value {
    switch (value) {
        case 2:
            return @"Mute";
            break;
        case 1:
            return @"70%";
            break;
        case 0:
            return @"100%";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableOtherVideoFormat:(int)value {
    switch (value) {
        case 0:
            return @"NTSC";
            break;
        case 1:
            return @"PAL";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableOtherOnScreenData:(int)value {
    switch (value) {
        case 1:
            return @"On";
            break;
        case 0:
            return @"Off";
            break;
        default:
            return NULL;
            break;
    }
}

- (NSString *) readableOtherAutoPowerOff:(int)value {
    switch (value) {
        case 0:
            return @"Never";
            break;
        case 1:
            return @"1 Minute";
            break;
        case 2:
            return @"2 Minutes";
            break;
        case 3:
            return @"3 Minutes";
            break;
        case 4:
            return @"5 Minutes";
            break;
        default:
            return NULL;
            break;
    }
}


#pragma mark - PRINTING

-(void)printCurrentURL {
    NSLog(@"The DevCall %@",self.urlForCurrentCall);
    [self splitJSON]; 
}

-(void)sendCurrentURL:(CommandPathObject *)object {
    if ([object.value isEqualToString:@"Looping"]) {
        NSLog(@"this is why we need a check");
    }
    // create the URL request with URL string
    NSString *urlString = [[NSString alloc]init];
    if ([object.commandPath containsString:@"sub_mode"]) { // for SUB MODE
        urlString = [NSString stringWithFormat:@"http://10.5.5.9/gp/gpControl/command/sub_mode?mode=%@", object.commandPath];
    }
    else if ([object.commandPath containsString:@"/mode"]||[object.commandPath containsString:@"/shutter"]||[object.commandPath containsString:@"/sleep"]) { // for MODE
        urlString = [NSString stringWithFormat:@"http://10.5.5.9/gp/gpControl/command%@", object.commandPath];
    }
    else {
    urlString = [NSString stringWithFormat:@"http://10.5.5.9/gp/gpControl/setting/%@", object.commandPath];
    }
    NSLog(@"sent to gp %@",urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    
    //create the Method "GET" or "POST"
    [urlRequest setHTTPMethod:@"POST"];
    
    //Convert the String to Data
    NSData *data1 = [urlString dataUsingEncoding:NSUTF8StringEncoding];
    
    //Apply the data to the body
    [urlRequest setHTTPBody:data1];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 200)
        {
            NSError *parseError = nil;
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            NSLog(@"The response is - %@",responseDictionary);
            NSInteger success = [[responseDictionary objectForKey:@"success"] integerValue];
            if(success == 1)
            {
                NSLog(@"signal SUCCESS");
            }
            else
            {
                NSLog(@"signal FAILURE - 07.18.20 still working tho?");
            }
        }
        else
        {
            NSLog(@"Error");
        }
    }];
    [dataTask resume];
    

//    [self splitJSON];
}

//==============================================//


#pragma mark - Singleton Methods & Synthesizing


+ (id)sharedManager {
    static HeroStrings *sharedMyHeroStrings = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyHeroStrings = [[self alloc] init];
    });
    return sharedMyHeroStrings;
}

+ (instancetype)sharedDAO {
    static HeroStrings *sharedDAO = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDAO = [[HeroStrings alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedDAO;
}


- (id)init {
    if (self = [super init]) {
    }
    return self;
}


// Synthesize Properties 10.26.18 [unsure if this is best, or include properties in h file?]
@synthesize availableModes;
@synthesize dictionaryStatusHardcode;
@synthesize dictionarySettingsHardcode;
@synthesize dictionarySettingsDefinition;
@synthesize dictionaryStatusDefinition;
@synthesize dictionaryAvailableArrays;
@synthesize urlForCurrentCall;
@synthesize currentSettingsArray;
@synthesize currentValuesArray;
@synthesize currentMode;
@synthesize availableMSBurstRate;
@synthesize availableMSColor;
@synthesize availableMSDefaultSubMode;
@synthesize availableMSEVComp;
@synthesize availableMSISOLimit;
@synthesize availableMSISOMin;
@synthesize availableMSMegaPixels;
@synthesize availableMSNightExposure;
@synthesize availableMSNLInterval;
@synthesize availableMSSharpness;
@synthesize availableMSSubMode;
@synthesize availableMSTLInterval;
@synthesize availableMSWhiteBalance;
@synthesize availablePhotoColor;
@synthesize availablePhotoContinuousRate;
@synthesize availablePhotoEVComp;
@synthesize availablephotoISOLimit;
@synthesize availablePhotoISOMin;
@synthesize availablePhotoMegaPixels;
@synthesize availablePhotoNightExposure;
@synthesize availablePhotoProtune;
@synthesize availablePhotoSharpness;
@synthesize availablePhotoSpotMeter;
@synthesize availablePhotoSubMode;
@synthesize availablePhotoWhiteBalance;
@synthesize availableVideoColor;
@synthesize availableVideoEVComp;
@synthesize availableVideoFOV;
@synthesize availableVideoFrameRate;
@synthesize availableVideoISOLimit;
@synthesize availableVideoISOMode;
@synthesize availableVideoLoopingInterval;
@synthesize availableVideoLowLight;
@synthesize availableVideoManualExposure;
@synthesize availableVideoPhotoVideoInterval;
@synthesize availableVideoProtune;
@synthesize availableVideoResolution;
@synthesize availableVideoSharpness;
@synthesize availableVideoSpotMeter;
@synthesize availableVideoSubMode;
@synthesize availableVideoTLInterval;
@synthesize availableVideoWhiteBalance;

@end
