//
//  MethodManager.h
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>
/* This is to store all of the APP'S required calls, properties and information needed everywhere in the app
 
 Also, and what that means, is that this calls EVERY SINGLE GoPro App. Info sent from options being decided, and filtered through here to make the URL calls to GoPro VIA the DAO*/

//@class MethodManager; // do I need this? 11.18.17

//#import "HeroProtocol.h"
    // DEVICES IMPORT
#import "Hero4.h"
#import "HeroStrings.h"

@interface MethodManager : NSObject


#define STRINGS 0 // HERO TEST STRINGS
#define H4B 1 // HERO FOUR BLACK
#define H4SI 2 // HERO FOUR SILVER
#define H4S 3 // HERO FOUR SESSION
#define H5 4 // HERO FIVE
#define H6 5 // HERO SIX

//bools
/*Not using yet*/
@property (nonatomic)BOOL successCall; // successful or not (NO = 0 = NOT) [delivery to GoPro]


/*this is going to be assigned when the app starts, by the current device being set, so that the calls and available options are set when methodManager offers information*/
// define currently used GoPro as a 4,5,6...
@property (strong, nonatomic) NSString *gpCurrent;
// from this, make a DAO singleton that is used for delivery of signals [VC >> MM >> DAO >> GoPro]




//any class of any type that implements the DAO delegate protocol
//@property (nonatomic, strong) id<HeroDAO> heroDAO;

@property (strong, nonatomic) NSString *buildNumber;
@property (strong, nonatomic) HeroProtocol *deviceCurrent;

// objects at the ready for assignment - all have "sharedDAO" function
@property (strong, nonatomic) HeroStrings *HeroStrings;
//@property (strong, nonatomic) Hero4 *Hero4;
//@property (strong, nonatomic) Hero3 *Hero3;

// create a settings property for current and desired, accesible anywhere in the app
//@property (strong, nonatomic) Settings *settingsCurrent;
//@property (strong, nonatomic) Settings *settingsDesired;

//calls

/*This is for the MethodManager to have a singleton - very important*/
+ (id)sharedManager;

- (void)assignDeviceManager: (NSObject *)device;
//- (void)SetMode: (NSString *)mode;
//- (void)SetSubMode: (NSString *)subMode;
//- (void)SetQuality: (NSString *)quality;



@end
