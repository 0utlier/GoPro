//
//  MethodManager.h
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeroProtocol.h"
/* This is to store all of the APPS required calls, properties and information needed everywhere in the app
 
 Also, and what that means, is that this calls EVERY SINGLE GoPro App. Info sent from options being decided, and filtered through here to make the URL calls to GoPro*/

//@class MethodManager; // do I need this? 11.18.17

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
@property (nonatomic)BOOL successCall; // successful or not (NO = 0 = NOT)

//devices

//calls

/*this is going to be assigned when the app starts, by the current device being set, so that the calls and available options are set when methodManager offers information*/

//any class of any type that implements the DAO delegate protocol
//@property (nonatomic, strong) id<HeroDAO> heroDAO;

@property (strong, nonatomic) NSString *buildNumber;
@property (strong, nonatomic) HeroProtocol *deviceCurrent;

+ (id)sharedManager;

- (void)assignDeviceManager: (NSObject *)device;



@end
