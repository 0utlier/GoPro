//
//  HeroStrings.h
//  GoProApp
//
//  Created by JD Leonard on 11/17/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeroProtocol.h"

/*This is the Device Manager for the GoPro Hero TESTING [07.11.20 currently seems like Hero 4 calls. Unsure]
 All of the:
 Calls
 Properties
 Information pertaining directly and specifically to this device*/

#pragma MARK - IMPORTANT

@interface HeroStrings : NSObject <HeroDAO>
@property NSDate *methodStart; // test remove please
@property int currentCount;

@end
