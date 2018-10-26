//
//  Hero4.h
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeroProtocol.h"

/*This is the Device Manager for the GoPro Hero 4 Black
 All of the:
 Calls
 Properties
 Information pertaining directly and specifically to this device*/

@interface Hero4 : NSObject <HeroDAO>

/* // I do not need to write out the functions in the h file, as long as the protocol has it
 
+ (instancetype)sharedDAO;
- (void)createAvailableSettings;

#pragma mark - POWER
- (void)powerOn;
- (void)powerOff;

#pragma mark - MODES
- (void)modeVideo;
- (void)modePhoto;
- (void)modeMulti;

#pragma mark - SUB MODES
//video
- (void)subVidVideo;
- (void)subVidTimeLapse;
- (void)subVidAndPhoto;
- (void)subVidLooping;
//photo
- (void)subPhoPhoto;
- (void)subPhoContin;
- (void)subPhoNight;
//multi
- (void)subMulBurst;
- (void)subMulTimeLapse;
- (void)subMulNightLapse;

// split up JSON after FETCH complete
- (void)splitJSON;

// obtain the JSON and return the dictionary, with use of CompletionHandler
-(void)fetchGoProSettingsAndStatusJSONWithCompletion:(void (^)(NSDictionary *myDictionary))completionHandler;




#pragma mark - AVAILABLE Properties
@property (nonatomic, retain) NSMutableArray *availableModes;
@property (nonatomic, retain) NSMutableArray *availableSubModes;
@property (nonatomic, retain) NSMutableArray *availableResolutions;
@property (nonatomic, retain) NSMutableArray *availableFrameRates;
@property (nonatomic, retain) NSMutableArray *availableTLIntervals;
@property (nonatomic, retain) NSMutableArray *availableTLExposure;

// hardcoded dictionary to define "keys" for the status/settings
@property (nonatomic, retain) NSDictionary *dictionaryStatusDefinition;
@property (nonatomic, retain) NSDictionary *dictionarySettingsDefinition;

// make the comparable dictionary to assign readable value to the JSON
- (void)createHardCodeDictionary;


#pragma mark - CURRENT INFO
@property (nonatomic, retain) NSString *deviceName;

@property (nonatomic, retain) NSString *urlForCurrentCall;


*/

@end
