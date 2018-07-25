//
//  TLSettingsViewController.m
//  GoProApp
//
//  Created by JD Leonard on 3/5/18.
//  Copyright © 2018 JD Leonard. All rights reserved.
//

#import "TLSettingsViewController.h"

// this is the page to use as the options available for the current device's TIME LAPSE settings (ie rsolution, FPS...)
/*NOTHING GETS STORED HERE. ONLY ASSIGNED*/
@interface TLSettingsViewController ()


/* please check out these websites

 iOS/Swift — Creating Multiple Dynamic Picker Views: a Quick Tutorial
 https://medium.com/@smehta/ios-swift-creating-a-dynamic-picker-view-843b3290e7f0

 
 iOS9 UIPickerView Example and Tutorial in Swift and Objective-C
 https://codewithchris.com/uipickerview-example/
 
 */


@property (strong, nonatomic) MethodManager *methodManager;

/*
 03.19.18
 NEXT things to do
 Set item when other item changed (ie time in seconds affects shooting minutes, effected by interval)
 Once this happens, add SUBMIT button
 Try to make the button send the signal to MM to send signal
 
 make 2 buttons: submit and set view
 if submit hit, start clock timer after sending signal
 
 07.02.18
 set up live stream
 */


@end

@implementation TLSettingsViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    /*create a methodManager - use sharedDAO*/
    self.methodManager = [MethodManager sharedManager];
    [self.methodManager assignDeviceManager:NULL];
    /*check if it exists, and did not return empty/null*/
    NSLog(@"device is object %@", self.methodManager.deviceCurrent);
    
    /*This is where the assignment comes in*/
    [self assignAvailable];
//    NSLog(@"TLSettings Page Loading for %@", self.availableFPS);
    
    /* in case we need hard code 03.19.18
     [self makeHardCodeTestData]; */
    
    [self delegateForUIPickers];
    [self labelForUIPickerViews];
}
    

-(void) assignAvailable {
    self.availableFPS = self.methodManager.deviceCurrent.heroDAO.availableFrameRates;
    self.availableQuality = self.methodManager.deviceCurrent.heroDAO.availableResolutions;
    self.availableInterval = self.methodManager.deviceCurrent.heroDAO.availableTLIntervals;
    
// hard code these two, as it is up to user and NOT determined by the GoPro
    self.availableMinutes = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", nil]; // available to shoot
    self.availableSeconds = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", nil]; // post after creation

    self.availableSize = [[NSMutableArray alloc]initWithObjects:@"standard", @"wide", nil]; // need to set in protocl and DAO
}

- (void) makeHardCodeTestData{ // NOT CURRENTLY BEING USED
    // Initialize Data
    self.availableMinutes = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", nil];
    self.availableFPS = [[NSMutableArray alloc]initWithObjects:@"24", @"30", @"60", nil];
    self.availableSeconds = [[NSMutableArray alloc]initWithObjects:@".5", @"1", @"2", @"3", @"4", @"5", @"6", nil];

}

- (void) createSettingsButton {
    UIButton *openToSettings = [UIButton buttonWithType:UIButtonTypeCustom];
    [openToSettings addTarget:self
                       action:@selector(settingsButtonPressed:)
             forControlEvents:UIControlEventTouchUpInside];
    [openToSettings setTitle:@"Show View" forState:UIControlStateNormal];
    openToSettings.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    openToSettings.backgroundColor = [UIColor blueColor];
    [self.view addSubview:openToSettings];
}

-(void)settingsButtonPressed:(UIButton *)openToSettings {
    NSLog(@"works, opening settings page");
    UIViewController *settingsController = (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"OptionAssignViewController"];
    [self presentViewController:settingsController animated:YES completion:nil];
    
}

#pragma mark - UIPickerDelegate

- (void) delegateForUIPickers{
    // Connect data for UIPickers
    
    self.X_Minutes.dataSource = self;
    self.X_Minutes.delegate = self;
    
    self.Y_FPS.dataSource = self;
    self.Y_FPS.delegate = self;
    
    self.Z_Seconds.dataSource = self;
    self.Z_Seconds.delegate = self;
    
    self.Quality.dataSource = self;
    self.Quality.delegate = self;
    
    self.IntervalExposure.dataSource = self;
    self.IntervalExposure.delegate = self;
    
    self.Size.dataSource = self;
    self.Size.delegate = self;
    
}

-(void)labelForUIPickerViews
{
    NSString *strSec = @"Seconds";
    float lblWidth = self.Z_Seconds.frame.size.width / 2;//self.Z_Seconds.numberOfComponents;
    float lblXposition = self.Z_Seconds.frame.origin.x;
    float lblYposition = (self.Z_Seconds.frame.origin.y);
    
    UILabel *lblSec = [[UILabel alloc] initWithFrame:CGRectMake(lblXposition,
                                                                lblYposition,
                                                                lblWidth,
                                                                100)];
    [lblSec setText:strSec];
    [lblSec setTextAlignment:NSTextAlignmentCenter];
    
    [self.view addSubview:lblSec];

    NSString *strFPS = @"FPS";
    float lblWidthFPS = self.Y_FPS.frame.size.width/2;// / self.Y_FPS.numberOfComponents;
    float lblXpositionFPS = self.Y_FPS.frame.origin.x;
    float lblYpositionFPS = (self.Y_FPS.frame.origin.y);
    
    UILabel *lblFPS = [[UILabel alloc] initWithFrame:CGRectMake(lblXpositionFPS,
                                                                lblYpositionFPS,
                                                                lblWidthFPS,
                                                                100)];
    [lblFPS setText:strFPS];
    [lblFPS setTextAlignment:NSTextAlignmentCenter];
    
    [self.view addSubview:lblFPS];

    
    /* // tried adding a label to test against
     
NSString *strMinutes = @"Minutes";
    float lblWidthMin = self.X_Minutes.frame.size.width/2;// / self.Y_FPS.numberOfComponents;
    float lblXpositionMin = self.X_Minutes.frame.origin.x;
    float lblYpositionMin = (self.X_Minutes.frame.origin.y);
    
    UILabel *lblMin = [[UILabel alloc] initWithFrame:CGRectMake(lblXpositionMin,
                                                                lblYpositionMin,
                                                                lblWidthMin,
                                                                100)];
    [lblMin setText:strMinutes];
    [lblMin setTextAlignment:NSTextAlignmentCenter];
    
    [self.view addSubview:lblMin];

*/
}

/*If I want EACH item to have the description following (i.e. 1 minutes, 2 minutes, 3 minutes)
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UIView *pickerviewtemp=[[UIView alloc] initWithFrame:CGRectZero];

    UILabel *labelForMinutes=[[UILabel alloc] initWithFrame:CGRectMake(30, 0, 100, 50)];
    [labelForMinutes setBackgroundColor:[UIColor clearColor]];
    [labelForMinutes setText:[NSString stringWithFormat:@"%@ Minutes", self.availableMinutes[row]]];
    [labelForMinutes setFont:[UIFont boldSystemFontOfSize:16]];
    [pickerviewtemp addSubview:labelForMinutes];
    
    return pickerviewtemp;
    
}

*/



// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.X_Minutes) {
        return (int)self.availableMinutes.count;
        
    }
    else if (pickerView == self.Y_FPS) {
        return (int)self.availableFPS.count;
        
    }
    else if (pickerView == self.Z_Seconds) {
        return (int)self.availableSeconds.count;
        
    }
    else if (pickerView == self.Quality) {
        return (int)self.availableQuality.count;
        
    }
    else if (pickerView == self.IntervalExposure) {
        return (int)self.availableInterval.count;
        
    }
    else if (pickerView == self.Size) {
        return (int)self.availableSize.count;
        
    }
    else
        return (int)self.availableMinutes.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == self.X_Minutes) {
        return self.availableMinutes[row];
        
    }
    else if (pickerView == self.Y_FPS) {
        return self.availableFPS[row];
        
    }
    else if (pickerView == self.Z_Seconds) {
        return self.availableSeconds[row];
        
    }
    else if (pickerView == self.Quality) {
        return self.availableQuality[row];
        
    }
    else if (pickerView == self.IntervalExposure) {
        return self.availableInterval[row];
        
    }
    else if (pickerView == self.Size) {
        return self.availableSize[row];
        
    }
    else
        return self.availableMinutes[row];
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    if (pickerView == self.X_Minutes) {
        NSLog(@"Minutes set to %@", self.availableMinutes[row]);
        
    }
    else if (pickerView == self.Y_FPS) {
        NSLog(@"FPS set to %@", self.availableFPS[row]);
        
    }
    else if (pickerView == self.Z_Seconds) {
        NSLog(@"Seconds set to %@", self.availableSeconds[row]);
        
    }
    else if (pickerView == self.Quality) {
        NSLog(@"Seconds set to %@", self.availableQuality[row]);
        
    }
    else if (pickerView == self.IntervalExposure) {
        NSLog(@"Seconds set to %@", self.availableInterval[row]);
        
    }
    else if (pickerView == self.Size) {
        NSLog(@"Seconds set to %@", self.availableSize[row]);
        
    }
    else
    NSLog(@"none of the known pickers chosen/n%@",pickerView);
}

    ///////// END OF PICKER /////////

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
