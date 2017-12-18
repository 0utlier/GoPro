//
//  OptionsCollectionViewController.h
//  GoProApp
//
//  Created by JD Leonard on 12/14/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MethodManager.h"

@interface OptionsCollectionViewController : UICollectionViewController


@property (nonatomic, retain) NSString *optionsType; //which type of options (ie resolution, fps, etc.)
@property (nonatomic, retain) NSMutableArray *optionsAvailableForDevice; // assign to correct model's array of current settings

// available - to be set by MM, through the DAO
@property (nonatomic, retain) NSMutableArray *availableModes;
@property (nonatomic, retain) NSMutableArray *availableSubModes;
@property (nonatomic, retain) NSMutableArray *availableResolutions;
@property (nonatomic, retain) NSMutableArray *availableFrameRates;

// desired - to be set in OPTIONS and sent to Method Manager
@property (nonatomic, retain) NSString *desiredMode;
@property (nonatomic, retain) NSString *desiredSubMode;
@property (nonatomic, retain) NSString *desiredResolution;
@property (nonatomic, retain) NSString *desiredFrameRate;

// hard coded test data
@property (nonatomic, retain) NSMutableArray *availableModesForHero4;

// screen size for assigning buttons
@property (nonatomic) CGSize screenSize;

// Buttons
@property (nonatomic, retain) UIButton *leftB;
@property (nonatomic, retain) UIButton *rightB;
@property (nonatomic, retain) UIButton *leftT;
@property (nonatomic, retain) UIButton *rightT;
@property (nonatomic, retain) UIButton *top;
@property (nonatomic, retain) UIButton *bottom;




@end
