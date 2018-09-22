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


#pragma mark - TEST CODE
//(Move to startUpApp method)

- (void)assignDeviceManager: (NSObject *)device/*(*UIViewController or whatever to pass in right one)*/ {
    /*
     create an instance of H4
     create an instance of H3, etc.
     */
    
    //    HeroProtocol *deviceCurrent = [[HeroProtocol alloc]init];
    self.deviceCurrent = [[HeroProtocol alloc]init]; // allocate the public property
    //    Hero3 *hero3 = [[Hero3 alloc]init];
    Hero4 *hero4 = [[Hero4 alloc]init];
    HeroStrings *heroStrings = [[HeroStrings alloc]init];
    ;
    
    //    deviceCurrent.heroDAO = hero3;
    self.deviceCurrent.heroDAO = hero4;
    [self.deviceCurrent.heroDAO powerOn];
    [self.deviceCurrent.heroDAO powerOff];
    
    [self.deviceCurrent.heroDAO shutterOn];
    [self.deviceCurrent.heroDAO shutterOff];
    
    self.deviceCurrent.heroDAO = heroStrings;
    [self.deviceCurrent.heroDAO powerOn];
    [self.deviceCurrent.heroDAO powerOff];
    
    [self.deviceCurrent.heroDAO shutterOn];
    [self.deviceCurrent.heroDAO shutterOff];
    
    NSLog(@"this device is %@", self.deviceCurrent);
    [self.deviceCurrent.heroDAO createAvailableSettings];
    
    /*
     NSLog(@"this device's available modes = \n %@", self.deviceCurrent.heroDAO.availableModes);
     NSLog(@"this device's available subModes = \n %@", self.deviceCurrent.heroDAO.availableSubModes);
     NSLog(@"this device's available frameRates = \n %@", self.deviceCurrent.heroDAO.availableFrameRates);
     
     */
    
}

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
    
    
    if (/*device is Hero 4*/true) {
        /*set DAO to Hero 4*/
        //        self.dao = [Hero4 sharedDAO];
        
    }
    else /*device is NOT Hero 4*/{
        /*set DAO to Hero 3 plus*/
    }
    
}


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



@end
