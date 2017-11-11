//
//  Hero4.h
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MethodManager.h"
/*This is the Device Manager for the GoPro Hero 4 Black
 All of the
 Calls
 Properties
 Information pertaining directly and specifically to this device*/

@interface Hero4 : NSObject <HeroDAO>

- (void)powerOn;
- (void)powerOff;


// available
@property (nonatomic, retain) NSMutableArray *availableModes;
@property (nonatomic, retain) NSMutableArray *availableSubModes;
@property (nonatomic, retain) NSMutableArray *availableResolutions;
@property (nonatomic, retain) NSMutableArray *availableFrameRates;

@property (nonatomic, retain) NSString *deviceName;

@property (nonatomic, retain) NSString *urlForCurrentCall;


+ (instancetype)sharedDAO;


@end
