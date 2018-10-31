//
//  Status.h
//  GoProApp
//
//  Created by JDSL on 10/27/18.
//  Copyright © 2018 JD Leonard. All rights reserved.
//

/* the Status Object is similar to the settings, but separate for given properties to define all of the types of options that a GoPro can have
 it will travel throughout the app [thanks to the Method Manager] to define the status:*/


#import <Foundation/Foundation.h>

@interface Status : NSObject

#pragma mark - STATUS
// the few portions of STATUS dictionary

// is there a battery or not
@property (nonatomic, retain) NSString *battery;

// what is the battery's level
@property (nonatomic, retain) NSString *batteryLevel;
// is the device streaming?
@property (nonatomic, retain) NSString *streamingStatus;

// is there an SD card or not
@property (nonatomic, retain) NSString *sdCardPresent;


// mode = video, photo, multi-shot
@property (nonatomic, retain) NSString *mode;

/* ALSO IN SETTINGS - unsure if necessary*/
// subMode = vidVideo, vidTL, vidAndPhoto, vidLooping ...
@property (nonatomic, retain) NSString *subMode;

@end
