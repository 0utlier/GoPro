//
//  SettingsViewController.h
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

/* // examples for index creation, for current model, instead of nsstring
#define OPTIONSPAGE 0
#define MAPPAGE 1
#define LISTPAGE 2
#define PPINFOPAGE 3
#define ADDPAGE 4

*/

// Properties for current settings
/*TODO I believe that most of these will be index (see above)*/
@property (nonatomic, retain) NSString *heroCurrent; // which device is being used
@property (nonatomic, retain) NSString *modeCurrent; // which mode is it currently in
@property (nonatomic, retain) NSString *subModeCurrent; // which subMode is it currently in
@property (nonatomic, retain) NSString *resolutionCurrent; // which resolution is assigned?
//@property (nonatomic, retain) NSString *frameRateCurrent; // which FPS is assigned? // not sure when used yet



@end
