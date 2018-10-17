//
//  HeroStrings.m
//  GoProApp
//
//  Created by JD Leonard on 11/17/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "HeroStrings.h"

@implementation HeroStrings

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

-(void)objectDidLoad {
    
    // create the hardcoded dictionary to define "keys" for the status/settings
    self.dictionarySettingsDefinition = [[NSDictionary alloc]init];
    [self createHardCodeDictionary];
    self.dictionaryStatusDefinition = [[NSDictionary alloc]init];
    self.dictionaryStatusDefinition = @{@"CurrentMode": @"43", @"CurrentSubMode":@"44", @"BatteryLevel": @"2", @"BatteryAvailable": @"1"};
    
    // ensure value passed aound through readable functions is allocated
    self.testValue = [[NSString alloc]init];
}

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
    NSLog(@"%@", myDictionary);
    
    self.dictionaryStatusDefinition = myDictionary;
}

// CHANGE, SINCE WE WON'T BE RETURNING ANYHING OR TAKING PARAMETER
-(NSString *)assignCurrentSettings: (NSString *)setting {
    
    [self createHardCodeDictionary];
    NSDictionary *myJSONDict = [self fetchGoProSettingsAndStatus];
    // send signal to GoPro to recover current settings
    NSLog(@"signal sent, and received JSON. now returning that information back to MM");
    /*http://10.5.5.9/gp/gpControl/status*/
    // assign to the array of values for given arrays
    self.testSettings.batteryLevel = [self readableBatteryLevel:[[myJSONDict valueForKey:[self.dictionaryStatusDefinition valueForKey:@"batteryLevel"]]intValue]];
    self.testSettings.battery =
    self.testSettings.mode = [self readableModeCurrent:[[myJSONDict valueForKey:[self.dictionaryStatusDefinition valueForKey:@"modeCurrent"]]intValue]];
    self.testSettings.subMode = [self readableSubModeCurrent:[[myJSONDict valueForKey:[self.dictionaryStatusDefinition valueForKey:@"subModeCurrent"]]intValue]];
    
    self.testValue = [[NSString alloc]init];
    int valueInDict = [[myJSONDict valueForKey:[self.dictionaryStatusDefinition valueForKey:setting]]intValue];
    NSLog(@"valueinDict = %d", valueInDict);
    // this is the part that moves to its own functions
    if (valueInDict == 0) {
        self.testValue = @"video";
    }
    else if (valueInDict == 1) {
        self.testValue = @"photo";
    }
    else if (valueInDict == 2) {
        self.testValue = @"multiPhoto";
    }
    NSLog(@"%@", self.testValue);
    
    NSLog(@"the value of %@ has been input, the value in dict: %d, the meaning is %@",setting,valueInDict,self.testValue);
    
    return self.testValue;
}

-(NSDictionary *)fetchGoProSettingsAndStatus {
    // create string and fetch status/settings from JSON
    NSString *urlString = @"http://10.5.5.9/gp/gpControl/status";
    NSURL *url = [NSURL URLWithString:urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"finished fetching data");
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        //        NSLog(@"my dictionary: %@", jsonDictionary);
        
        NSDictionary *jsonStatusDict = [jsonDictionary objectForKey:@"status"];
        NSLog(@"my status dict: %@", jsonStatusDict);
        NSLog(@"value of 40 is %@", [jsonStatusDict objectForKey:@"40"]);
        self.testDictionary = jsonStatusDict;
        
        // create array with values of status/settings
        NSArray *jsonStatus=[jsonDictionary objectForKey:@"status"];
        NSArray *jsonSettings=[jsonDictionary objectForKey:@"settings"];
        NSLog(@"results = %@", jsonStatus);
        //        NSLog(@"results = %@", jsonSettings);
        
        // use key values to assign status/settings
        NSLog(@"Current mode (43) = %@", [jsonStatus valueForKey:@"43"]);
        NSLog(@"Current default mode (53) = %@", [jsonSettings valueForKey:@"53"]);
        //        [self iterateTheArray:jsonSettings];
        //        [self iterateTheArray:jsonStatus];
        //
        //        [self assignValues:jsonStatus];
        
        // this is not ready yet 10/16/18
        //        Hero4_DEMO *hero4 = [[Hero4_DEMO alloc]init];
        //        [hero4 presentInformationFor:jsonSettings forKey:@"53"];
        
        NSError *err;
        if (err) {
            NSLog(@"failed to fetch");
            return;
        }
    }] resume];
    return self.testDictionary;
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
