//
//  TLSettingsViewController.h
//  GoProApp
//
//  Created by JD Leonard on 3/5/18.
//  Copyright © 2018 JD Leonard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MethodManager.h"

@interface TLSettingsViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *X_Minutes;
@property (weak, nonatomic) IBOutlet UIPickerView *Y_FPS;
@property (weak, nonatomic) IBOutlet UIPickerView *Z_Seconds;

// available - to be set by MM, through the DAO
@property (nonatomic, retain) NSMutableArray *availableMinutes;
@property (nonatomic, retain) NSMutableArray *availableFPS;
@property (nonatomic, retain) NSMutableArray *availableSeconds;

// desired - to be set in TLSettings and sent to Method Manager
@property (nonatomic, retain) NSString *desiredMode;
@property (nonatomic, retain) NSString *desiredSubMode;
@property (nonatomic, retain) NSString *desiredResolution;
@property (nonatomic, retain) NSString *desiredFrameRate;

// hard coded test data
@property (nonatomic, retain) NSMutableArray *availableModesForHero4;


@end
