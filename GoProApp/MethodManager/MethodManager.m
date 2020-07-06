//
//  MethodManager.m
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "MethodManager.h"
//AppDelegate *appDelegate;


@implementation MethodManager

#pragma mark - BOOLS
// these BOOLS are meant to track certain binaries in the app, to ensure it reflects the given information. explanations below the BOOLs will help to understand each intention

/*09.17.18 added, but have not used any of these in code yet*/

BOOL shooting; // shooting or  (NO = 0 = Silent)
BOOL connected; // connected or  (NO = 0 = no connection found)
BOOL power; // deviceOn or  (NO = 0 = deviceOff)
BOOL streaming; // currently viewing lens or  (NO = 0 = not utilizing view)

/*
 shooting 11.18.17
 created in MM
 [not initialized, but assumed NO]
 meant to be in: VC VWA if, set NO : not there yet
 
 connected 09.17.18
 created in MM
 [not initialized, but assumed NO]
 a light to signify to the user that the gopro is actually still connected to the app
 this may want to have a "check" every given amount of time
 also when this changes, save all information from current use. last used setting. date stamp [for last used]?
 
 power 09.17.18
 created in MM
 [not initialized, but assumed NO]
 connected, but powered down
 
 streaming 09.17.18
 created in MM
 [not initialized, but assumed NO]
 meant to be in: VC VWA if, set NO : not there yet
 
 */





#pragma mark - TEST CODE
//(Move to startUpApp method)

- (void)assignDeviceManager: (NSString *)device/*(*UIViewController or whatever to pass in right one)*/ {
    // allocate the public property
    self.deviceCurrent = [[HeroProtocol alloc]init];
    //    Hero3 *hero3 = [[Hero3 alloc]init];
    
    // set object to correct hero, using "if then" and then from there, use the DAO to your will
    /*
     create an instance of H4
     create an instance of H3, etc.
     */
    
    if ([device isEqual:@"HeroStrings"])
        [self creationOfHeroStrings];
    else if ([device isEqual:@"Hero4"])
        [self creationOfHero4];
    else
        NSLog(@"No GoPro was selected");
    
    
//    [self.deviceCurrent.heroDAO createHardCodeAvailableSettings]; // sets the values of all available options for given Hero model
    NSLog(@"Device's modes available %@", self.deviceCurrent.heroDAO.availableModes);
    [self.deviceCurrent.heroDAO powerOn];
    
    // allocated the settingsCurrent, so that it exists
//    self.settingsCurrent = [[Settings alloc]init];
//    self.settingsCurrent.subMode = @"vidTL";
//    self.settingsCurrent.quality = @"4K";
    
    // Gather all current settings from GoPro [via DAO?] and assign the values
    /*
     [self.deviceCurrent.heroDAO assignCurrentSettings:@"modeCurrent"];
     self.settingsCurrent.mode = @"photo";
     // this is the line that will need to be duplicated many times over - INCORRECT - CALL JSON ONCE
     self.settingsCurrent.mode = [self.deviceCurrent.heroDAO assignCurrentSettings:@"modeCurrent"];
     self.settingsCurrent.batteryLevel = [self.deviceCurrent.heroDAO assignCurrentSettings:@"batteryLevel"];
     self.settingsCurrent.battery = [self.deviceCurrent.heroDAO assignCurrentSettings:@"battery"];
     */
    
    //10.26.18 I think this will replace all of the above
    // below is the updated version after status added, and changed from broken up settings(ie vid, pho, MS)
    //    self.settingsCurrent = self.deviceCurrent.heroDAO.statusSettings;
//        self.settingsCurrent = self.deviceCurrent.heroDAO.videoSettings;

    // allocated the settingsDesired, so that it exists
//    self.settingsDesired = [[Settings alloc]init];
    
}


- (void) justSomeOfTheCallsThatCanBeMade {
    //    deviceCurrent.heroDAO = hero3;
    //     self.deviceCurrent.heroDAO = hero4;
    [self.deviceCurrent.heroDAO powerOn];
    [self.deviceCurrent.heroDAO powerOff];
    
    [self.deviceCurrent.heroDAO shutterOn];
    [self.deviceCurrent.heroDAO shutterOff];
    
    //     self.deviceCurrent.heroDAO = heroStrings;
    [self.deviceCurrent.heroDAO powerOn];
    [self.deviceCurrent.heroDAO powerOff];
    
    [self.deviceCurrent.heroDAO shutterOn];
    [self.deviceCurrent.heroDAO shutterOff];
    
    
    // setting the current device to strings HARD CODE
    //     self.deviceCurrent.heroDAO = heroStrings;
    NSLog(@"the hero is currently strings");
    
    
    //    NSLog(@"this device is %@", self.deviceCurrent); // this is to check when using it throughout app, to ensure it is still same object
    
    /*
     NSLog(@"this device's available modes = \n %@", self.deviceCurrent.heroDAO.availableModes);
     NSLog(@"this device's available subModes = \n %@", self.deviceCurrent.heroDAO.availableSubModes);
     NSLog(@"this device's available frameRates = \n %@", self.deviceCurrent.heroDAO.availableFrameRates);
     
     */
}

//10.26.18 most likely remove
#pragma mark - Submitting Values to DAO


- (void)SetMode:(NSString *)mode {
    // here is the check and send to DAO
   /* if ([mode isEqualToString:self.settingsCurrent.mode]) {
        NSLog(@"SAME MODE, PASS");
        
    }
    else {
        NSLog(@"user chose %@, assign through DAO", mode);
        NSLog(@"mode: %@", self.settingsCurrent.mode);
        //        [self.deviceCurrent.heroDAO modeVideo];
        [self.deviceCurrent.heroDAO changeMode:mode];
        
        
    }*/
}
/*
- (void)SetSubMode:(NSString *)subMode {
    // here is the check and send to DAO
    if ([subMode isEqualToString:self.settingsCurrent.subMode]) {
        NSLog(@"SAME SUBMODE, PASS");
        
    }
    else {
        NSLog(@"user chose %@, assign through DAO", subMode);
        NSLog(@"subm: %@", self.settingsCurrent.subMode);
        
    }
    
}

- (void)SetQuality:(NSString *)quality {
    // here is the check and send to DAO
    if ([quality isEqualToString:self.settingsCurrent.quality]) {
        NSLog(@"SAME QUALITY, PASS");
        
    }
    else {
        NSLog(@"user chose %@, assign through DAO", quality);
        NSLog(@"qual: %@", self.settingsCurrent.quality);
    }
    
}
*/

#pragma mark - START UP

- (void)startUpApp {
    /*
     open app
     [check wifi]
     choose gopro
     [check gopro and assign object]
     opens view of gopro
     */
    
    
    //    NSObject *passThrough = [[NSObject alloc]init];
    //    self.dao = [Hero4 sharedDAO];
    //    [self.dao shared];
    
    
    //    if (/*device is Hero 4*/true) {
    /*set DAO to Hero 4*/
    //        self.dao = [Hero4 sharedDAO];
    
    //    }
    //    else /*device is NOT Hero 4*/{
    /*set DAO to Hero 3 plus*/
    //    }
    
}


#pragma mark - CURRENT SETTINGS ASSIGNMENT
// the aim is to have a READABLE output here. the string goes in, the meaning comes out
// @"modeCurrent" >> json >> 43 >> 1 >> @"photo"



#pragma mark - CALLS

#pragma mark - URL HANDLING

- (void)sendDeviceCall {
    /*ensure DAO is setup
     assign currentCall with DAO.'givenCallURL'
     make the call
     check the call
     assign BOOL to success/fail
     */
    NSString *urlForCurrentCall;
    NSURL *url = [[NSURL alloc]initWithString:urlForCurrentCall];
    //type your URL you can use initWithFormat for placeholders
    NSURLSession *session = [NSURLSession sharedSession];  //use NSURLSession class
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    //You then can use NSURLSessionDownloadTask or NSURLSessionUploadTask
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        //note that your requested data are stored on the disk automatic
        //if you need to retrieve your data use the location parameter not the response parameter
        //as it stores the location of ur retrieved data that was saved on the disk
        //works asynchronously i think
    }];
    [task resume]; // to start the download task
}

// assign which GoPro is being used and allocate a DAO
#pragma mark - CREATE HERO
- (void) creationOfHeroStrings {
    self.HeroStrings = [HeroStrings sharedDAO];
    //    self.HeroStrings = [[HeroStrings alloc]init];
    self.deviceCurrent.heroDAO = self.HeroStrings;
}

- (void) creationOfHero4 {
//    self.Hero4 = [Hero4 sharedDAO];
    //    self.Hero4 = [[Hero4 alloc]init];
//    self.deviceCurrent.heroDAO = self.Hero4;
}

/*This is for the MethodManager to have a singleton - very important*/
#pragma mark - Singleton Methods
+ (id)sharedManager {
    static MethodManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}


@end
