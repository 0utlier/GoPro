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
@property (weak, nonatomic) IBOutlet UIPickerView *Quality;
@property (weak, nonatomic) IBOutlet UIPickerView *IntervalExposure;
@property (weak, nonatomic) IBOutlet UIPickerView *Size;

// available - to be set by MM, through the DAO
@property (nonatomic, retain) NSMutableArray *availableMinutes;
@property (nonatomic, retain) NSMutableArray *availableFPS;
@property (nonatomic, retain) NSMutableArray *availableSeconds;
@property (nonatomic, retain) NSMutableArray *availableQuality;
@property (nonatomic, retain) NSMutableArray *availableInterval;
@property (nonatomic, retain) NSMutableArray *availableExposure;
@property (nonatomic, retain) NSMutableArray *availableSize;

// Initial values - when page loads, set and use for UIPickerView index
@property (weak, nonatomic) NSString *X_MinutesValue;
@property (weak, nonatomic) NSString *Y_FPSValue;
@property (weak, nonatomic) NSString *Z_SecondsValue;
@property (weak, nonatomic) NSString *QualityValue;
@property (weak, nonatomic) NSString *IntervalExposureValue;
@property (weak, nonatomic) NSString *SizeValue;

// desired - to be set in TLSettings and sent to Method Manager
@property (nonatomic, retain) NSString *desiredMode;
@property (nonatomic, retain) NSString *desiredSubMode;
@property (nonatomic, retain) NSString *desiredResolution;
@property (nonatomic, retain) NSString *desiredFrameRate;

// hard coded test data
@property (nonatomic, retain) NSMutableArray *availableModesForHero4;


@end
