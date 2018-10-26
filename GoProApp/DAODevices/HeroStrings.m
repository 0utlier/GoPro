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
    self.dictionaryStatusDefinition = @{@"CurrentMode": @"43", @"CurrentSubMode":@"44", @"BatteryLevel": @"2", @"BatteryAvailable": @"1"};
    
    // ensure value passed around through readable functions is allocated
    self.testValue = [[NSString alloc]init];
}

# pragma mark - DICTIONARIES

- (void)createHardCodeDictionary {
    NSDictionary *myDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                                  @"1", @"battery",
                                  @"2", @"batteryLevel",
                                  @"43", @"modeCurrent",
                                  @"44", @"subModeCurrent",
                                  @"13", @"currentVideoDuration",
                                  @"39", @"capturedmultiShot",
                                  @"31", @"clientsConnected",
                                  @"32", @"streamingFeed",
                                  @"33", @"sdCardPresent",
                                  @"34", @"remainingPhotos",
                                  @"35", @"remainingVideoTime",
                                  @"36", @"capturedBatchPhotos",
                                  @"37", @"capturedVideos",
                                  @"38", @"capturedPhotosAll",
                                  @"39", @"capturedVideosAll",
                                  @"8", @"recordingProcessing",
                                  @"54", @"remainingBytes",
                                  nil];
    NSLog(@"Hardcoded Dict: %@", myDictionary);
    
    self.dictionaryHardcode = myDictionary;
}

/* 03.19.18 09.22.18 currently what we're pulling from to assign*/

-(void)createAvailableSettings {
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
-(void)assignCurrentSettings{
    // assign to the array of values for given arrays
    self.testSettings.batteryLevel = [self readableBatteryLevel:[[self.dictionaryHardcode valueForKey:[self.dictionaryStatusDefinition valueForKey:@"batteryLevel"]]intValue]];
    self.testSettings.battery = [self readableModeCurrent:[[self.dictionaryHardcode valueForKey:[self.dictionaryStatusDefinition valueForKey:@"battery"]]intValue]];
    self.testSettings.mode = [self readableModeCurrent:[[self.dictionaryHardcode valueForKey:[self.dictionaryStatusDefinition valueForKey:@"modeCurrent"]]intValue]];
    self.testSettings.subMode = [self readableSubModeCurrent:[[self.dictionaryHardcode valueForKey:[self.dictionaryStatusDefinition valueForKey:@"subModeCurrent"]]intValue]];
    
    
}
-(void)splitJSON{
    
    // send signal to GoPro to recover current settings, and wait for completion
    [self fetchGoProSettingsAndStatusJSONWithCompletion:^(NSDictionary *myJSONDictionary) {
        /*
         NSDictionary *myJSONDictTest = [[NSDictionary alloc]init];
         myJSONDictTest = myDictionary;
         
         */        // split dictionary into status and settings
        self.dictionaryStatusDefinition = [myJSONDictionary objectForKey:@"status"];
        self.dictionarySettingsDefinition = [myJSONDictionary objectForKey:@"settings"];
        
        NSLog(@"signal sent, and received JSON. Now splitting, and assigning to DAO's Setting Object");
        /*http://10.5.5.9/gp/gpControl/status*/
        NSLog(@"settingsDict = %@", self.dictionarySettingsDefinition);
        NSLog(@"statusDict = %@", self.dictionaryStatusDefinition);
        
        // use dictionaries and assign values
        [self assignCurrentSettings];
    }];
    
    
    
    
}

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

#pragma mark - READABLE FUNCTIONS
// return readable values

- (NSString *) readableBatteryLevel:(int)value {
    if (value == 0) {
        self.testValue = @"Empty";
    }
    else if (value == 1) {
        self.testValue = @"Low";
    }
    else if (value == 2) {
        self.testValue = @"Halfway";
    }
    else if (value == 3) {
        self.testValue = @"Full";
    }
    else if (value == 4) {
        self.testValue = @"Charging";
    }
    return self.testValue;
}

- (NSString *)readableModeCurrent:(int)value {
    if (value == 0) {
        self.testValue = @"video";
    }
    else if (value == 1) {
        self.testValue = @"photo";
    }
    else if (value == 2) {
        self.testValue = @"multiPhoto";
    }
    return self.testValue;
}

- (NSString *)readableSubModeCurrent:(int)value { // totally dependent on which current mode is set!
    if ([self.testSettings.mode isEqualToString:@"video"]) {
        
        if (value == 0) {
            self.testValue = @"Video";
        }
        else if (value == 1) {
            self.testValue = @"TLVideo";
        }
        else if (value == 2) {
            self.testValue = @"Video+Photo";
        }
        return self.testValue;
    }
    
    else if ([self.testSettings.mode isEqualToString:@"photo"]) {
        
        if (value == 0) {
            self.testValue = @"SinglePic";
        }
        else if (value == 1) {
            self.testValue = @"Continuous";
        }
        else if (value == 2) {
            self.testValue = @"NightPhoto";
        }
        return self.testValue;
    }
    
    else if ([self.testSettings.mode isEqualToString:@"multiPhoto"]) {
        
        if (value == 0) {
            self.testValue = @"Burst";
        }
        else if (value == 1) {
            self.testValue = @"TL";
        }
        else if (value == 2) {
            self.testValue = @"NightLapse";
        }
        return self.testValue;
    }
    
    else return @"";
}



#pragma mark - POWER & SHUTTER
//power
-(void)powerOn {
    self.urlForCurrentCall =@"Hero Power On";
    [self printCurrentURL];
}
-(void)powerOff {
    self.urlForCurrentCall = @"Hero Power Off";
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




#pragma mark - Singleton Methods


+ (id)sharedManager {
    static HeroStrings *sharedMyHeroStrings = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyHeroStrings = [[self alloc] init];
    });
    return sharedMyHeroStrings;
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

+ (instancetype)sharedDAO
{
    static HeroStrings *sharedDAO = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDAO = [[HeroStrings alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedDAO;
}


@end
