//
//  HeroStrings.m
//  GoProApp
//
//  Created by JD Leonard on 11/17/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "HeroStrings.h"

@implementation HeroStrings


-(void)objectDidLoad {
    
    [self createHardCodeDictionary];
    
}

# pragma mark - DICTIONARIES HARDCODE ASSIGN

// this is for comparison to the JSON that comes in. It will make that readable
- (void)createHardCodeDictionary {
    // status hardcode dictionary
    NSDictionary *myStatusDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                                        @"1",  @"battery", // function
                                        @"2",  @"batteryLevel", // function
                                        @"43", @"modeCurrent", // function
                                        @"44", @"subModeCurrent", // function
                                        @"13", @"currentVideoDuration",
                                        @"39", @"capturedMultiShot",
                                        @"31", @"clientsConnected",
                                        @"32", @"streamingStatus", // function
                                        @"33", @"sdCardPresent", // function
                                        @"34", @"remainingPhotos",
                                        @"35", @"remainingVideoTime",
                                        @"36", @"capturedBatchPhotos",
                                        @"37", @"capturedVideos",
                                        @"38", @"capturedPhotosAll",
                                        @"39", @"capturedVideosAll",
                                        @"8",  @"recordingProcessing", //?
                                        @"54", @"remainingBytes",
                                        nil];
    NSLog(@"Hardcoded Status Dict: %@", myStatusDictionary);
    
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
    
    NSLog(@"Hardcoded Settings Dict: %@", mySettingsDictionary);
    
    self.dictionarySettingsHardcode = mySettingsDictionary;
    
    /*============================================== ============================================== ============================================== */
    // available arrays hardcode dictionary
    /*
    NSDictionary *titleToArrayVideo = [[NSDictionary alloc]initWithObjectsAndKeys:
                                       self.availableModes, @"Mode",
                                       //                                  self.availableSubModes, @"Sub Mode",
                                       self.availableVideoResolution, @"Resolution",
                                       self.availableVideoFrameRate, @"Frame Rate",
                                       self.availableVideoFOV, @"FOV",
                                       self.availableVideoTLInterval, @"Time Lapse Interval",
                                       self.availableVideoLoopingInterval, @"Looping Interval",
                                       self.availableVideoPhotoVideoInterval, @"Photo Video Interval",
                                       self.availableVideoWhiteBalance, @"White Balance",
                                       self.availableVideoColor, @"Color",
                                       self.availableVideoManualExposure, @"Manual Exposure",
                                       self.availableVideoISOMode, @"ISO Mode",
                                       self.availableVideoISOLimit, @"ISO Limit",
                                       self.availableVideoSharpness, @"Sharpness",
                                       self.availableVideoEVComp, @"EV Comp",
                                       nil];
    
    self.dictionaryAvailableArrays = titleToArrayVideo;
    */
}


// method for comparing hardcode dictionaries

- (int)compareStatusHardcode:(NSString *)key {
    return [[self.dictionaryStatusDefinition valueForKey:[self.dictionaryStatusHardcode valueForKey:key]]intValue];
}

- (int)compareSettingsHardcode:(NSString *)key {
    return [[self.dictionarySettingsDefinition valueForKey:[self.dictionarySettingsHardcode valueForKey:key]]intValue];
}

// function to assign the JSON values to the settings, displayed in VCs
// this will need to be broken up for given usage of the mode. no need to display video specs, if photo is current.
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
    // assign the property to base if-then's on
    self.currentMode = mode.value;
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
    
    NSMutableArray *statusSettingsArray = [[NSMutableArray alloc]initWithObjects:battery, batteryLevel, mode, sdCardPresent, streamingStatus, nil];
    [self printMyArray:statusSettingsArray];
    
    NSLog(@"remain photos = %d", [self compareStatusHardcode:@"remainingPhotos"]);
    
    NSLog(@"settings object created, and now values assigned");
    
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
    mode.value = [self readableModeCurrent:[self compareStatusHardcode:@"mode"]];
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
    photoSpotMeter.title = @"SpotMeter";
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

// prints out all properties of the settings object within the array
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

#pragma mark - COMMANDPATH

#pragma mark - Video Commands

- (NSMutableArray *)getVideoResolution {
    CommandPathObject *qual4KSV = [[CommandPathObject alloc] init];
    qual4KSV.value = @"4K SuperView";
    qual4KSV.commandPath = @"";
    CommandPathObject *qual4K = [[CommandPathObject alloc] init];
    qual4K.value = @"4K";
    qual4K.commandPath = @"";
    CommandPathObject *qual27KSV = [[CommandPathObject alloc] init];
    qual27KSV.value = @"2.7K SuperView";
    qual27KSV.commandPath = @"";
    CommandPathObject *qual27K = [[CommandPathObject alloc] init];
    qual27K.value = @"2.7K";
    qual27K.commandPath = @"";
    CommandPathObject *qual27K_4_3 = [[CommandPathObject alloc] init];
    qual27K_4_3.value = @"2.7K 4:3";
    qual27K_4_3.commandPath = @"";
    CommandPathObject *qual1440 = [[CommandPathObject alloc] init];
    qual1440.value = @"1440";
    qual1440.commandPath = @"";
    CommandPathObject *qual1080SV = [[CommandPathObject alloc] init];
    qual1080SV.value = @"1080 SuperView";
    qual1080SV.commandPath = @"";
    CommandPathObject *qual1080 = [[CommandPathObject alloc] init];
    qual1080.value = @"1080";
    qual1080.commandPath = @"";
    CommandPathObject *qual960 = [[CommandPathObject alloc] init];
    qual960.value = @"960";
    qual960.commandPath = @"";
    CommandPathObject *qual720SV = [[CommandPathObject alloc] init];
    qual720SV.value = @"720 SuperView";
    qual720SV.commandPath = @"";
    CommandPathObject *qual720 = [[CommandPathObject alloc] init];
    qual720.value = @"720";
    qual720.commandPath = @"";
    CommandPathObject *qualWVGA = [[CommandPathObject alloc] init];
    qualWVGA.value = @"WVGA";
    qualWVGA.commandPath = @"";
    
    
    
    NSMutableArray *myResolutions = [[NSMutableArray alloc]initWithObjects:qual4KSV, qual4K, qual27KSV, qual27K, qual27K_4_3, qual1440, qual1080SV, qual1080, qual960, qual720SV, qual720, qualWVGA, nil ];
    
    self.availableVideoResolution = myResolutions; // necessary for access later? or just return the array
    return myResolutions;
    
}
-(NSMutableArray *)getVideoFrameRate {
    CommandPathObject *fps240 = [[CommandPathObject alloc] init];
    fps240.value = @"240";
    fps240.commandPath = @"";
    CommandPathObject *fps120 = [[CommandPathObject alloc] init];
    fps120.value = @"120";
    fps120.commandPath = @"";
    CommandPathObject *fps100 = [[CommandPathObject alloc] init];
    fps100.value = @"100";
    fps100.commandPath = @"";
    CommandPathObject *fps90 = [[CommandPathObject alloc] init];
    fps90.value = @"90";
    fps90.commandPath = @"";
    CommandPathObject *fps80 = [[CommandPathObject alloc] init];
    fps80.value = @"80";
    fps80.commandPath = @"";
    CommandPathObject *fps60 = [[CommandPathObject alloc] init];
    fps60.value = @"60";
    fps60.commandPath = @"";
    CommandPathObject *fps50 = [[CommandPathObject alloc] init];
    fps50.value = @"50";
    fps50.commandPath = @"";
    CommandPathObject *fps48 = [[CommandPathObject alloc] init];
    fps48.value = @"48";
    fps48.commandPath = @"";
    CommandPathObject *fps30 = [[CommandPathObject alloc] init];
    fps30.value = @"30";
    fps30.commandPath = @"";
    CommandPathObject *fps25 = [[CommandPathObject alloc] init];
    fps25.value = @"25";
    fps25.commandPath = @"";
    CommandPathObject *fps24 = [[CommandPathObject alloc] init];
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
- (NSMutableArray *)getVideoSubMode{
    CommandPathObject *subMVideo = [[CommandPathObject alloc] init];
    subMVideo.value = @"Video";
    subMVideo.commandPath = @"";
    CommandPathObject *subMTLVideo = [[CommandPathObject alloc] init];
    subMTLVideo.value = @"Time Lapse Video";
    subMTLVideo.commandPath = @"";
    CommandPathObject *subMVideoAndPhoto = [[CommandPathObject alloc] init];
    subMVideoAndPhoto.value = @"Video And Photo";
    subMVideoAndPhoto.commandPath = @"";
    CommandPathObject *subMLooping = [[CommandPathObject alloc] init];
    subMLooping.value = @"Looping";
    subMLooping.commandPath = @"";
    
    NSMutableArray *mySubModes = [[NSMutableArray alloc]initWithObjects:subMVideo, subMTLVideo, subMVideoAndPhoto, subMLooping, nil];
    self.availableVideoSubMode = mySubModes;
    return self.availableVideoSubMode;
    
}

- (NSMutableArray *)getVideoFOV {
    CommandPathObject *fovWide = [[CommandPathObject alloc] init];
    fovWide.value = @"Wide";
    fovWide.commandPath = @"";
    
    CommandPathObject *fovMedium = [[CommandPathObject alloc] init];
    fovMedium.value = @"Medium";
    fovMedium.commandPath = @"";
    
    CommandPathObject *fovNarrow = [[CommandPathObject alloc] init];
    fovNarrow.value = @"Narrow";
    fovNarrow.commandPath = @"";
    
    CommandPathObject *fovLinear = [[CommandPathObject alloc] init];
    fovLinear.value = @"Linear";
    fovLinear.commandPath = @"";
    
    NSMutableArray *myFOVs = [[NSMutableArray alloc]initWithObjects: fovWide, fovMedium, fovNarrow, fovLinear, nil];
    self.availableVideoFOV = myFOVs;
    return self.availableVideoFOV;
}

- (NSMutableArray *)getVideoTLInterval {
    CommandPathObject *tlInterval_5 = [[CommandPathObject alloc] init];
    tlInterval_5.value = @".5";
    tlInterval_5.commandPath = @"";
    CommandPathObject *tlInterval1 = [[CommandPathObject alloc] init];
    tlInterval1.value = @"1";
    tlInterval1.commandPath = @"";
    CommandPathObject *tlInterval2 = [[CommandPathObject alloc] init];
    tlInterval2.value = @"2";
    tlInterval2.commandPath = @"";
    CommandPathObject *tlInterval5 = [[CommandPathObject alloc] init];
    tlInterval5.value = @"5";
    tlInterval5.commandPath = @"";
    CommandPathObject *tlInterval10 = [[CommandPathObject alloc] init];
    tlInterval10.value = @"10";
    tlInterval10.commandPath = @"";
    CommandPathObject *tlInterval30 = [[CommandPathObject alloc] init];
    tlInterval30.value = @"30";
    tlInterval30.commandPath = @"";
    CommandPathObject *tlInterval60 = [[CommandPathObject alloc] init];
    tlInterval60.value = @"60";
    tlInterval60.commandPath = @"";
    
    NSMutableArray *myTLIntervals = [[NSMutableArray alloc]initWithObjects: tlInterval_5, tlInterval1, tlInterval2, tlInterval5, tlInterval10, tlInterval30, tlInterval60, nil];
    self.availableVideoTLInterval = myTLIntervals;
    return self.availableVideoTLInterval;
}

- (NSMutableArray *)getVideoLoopingInterval {
    CommandPathObject *loopingIntervalMax = [[CommandPathObject alloc] init];
    loopingIntervalMax.value = @"Max";
    loopingIntervalMax.commandPath = @"";
    CommandPathObject *loopingInterval5 = [[CommandPathObject alloc] init];
    loopingInterval5.value = @"5";
    loopingInterval5.commandPath = @"";
    CommandPathObject *loopingInterval20 = [[CommandPathObject alloc] init];
    loopingInterval20.value = @"20";
    loopingInterval20.commandPath = @"";
    CommandPathObject *loopingInterval60 = [[CommandPathObject alloc] init];
    loopingInterval60.value = @"60";
    loopingInterval60.commandPath = @"";
    CommandPathObject *loopingInterval120 = [[CommandPathObject alloc] init];
    loopingInterval120.value = @"120";
    loopingInterval120.commandPath = @"";
    
    NSMutableArray *myLoopingIntervals = [[NSMutableArray alloc]initWithObjects: loopingIntervalMax, loopingInterval5, loopingInterval20,loopingInterval60, loopingInterval120, nil];
    self.availableVideoLoopingInterval = myLoopingIntervals;
    return self.availableVideoLoopingInterval;

    
}

- (NSMutableArray *)getVideoPhotoVideoInterval {
    CommandPathObject *pvInterval5 = [[CommandPathObject alloc] init];
    pvInterval5.value = @"5";
    pvInterval5.commandPath = @"";
    CommandPathObject *pvInterval10 = [[CommandPathObject alloc] init];
    pvInterval10.value = @"10";
    pvInterval10.commandPath = @"";
    CommandPathObject *pvInterval30 = [[CommandPathObject alloc] init];
    pvInterval30.value = @"30";
    pvInterval30.commandPath = @"";
    CommandPathObject *pvInterval60 = [[CommandPathObject alloc] init];
    pvInterval60.value = @"60";
    pvInterval60.commandPath = @"";
    
    NSMutableArray *myPhotoVideoIntervals = [[NSMutableArray alloc]initWithObjects: pvInterval5, pvInterval10, pvInterval30, pvInterval60, nil];
    self.availableVideoPhotoVideoInterval = myPhotoVideoIntervals;
    return self.availableVideoPhotoVideoInterval;

}

- (NSMutableArray *)getVideoWhiteBalance {
    CommandPathObject *whiteBalanceAuto = [[CommandPathObject alloc] init];
    whiteBalanceAuto.value = @"Auto";
    whiteBalanceAuto.commandPath = @"";
    CommandPathObject *whiteBalance3000K = [[CommandPathObject alloc] init];
    whiteBalance3000K.value = @"3000K";
    whiteBalance3000K.commandPath = @"";
    CommandPathObject *whiteBalance4000K = [[CommandPathObject alloc] init];
    whiteBalance4000K.value = @"4000K";
    whiteBalance4000K.commandPath = @"";
    CommandPathObject *whiteBalance4800K = [[CommandPathObject alloc] init];
    whiteBalance4800K.value = @"4800K";
    whiteBalance4800K.commandPath = @"";
    CommandPathObject *whiteBalance5500K = [[CommandPathObject alloc] init];
    whiteBalance5500K.value = @"5500K";
    whiteBalance5500K.commandPath = @"";
    CommandPathObject *whiteBalance6000K = [[CommandPathObject alloc] init];
    whiteBalance6000K.value = @"6000K";
    whiteBalance6000K.commandPath = @"";
    CommandPathObject *whiteBalance6500K = [[CommandPathObject alloc] init];
    whiteBalance6500K.value = @"6500K";
    whiteBalance6500K.commandPath = @"";
    CommandPathObject *whiteBalanceNative = [[CommandPathObject alloc] init];
    whiteBalanceNative.value = @"Native";
    whiteBalanceNative.commandPath = @"";
    
    NSMutableArray *myWhiteBalances = [[NSMutableArray alloc]initWithObjects: whiteBalanceAuto, whiteBalance3000K, whiteBalance4000K, whiteBalance4800K, whiteBalance5500K, whiteBalance6000K, whiteBalance6500K, whiteBalanceNative, nil];
    self.availableVideoWhiteBalance = myWhiteBalances;
    return self.availableVideoWhiteBalance;

}

- (NSMutableArray *)getVideoColor {
    CommandPathObject *colorFlat = [[CommandPathObject alloc] init];
    colorFlat.value = @"Flat";
    colorFlat.commandPath = @"";
    CommandPathObject *colorGoProColor = [[CommandPathObject alloc] init];
    colorGoProColor.value = @"GoPro Color";
    colorGoProColor.commandPath = @"";
    
    NSMutableArray *myColors = [[NSMutableArray alloc]initWithObjects: colorFlat, colorGoProColor, nil];
    self.availableVideoColor = myColors;
    return self.availableVideoColor;


}


- (NSMutableArray *)getVideoEVComp {
    CommandPathObject *evComp2_0 = [[CommandPathObject alloc] init];
    evComp2_0.value = @"2.0";
    evComp2_0.commandPath = @"";
    CommandPathObject *evComp1_5 = [[CommandPathObject alloc] init];
    evComp1_5.value = @"1.5";
    evComp1_5.commandPath = @"";
    CommandPathObject *evComp1_0 = [[CommandPathObject alloc] init];
    evComp1_0.value = @"1.0";
    evComp1_0.commandPath = @"";
    CommandPathObject *evComp0_5 = [[CommandPathObject alloc] init];
    evComp0_5.value = @"0.5";
    evComp0_5.commandPath = @"";
    CommandPathObject *evComp0 = [[CommandPathObject alloc] init];
    evComp0.value = @"0.0";
    evComp0.commandPath = @"";
    CommandPathObject *evCompn0_5 = [[CommandPathObject alloc] init];
    evCompn0_5.value = @"-0.5";
    evCompn0_5.commandPath = @"";
    CommandPathObject *evCompn1_0 = [[CommandPathObject alloc] init];
    evCompn1_0.value = @"-1.0";
    evCompn1_0.commandPath = @"";
    CommandPathObject *evCompn1_5 = [[CommandPathObject alloc] init];
    evCompn1_5.value = @"-1.5";
    evCompn1_5.commandPath = @"";
    CommandPathObject *evCompn2_0 = [[CommandPathObject alloc] init];
    evCompn2_0.value = @"-2.0";
    evCompn2_0.commandPath = @"";
    
    NSMutableArray *myEVComp = [[NSMutableArray alloc]initWithObjects: evComp2_0,evCompn1_5,evCompn1_0,evComp0_5,evComp0,evCompn0_5,evCompn1_0,evCompn1_5,evCompn2_0, nil];
    self.availableVideoEVComp = myEVComp;
    return self.availableVideoEVComp;

}





- (NSMutableArray *)getVideoISOLimit {
    CommandPathObject *isoLimit100 = [[CommandPathObject alloc] init];
    isoLimit100.value = @"100";
    isoLimit100.commandPath = @"";
    CommandPathObject *isoLimit200 = [[CommandPathObject alloc] init];
    isoLimit200.value = @"200";
    isoLimit200.commandPath = @"";
    CommandPathObject *isoLimit400 = [[CommandPathObject alloc] init];
    isoLimit400.value = @"400";
    isoLimit400.commandPath = @"";
    CommandPathObject *isoLimit800 = [[CommandPathObject alloc] init];
    isoLimit800.value = @"800";
    isoLimit800.commandPath = @"";
    CommandPathObject *isoLimit1600 = [[CommandPathObject alloc] init];
    isoLimit1600.value = @"1600";
    isoLimit1600.commandPath = @"";
    CommandPathObject *isoLimit3200 = [[CommandPathObject alloc] init];
    isoLimit3200.value = @"3200";
    isoLimit3200.commandPath = @"";
    
    NSMutableArray *myISOLimit = [[NSMutableArray alloc]initWithObjects: isoLimit100, isoLimit200, isoLimit400, isoLimit800, isoLimit1600, isoLimit3200, nil];
    self.availableVideoISOLimit = myISOLimit;
    return self.availableVideoISOLimit;

}


- (NSMutableArray *)getVideoISOMode {
    CommandPathObject *isoModeMax = [[CommandPathObject alloc] init];
    isoModeMax.value = @"Max";
    isoModeMax.commandPath = @"";
    CommandPathObject *isoModeLock = [[CommandPathObject alloc] init];
    isoModeLock.value = @"Lock";
    isoModeLock.commandPath = @"";
    
    NSMutableArray *myISOMode = [[NSMutableArray alloc]initWithObjects:isoModeMax, isoModeLock, nil];
    self.availableVideoISOMode = myISOMode;
    return self.availableVideoISOMode;

}


- (NSMutableArray *)getVideoManualExposure {
    CommandPathObject *manualExposureAuto = [[CommandPathObject alloc] init];
    manualExposureAuto.value = @"Auto";
    manualExposureAuto.commandPath = @"";
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

}


- (NSMutableArray *)getVideoSharpness {
    CommandPathObject *sharpnessHigh = [[CommandPathObject alloc] init];
    sharpnessHigh.value = @"High";
    sharpnessHigh.commandPath = @"";
    CommandPathObject *sharpnessMedium = [[CommandPathObject alloc] init];
    sharpnessMedium.value = @"Medium";
    sharpnessMedium.commandPath = @"";
    CommandPathObject *sharpnessLow = [[CommandPathObject alloc] init];
    sharpnessLow.value = @"Low";
    sharpnessLow.commandPath = @"";
    
    NSMutableArray *mySharpness = [[NSMutableArray alloc]initWithObjects: sharpnessHigh, sharpnessMedium, sharpnessLow, nil];
    self.availableVideoSharpness = mySharpness;
    return self.availableVideoSharpness;

}

#pragma mark - Photo Commands

- (NSMutableArray *)getPhotoColor {
    CommandPathObject *colorFlat = [[CommandPathObject alloc] init];
    colorFlat.value = @"Flat";
    colorFlat.commandPath = @"";
    CommandPathObject *colorGoProColor = [[CommandPathObject alloc] init];
    colorGoProColor.value = @"GoPro Color";
    colorGoProColor.commandPath = @"";
    
    NSMutableArray *myColors = [[NSMutableArray alloc]initWithObjects: colorFlat, colorGoProColor, nil];
    self.availablePhotoColor = myColors;
    return self.availablePhotoColor;
    
}


- (NSMutableArray *)getPhotoContinuousRate {
    CommandPathObject *continuous3 = [[CommandPathObject alloc] init];
    continuous3.value = @"3";
    continuous3.commandPath = @"";
    CommandPathObject *continuous5 = [[CommandPathObject alloc] init];
    continuous5.value = @"5";
    continuous5.commandPath = @"";
    CommandPathObject *continuous10 = [[CommandPathObject alloc] init];
    continuous10.value = @"10";
    continuous10.commandPath = @"";
    
    NSMutableArray *myContinuousRates = [[NSMutableArray alloc]initWithObjects:continuous3, continuous5, continuous10, nil];
    self.availablePhotoContinuousRate = myContinuousRates;
    return self.availablePhotoContinuousRate;
}


- (NSMutableArray *)getPhotoEVComp {
    CommandPathObject *evComp2_0 = [[CommandPathObject alloc] init];
    evComp2_0.value = @"2.0";
    evComp2_0.commandPath = @"";
    CommandPathObject *evComp1_5 = [[CommandPathObject alloc] init];
    evComp1_5.value = @"1.5";
    evComp1_5.commandPath = @"";
    CommandPathObject *evComp1_0 = [[CommandPathObject alloc] init];
    evComp1_0.value = @"1.0";
    evComp1_0.commandPath = @"";
    CommandPathObject *evComp0_5 = [[CommandPathObject alloc] init];
    evComp0_5.value = @"0.5";
    evComp0_5.commandPath = @"";
    CommandPathObject *evComp0 = [[CommandPathObject alloc] init];
    evComp0.value = @"0.0";
    evComp0.commandPath = @"";
    CommandPathObject *evCompn0_5 = [[CommandPathObject alloc] init];
    evCompn0_5.value = @"-0.5";
    evCompn0_5.commandPath = @"";
    CommandPathObject *evCompn1_0 = [[CommandPathObject alloc] init];
    evCompn1_0.value = @"-1.0";
    evCompn1_0.commandPath = @"";
    CommandPathObject *evCompn1_5 = [[CommandPathObject alloc] init];
    evCompn1_5.value = @"-1.5";
    evCompn1_5.commandPath = @"";
    CommandPathObject *evCompn2_0 = [[CommandPathObject alloc] init];
    evCompn2_0.value = @"-2.0";
    evCompn2_0.commandPath = @"";
    
    NSMutableArray *myEVComp = [[NSMutableArray alloc]initWithObjects: evComp2_0,evCompn1_5,evCompn1_0,evComp0_5,evComp0,evCompn0_5,evCompn1_0,evCompn1_5,evCompn2_0, nil];
    self.availablePhotoEVComp = myEVComp;
    return self.availablePhotoEVComp;
}


- (NSMutableArray *)getPhotoISOMin {
    CommandPathObject *isoMin100 = [[CommandPathObject alloc] init];
    isoMin100.value = @"100";
    isoMin100.commandPath = @"";
    CommandPathObject *isoMin200 = [[CommandPathObject alloc] init];
    isoMin200.value = @"200";
    isoMin200.commandPath = @"";
    CommandPathObject *isoMin400 = [[CommandPathObject alloc] init];
    isoMin400.value = @"400";
    isoMin400.commandPath = @"";
    CommandPathObject *isoMin800 = [[CommandPathObject alloc] init];
    isoMin800.value = @"800";
    isoMin800.commandPath = @"";
    
    NSMutableArray *myISOMin = [[NSMutableArray alloc]initWithObjects: isoMin100, isoMin200, isoMin400, isoMin800, nil];
    self.availablePhotoISOMin = myISOMin;
    return self.availablePhotoISOMin;
}


- (NSMutableArray *)getPhotoMegaPixels {
    CommandPathObject *megaPixel12w = [[CommandPathObject alloc] init];
    megaPixel12w.value = @"12MP Wide";
    megaPixel12w.commandPath = @"";
    CommandPathObject *megaPixel7w = [[CommandPathObject alloc] init];
    megaPixel7w.value = @"7MP Wide";
    megaPixel7w.commandPath = @"";
    CommandPathObject *megaPixel7m = [[CommandPathObject alloc] init];
    megaPixel7m.value = @"7MP Med";
    megaPixel7m.commandPath = @"";
    CommandPathObject *megaPixel5m = [[CommandPathObject alloc] init];
    megaPixel5m.value = @"5MP Med";
    megaPixel5m.commandPath = @"";
    
    
    NSMutableArray *myMegaPixels = [[NSMutableArray alloc]initWithObjects: megaPixel12w, megaPixel7w, megaPixel7m, megaPixel5m, nil];
    self.availablePhotoMegaPixels = myMegaPixels;
    return self.availablePhotoMegaPixels;
    
}


- (NSMutableArray *)getPhotoNightExposure {
    CommandPathObject *nightExposureAuto = [[CommandPathObject alloc] init];
    nightExposureAuto.value = @"Auto";
    nightExposureAuto.commandPath = @"";
    CommandPathObject *nightExposure2 = [[CommandPathObject alloc] init];
    nightExposure2.value = @"2";
    nightExposure2.commandPath = @"";
    CommandPathObject *nightExposure5 = [[CommandPathObject alloc] init];
    nightExposure5.value = @"5";
    nightExposure5.commandPath = @"";
    CommandPathObject *nightExposure10 = [[CommandPathObject alloc] init];
    nightExposure10.value = @"10";
    nightExposure10.commandPath = @"";
    CommandPathObject *nightExposure15 = [[CommandPathObject alloc] init];
    nightExposure15.value = @"15";
    nightExposure15.commandPath = @"";
    CommandPathObject *nightExposure20 = [[CommandPathObject alloc] init];
    nightExposure20.value = @"20";
    nightExposure20.commandPath = @"";
    CommandPathObject *nightExposure30 = [[CommandPathObject alloc] init];
    nightExposure30.value = @"30";
    nightExposure30.commandPath = @"";
    
    
    NSMutableArray *myNightExposures = [[NSMutableArray alloc]initWithObjects: nightExposureAuto, nightExposure2, nightExposure5, nightExposure10, nightExposure15, nightExposure20, nightExposure30, nil];
    self.availablePhotoNightExposure = myNightExposures;
    return self.availablePhotoNightExposure;
}



- (NSMutableArray *)getPhotoSharpness {
    CommandPathObject *sharpnessHigh = [[CommandPathObject alloc] init];
    sharpnessHigh.value = @"High";
    sharpnessHigh.commandPath = @"";
    CommandPathObject *sharpnessMedium = [[CommandPathObject alloc] init];
    sharpnessMedium.value = @"Medium";
    sharpnessMedium.commandPath = @"";
    CommandPathObject *sharpnessLow = [[CommandPathObject alloc] init];
    sharpnessLow.value = @"Low";
    sharpnessLow.commandPath = @"";
    
    NSMutableArray *mySharpness = [[NSMutableArray alloc]initWithObjects: sharpnessHigh, sharpnessMedium, sharpnessLow, nil];
    self.availablePhotoSharpness = mySharpness;
    return self.availablePhotoSharpness;
    
}


- (NSMutableArray *)getPhotoSubMode {
    CommandPathObject *subMPhotoSingle = [[CommandPathObject alloc] init];
    subMPhotoSingle.value = @"Single";
    subMPhotoSingle.commandPath = @"";
    CommandPathObject *subMPhotoContinuous = [[CommandPathObject alloc] init];
    subMPhotoContinuous.value = @"Continuous";
    subMPhotoContinuous.commandPath = @"";
    CommandPathObject *subMPhotoNight = [[CommandPathObject alloc] init];
    subMPhotoNight.value = @"Night";
    subMPhotoNight.commandPath = @"";
    
    NSMutableArray *mySubModes = [[NSMutableArray alloc]initWithObjects:subMPhotoSingle, subMPhotoContinuous, subMPhotoNight, nil];
    self.availablePhotoSubMode = mySubModes;
    return self.availablePhotoSubMode;
    
}


- (NSMutableArray *)getPhotoWhiteBalance {
    CommandPathObject *whiteBalanceAuto = [[CommandPathObject alloc] init];
    whiteBalanceAuto.value = @"Auto";
    whiteBalanceAuto.commandPath = @"";
    CommandPathObject *whiteBalance3000K = [[CommandPathObject alloc] init];
    whiteBalance3000K.value = @"3000K";
    whiteBalance3000K.commandPath = @"";
    CommandPathObject *whiteBalance4000K = [[CommandPathObject alloc] init];
    whiteBalance4000K.value = @"4000K";
    whiteBalance4000K.commandPath = @"";
    CommandPathObject *whiteBalance4800K = [[CommandPathObject alloc] init];
    whiteBalance4800K.value = @"4800K";
    whiteBalance4800K.commandPath = @"";
    CommandPathObject *whiteBalance5500K = [[CommandPathObject alloc] init];
    whiteBalance5500K.value = @"5500K";
    whiteBalance5500K.commandPath = @"";
    CommandPathObject *whiteBalance6000K = [[CommandPathObject alloc] init];
    whiteBalance6000K.value = @"6000K";
    whiteBalance6000K.commandPath = @"";
    CommandPathObject *whiteBalance6500K = [[CommandPathObject alloc] init];
    whiteBalance6500K.value = @"6500K";
    whiteBalance6500K.commandPath = @"";
    CommandPathObject *whiteBalanceNative = [[CommandPathObject alloc] init];
    whiteBalanceNative.value = @"Native";
    whiteBalanceNative.commandPath = @"";
    
    NSMutableArray *myWhiteBalances = [[NSMutableArray alloc]initWithObjects: whiteBalanceAuto, whiteBalance3000K, whiteBalance4000K, whiteBalance4800K, whiteBalance5500K, whiteBalance6000K, whiteBalance6500K, whiteBalanceNative, nil];
    self.availablePhotoWhiteBalance = myWhiteBalances;
    return self.availablePhotoWhiteBalance;
    
}


- (NSMutableArray *)getphotoISOLimit {
    CommandPathObject *isoLimit100 = [[CommandPathObject alloc] init];
    isoLimit100.value = @"100";
    isoLimit100.commandPath = @"";
    CommandPathObject *isoLimit200 = [[CommandPathObject alloc] init];
    isoLimit200.value = @"200";
    isoLimit200.commandPath = @"";
    CommandPathObject *isoLimit400 = [[CommandPathObject alloc] init];
    isoLimit400.value = @"400";
    isoLimit400.commandPath = @"";
    CommandPathObject *isoLimit800 = [[CommandPathObject alloc] init];
    isoLimit800.value = @"800";
    isoLimit800.commandPath = @"";
    
    NSMutableArray *myISOLimit = [[NSMutableArray alloc]initWithObjects: isoLimit100, isoLimit200, isoLimit400, isoLimit800, nil];
    self.availablephotoISOLimit = myISOLimit;
    return self.availablephotoISOLimit;
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
// return readable values
- (NSMutableArray *)showAvailableArray:(NSString *)title {
    
    if ([title isEqualToString:@"Sub Mode"]) {
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
            return @"Video";
            break;
        case 1:
            return @"Photo";
            break;
        case 2:
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



#pragma mark - Command Paths

// list all HTTP calls for given setting request [without the front part - just the tail]
- (void)createHardCodeCommandPaths {
    // video calls
    CommandPathObject *qual4K = [[CommandPathObject alloc] init];
    qual4K.value = @"4K";
    qual4K.commandPath = @"";
    CommandPathObject *qual4KSV = [[CommandPathObject alloc] init];
    qual4KSV.value = @"4K SuperView";
    qual4KSV.commandPath = @"";
    
    CommandPathObject *qual = [[CommandPathObject alloc] init];
    qual.value = @"";
    qual.commandPath = @"";
    
}

// most likely DELETE 11.26.18
#pragma mark - HTTP CALLS
// return readable values


#pragma mark - POWER & SHUTTER
//power
-(void)powerOn {
    self.urlForCurrentCall =@"Hero Power On";
    [self printCurrentURL];
}
-(void)powerOff {
    self.urlForCurrentCall =@"Hero Power Off";
    [self printCurrentURL];
}

//shutter
- (void)shutterOn{
    self.urlForCurrentCall =@"Hero Shutter On";
    [self printCurrentURL];
}
- (void)shutterOff{
    self.urlForCurrentCall =@"Hero Shutter Off";
    [self printCurrentURL];
}


#pragma mark - MODES
- (void)modeVideo{
    self.urlForCurrentCall =@"Hero Mode Video";
    [self printCurrentURL];
}
- (void)modePhoto{
    self.urlForCurrentCall =@"Hero Mode Photo";
    [self printCurrentURL];
}
- (void)modeMulti{
    self.urlForCurrentCall =@"Hero Mode Multi";
    [self printCurrentURL];
}


#pragma mark - SUB MODES
//video
- (void)subVidVideo{
    self.urlForCurrentCall =@"Hero Mode Video - Sub Mode Video";
    [self printCurrentURL];
}

- (void)subVidTimeLapse{
    self.urlForCurrentCall =@"Hero Mode Video - Sub Mode TimeLapse";
    [self printCurrentURL];
}

- (void)subVidAndPhoto{
    self.urlForCurrentCall =@"Hero Mode Video - Sub Mode Video & Photo";
    [self printCurrentURL];
}

- (void)subVidLooping{
    self.urlForCurrentCall =@"Hero Mode Video - Sub Mode Looping";
    [self printCurrentURL];
}

//photo
- (void)subPhoPhoto{
    self.urlForCurrentCall =@"Hero Mode Photo - Sub Mode Photo";
    [self printCurrentURL];
}

- (void)subPhoContin{
    self.urlForCurrentCall =@"Hero Mode Photo - Sub Mode Continuous";
    [self printCurrentURL];
}

- (void)subPhoNight{
    self.urlForCurrentCall =@"Hero Mode Photo - Sub Mode Night";
    [self printCurrentURL];
}

//multi
- (void)subMulBurst{
    self.urlForCurrentCall =@"Hero Mode Multi - Sub Mode Burst";
    [self printCurrentURL];
}

- (void)subMulTimeLapse{
    self.urlForCurrentCall =@"Hero Mode Multi - Sub Mode Time Lapse";
    [self printCurrentURL];
}

- (void)subMulNightLapse{
    self.urlForCurrentCall =@"Hero Mode Multi - Sub Mode Night Lapse";
    [self printCurrentURL];
}

- (void)changeMode:(NSString *)mode {
    if ([mode isEqual:@"video"]) {
        //        NSLog(@"change to video");
        [self modeVideo];
    }
    else if ([mode isEqual:@"photo"]) {
        //        NSLog(@"change to photo");
        [self modePhoto];
        
    }
    else if ([mode isEqual:@"multi"]) {
        //        NSLog(@"change to multi");
        [self modeMulti];
        
    }
    else
        NSLog(@"Uh oh, user chose something unavaialable");
    
}

- (void)changeSubMode:(NSString *)subMode {
    // if statement
}

#pragma mark - PRINTING

-(void)printCurrentURL {
    NSLog(@"The DevCall %@",self.urlForCurrentCall);
    [self splitJSON];
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

/*

- (NSMutableArray *)getMSBurstRate {
    <#code#>
}


- (NSMutableArray *)getMSColor {
    <#code#>
}


- (NSMutableArray *)getMSDefaultSubMode {
    <#code#>
}


- (NSMutableArray *)getMSEVComp {
    <#code#>
}


- (NSMutableArray *)getMSISOLimit {
    <#code#>
}


- (NSMutableArray *)getMSISOMin {
    <#code#>
}


- (NSMutableArray *)getMSMegaPixels {
    <#code#>
}


- (NSMutableArray *)getMSNLInterval {
    <#code#>
}


- (NSMutableArray *)getMSNightExposure {
    <#code#>
}


- (NSMutableArray *)getMSProtune {
    <#code#>
}


- (NSMutableArray *)getMSSharpness {
    <#code#>
}


- (NSMutableArray *)getMSSpotMeter {
    <#code#>
}


- (NSMutableArray *)getMSSubMode {
    <#code#>
}


- (NSMutableArray *)getMSTLInterval {
    <#code#>
}


- (NSMutableArray *)getMSWhiteBalance {
    <#code#>
}
 */

/*

- (NSMutableArray *)getPhotoColor {
    <#code#>
}


- (NSMutableArray *)getPhotoContinuousRate {
    <#code#>
}


- (NSMutableArray *)getPhotoEVComp {
    <#code#>
}


- (NSMutableArray *)getPhotoISOMin {
    <#code#>
}


- (NSMutableArray *)getPhotoMegaPixels {
    <#code#>
}


- (NSMutableArray *)getPhotoNightExposure {
    <#code#>
}


- (NSMutableArray *)getPhotoProtune {
    <#code#>
}


- (NSMutableArray *)getPhotoSharpness {
    <#code#>
}


- (NSMutableArray *)getPhotoSpotMeter {
    <#code#>
}


- (NSMutableArray *)getPhotoSubMode {
    <#code#>
}


- (NSMutableArray *)getPhotoWhiteBalance {
    <#code#>
}


- (NSMutableArray *)getphotoISOLimit {
    <#code#>
}
*/

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
