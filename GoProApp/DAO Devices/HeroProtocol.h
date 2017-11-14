//
//  HeroProtocol.h
//  GoProApp
//
//  Created by JD Leonard on 11/13/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>
/* This is to store all of the apps required calls, properties and information needed everywhere in the app*/

@protocol HeroDAO <NSObject>

@required
- (void)powerOn;
- (void)powerOff;

@optional
- (void)modeVideo;
- (void)modePhoto;

@end


@interface HeroProtocol : NSObject

@end
