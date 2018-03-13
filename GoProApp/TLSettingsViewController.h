//
//  TLSettingsViewController.h
//  GoProApp
//
//  Created by JD Leonard on 3/5/18.
//  Copyright © 2018 JD Leonard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLSettingsViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *X_Minutes;
@property (weak, nonatomic) IBOutlet UIPickerView *Y_FPS;
@property (weak, nonatomic) IBOutlet UIPickerView *Z_Seconds;

@property (nonatomic, retain) NSMutableArray *availableMinutes;
@property (nonatomic, retain) NSMutableArray *availableFPS;
@property (nonatomic, retain) NSMutableArray *availableSeconds;

@end
