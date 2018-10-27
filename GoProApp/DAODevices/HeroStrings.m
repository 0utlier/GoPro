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
    
    // create the hardcoded dictionary to define "keys" for the status/settings
    self.dictionarySettingsDefinition = [[NSDictionary alloc]init];
    self.dictionaryStatusDefinition = [[NSDictionary alloc]init];
    [self createHardCodeDictionary];
    //    self.dictionaryStatusDefinition = @{@"CurrentMode": @"43", @"CurrentSubMode":@"44", @"BatteryLevel": @"2", @"BatteryAvailable": @"1"};
    
}

# pragma mark - DICTIONARIES HARDCODE ASSIGN

// this is for comparison to the JSON that comes in. It will make that readable
- (void)createHardCodeDictionary {
    // status hardcode dictionary
    NSDictionary *myStatusDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                                        @"1", @"battery", // function
                                        @"2", @"batteryLevel", // function
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
                                        @"8", @"recordingProcessing", //?
                                        @"54", @"remainingBytes",
                                        nil];
    NSLog(@"Hardcoded Status Dict: %@", myStatusDictionary);
    
    self.dictionaryStatusHardcode = myStatusDictionary;
    
    /*============================================== ============================================== ============================================== */
    // settings hardcode dictionary
    
    NSDictionary *mySettingsDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                                          
                                          // Video Dictionary Portion
                                          @"68", @"videoSubMode",
                                          @"2", @"videoResolution",
                                          @"3", @"videoFrameRate",
                                          @"4", @"videoFOV",
                                          @"5", @"videoTLInterval",
                                          @"6", @"videoLoopingInterval",
                                          @"7", @"videoPhotoVideoInterval",
                                          @"8", @"videoLowLight",
                                          @"9", @"videoSpotMeter",
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
                                          @"19", @"photoShutter",
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
    
    self.dictionaryStatusHardcode = mySettingsDictionary;
}

/* 03.19.18 09.22.18 currently what we're pulling from to assign*/

-(void)createHardCodeAvailableSettings {
    self.availableModes = [[NSMutableArray alloc]initWithObjects:@"video", @"photo", @"multi", nil];
    //    NSLog(@"The Modes available for this device %@",self.availableModes);
    
    self.availableSubModes = [[NSMutableArray alloc]initWithObjects:@"vidVideo", @"vidTimeLapse", @"vidAndPhoto", @"vidLooping", nil];
    //    NSLog(@"The subModes available for this device %@",self.availableSubModes);
    
    
    self.availableFrameRates = [[NSMutableArray alloc]initWithObjects:@"240", @"120", @"100", @"90", @"80", @"60", @"50", @"48", @"30", @"24", nil];
    //    NSLog(@"The frameRates available for this device %@",self.availableFrameRates);
    
    self.availableTLIntervals = [[NSMutableArray alloc]initWithObjects:@".5", @"1", @"2", @"4", @"80", nil];
    //    NSLog(@"The frameRates available for this device %@",self.availableFrameRates);
    
    self.availableResolutions = [[NSMutableArray alloc]initWithObjects:@"4K", @"2.7K", @"1080", nil];
    //    NSLog(@"The frameRates available for this device %@",self.availableFrameRates);
}


// function to assign the JSON values to the settings, displayed in VCs
// this will need to be broken up for given usage of the mode. no need to display video specs, if photo is current.
-(void)assignCurrentStatusSettings{
    
    // assign to the array of values for given arrays
    self.statusSettings.batteryLevel = [self readableBatteryLevel:[[self.dictionaryStatusDefinition valueForKey:[self.dictionaryStatusHardcode valueForKey:@"batteryLevel"]]intValue]];
    self.statusSettings.battery = [self readableBattery:[[self.dictionaryStatusDefinition valueForKey:[self.dictionaryStatusHardcode valueForKey:@"battery"]]intValue]];
    self.statusSettings.battery = [self readableBattery:[self compareStatusHardcode:@"battery"]];
    self.statusSettings.mode = [self readableModeCurrent:[[self.dictionaryStatusDefinition valueForKey:[self.dictionaryStatusHardcode valueForKey:@"modeCurrent"]]intValue]];
    self.statusSettings.subMode = [self readableModeCurrent:[[self.dictionaryStatusDefinition valueForKey:[self.dictionaryStatusHardcode valueForKey:@"subModeCurrent"]]intValue]];
    self.statusSettings.sdCardPresent = [self readableSDCard:[[self.dictionaryStatusDefinition valueForKey:[self.dictionaryStatusHardcode valueForKey:@"sdCardPresent"]]intValue]];
    self.statusSettings.quality = [self.dictionaryStatusDefinition valueForKey:[self.dictionaryStatusHardcode valueForKey:@"remainingPhotos"]];
    self.statusSettings.quality = [self.dictionaryStatusDefinition valueForKey:[self.dictionaryStatusHardcode valueForKey:@"remainingVideoTime"]];
    self.statusSettings.streamingStatus = [self readableStreamingStatus:[[self.dictionaryStatusDefinition valueForKey:[self.dictionaryStatusHardcode valueForKey:@"streamingFeed"]]intValue]];
    //    NSLog(@"BL = %@, B = %@, MC = %@", self.StatusSettings.batteryLevel, self.StatusSettings.battery, self.StatusSettings.mode);
    
    //    self.StatusSettings.subMode = [self readableSubModeCurrent:[[self.dictionaryHardcode valueForKey:[self.dictionaryStatusDefinition valueForKey:@"subModeCurrent"]]intValue]];
    NSLog(@"settings object created, and now values assigned");
    
    if ([self.statusSettings.mode isEqualToString:@"Video"]) {
        NSLog(@"User is using %@", self.statusSettings.mode);
        // testing
        [self assignCurrentVideoSettings];
    }
    
}


-(void)assignCurrentVideoSettings{
    self.videoSettings.subMode = [self readableVideoSubMode:[[self.dictionarySettingsDefinition valueForKey:[self.dictionaryStatusHardcode valueForKey:@"videoSubMode"]]intValue]];
    NSLog(@"video sub mode 1 - %@", self.videoSettings.subMode);

    self.videoSettings.subMode = [self readableVideoSubMode:[self compareSettingsHardcode:@"videoSubMode"]];
    NSLog(@"video sub mode 2 - %@", self.videoSettings.subMode);

}

-(void)assignCurrentPhotoSettings{
    self.photoSettings.subMode = [self readableVideoSubMode:[[self.dictionarySettingsDefinition valueForKey:[self.dictionaryStatusHardcode valueForKey:@"photoSubMode"]]intValue]];
    self.photoSettings.subMode = [self readableVideoSubMode:[self compareSettingsHardcode:@"photoSubMode"]];
}

-(void)assignCurrentMultiShotSettings{
    self.photoSettings.subMode = [self readableVideoSubMode:[[self.dictionarySettingsDefinition valueForKey:[self.dictionaryStatusHardcode valueForKey:@"MSSubMode"]]intValue]];
    self.photoSettings.subMode = [self readableVideoSubMode:[self compareSettingsHardcode:@"MSSubMode"]];
}

- (int)compareStatusHardcode:(NSString *)key {
    return [[self.dictionaryStatusDefinition valueForKey:[self.dictionaryStatusHardcode valueForKey:key]]intValue];
}

- (int)compareSettingsHardcode:(NSString *)key {
    return [[self.dictionarySettingsDefinition valueForKey:[self.dictionarySettingsHardcode valueForKey:key]]intValue];
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
        [self assignCurrentStatusSettings];
    }];
}


/*
 // send signal to GoPro to receive the JSON - turn that into dictionary - return
 -(NSDictionary *)fetchGoProSettingsAndStatusJSON {
 // create string and fetch status/settings from JSON
 NSString *urlString = @"http://10.5.5.9/gp/gpControl/status";
 NSURL *url = [NSURL URLWithString:urlString];
 [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
 NSLog(@"finished fetching data");
 
 // create the dictionary from the DATA received
 NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
 //        NSLog(@"my dictionary: %@", jsonDictionary);
 
 self.testDictionary = jsonDictionary;
 
 NSError *err;
 if (err) {
 NSLog(@"failed to fetch");
 return;
 }
 }] resume];
 return self.testDictionary;
 }
 */

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

- (void)changeQuality:(NSString *)quality {
    // if statement
}

#pragma mark - PRINTING

-(void)printCurrentURL {
    NSLog(@"The DevCall %@",self.urlForCurrentCall);
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

- (NSString *) readableSubModeCurrentVideo:(int)value {
    switch (value) {
        case 0:
            return @"Video";
            break;
        case 1:
            return @"TLVideo";
            break;
        case 2:
            return @"Video+Photo";
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
            return @"TimeLapse";
            break;
        case 2:
            return @"NightLapse";
            break;
            
        default:
            return NULL;
            break;
    }
    
}

- (NSString *) readableStreamingStatus:(int)value {
    switch (value) {
        case 0:
            return @"NotStreaming";
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
            return @"TimeLapseVideo";
            break;
        case 2:
            return @"Video+Photo";
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

- (NSString *) readablePhotoShutter:(int)value {
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

- (NSString *) readablePhotoISOMax:(int)value {  // (v4.00FW) AKA "Limit"
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

- (NSString *) readableMSISOMax:(int)value {  // (v4.00FW) AKA "Limit"
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
@synthesize availableFrameRates;
@synthesize availableModes;
@synthesize availableResolutions;
@synthesize availableSubModes;
@synthesize availableTLExposure;
@synthesize availableTLIntervals;
@synthesize dictionaryStatusHardcode;
@synthesize dictionarySettingsHardcode;
@synthesize dictionarySettingsDefinition;
@synthesize dictionaryStatusDefinition;
@synthesize statusSettings;
@synthesize urlForCurrentCall;
@synthesize multiShotSettings;
@synthesize otherSettings;
@synthesize photoSettings;
@synthesize videoSettings;

@end
