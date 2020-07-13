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

// Settings Array to use throughout current page [assigned values from DAO's version for simpler code]
@property (weak, nonatomic) NSMutableArray *currentSettingsArray;

/*
 
 07.13.20
 Give option to LOCK the pickerView of choice. User DEFINITELY wants to use "minutes", meaning don't change that in equationTimeLapse method
 
 07.13.20
 Check if NightMode Time Lapse [interval becomes exposure!]
 
 03.19.18
 NEXT things TODO
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
    
    /* in case we need hard code 03.19.18 */
//     [self makeHardCodeTestData];
    
    [self delegateForUIPickers];
    [self labelForUIPickerViews];

    // assign the default index for each UIViewPicker
    [self assignInitialValues];

}

-(void) assignAvailable {
    //    CRASH TODO
    self.availableQuality = [self.methodManager.HeroStrings getVideoResolution]; // 07.13.20 this is going to get ALL qualities, and not JUST Time Lapse qualities [TODO figure out if new method required]
    self.availableInterval = [self.methodManager.HeroStrings getVideoTLInterval];
    
// hard code these two, as it is up to user and NOT determined by the GoPro
    self.availableMinutes = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", nil]; // available to shoot
    self.availableSeconds = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", nil]; // post after creation
    self.availableFPS = [[NSMutableArray alloc]initWithObjects:@"24", @"30", @"60", nil]; // post after creation

    self.availableSize = [[NSMutableArray alloc]initWithObjects:@"standard", @"wide", nil]; // need to set in protocol and DAO
    

}

- (void) makeHardCodeTestData{ // NOT CURRENTLY BEING USED
    // Initialize Data
    self.availableMinutes = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", nil];
    self.availableFPS = [[NSMutableArray alloc]initWithObjects:@"24", @"30", @"60", nil];
    self.availableSeconds = [[NSMutableArray alloc]initWithObjects:@".5", @"1", @"2", @"3", @"4", @"5", @"6", nil];

}

- (void) assignInitialValues { // 07.13.20 default for each of the sections
    // HARDCODED
    [self.X_Minutes selectRow:5 inComponent:0 animated:YES]; // 6 min
    [self.Y_FPS selectRow:1 inComponent:0 animated:YES]; // 30FPS
    [self.Z_Seconds selectRow:5 inComponent:0 animated:YES]; // 6 Sec
    
    /*Find the value of Time Lapse interval -- then assign that to the index*/
    // assign array to be used from DAO
    NSMutableArray *videoSettings = [self.methodManager.HeroStrings assignCurrentVideoSettingsArray];
    NSString *currentIntervalValue = [[NSString alloc]init];
    
    for (SettingsObject *timeLapseInterval in videoSettings) {
        if ([timeLapseInterval.title isEqualToString:@"Time Lapse Interval"]) {
            NSLog(@"we found it %@", timeLapseInterval.value);
            currentIntervalValue = timeLapseInterval.value;
            break;
        }
    }
    
    // assign array to be used from DAO
    NSMutableArray *intervalSettings = [self.methodManager.HeroStrings getVideoTLInterval];
    int indexForTL = 0; // assign the index of current
    
    for (CommandPathObject *fpsAvailable in intervalSettings) {
        if ([fpsAvailable.value isEqualToString:currentIntervalValue]) {
            NSLog(@"%@ at index: %d",fpsAvailable.value, indexForTL);
            break;
        }
        indexForTL++;
    }
    //    NSLog(@"Time Lapse interval value: %d",self.IntervalExposureIndex);
    // ASSIGNED
    [self.IntervalExposure selectRow:indexForTL inComponent:0 animated:YES];
    [self.Quality selectRow:3 inComponent:0 animated:YES];


}

// 07.04.20 not called currently. Also crashes, and needs to be redirected
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
    float lblXposition = self.Z_Seconds.frame.origin.x+100;
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
    float lblXpositionFPS = self.Y_FPS.frame.origin.x+100;
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
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
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
        // since it is an array of commandObjects, we want the value for display
        return [self.availableQuality[row] valueForKey:@"value"];
        
    }
    else if (pickerView == self.IntervalExposure) {
        // since it is an array of commandObjects, we want the value for display
        return [self.availableInterval[row] valueForKey:@"value"];
        
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
        
        // 07.12.20 TODO using equation, find other values due to this selection
        [self equationForTimeLapse];
        [self.Y_FPS selectRow:2 inComponent:0 animated:YES];
        
    }
    else if (pickerView == self.Y_FPS) {
        NSLog(@"FPS set to %@", self.availableFPS[row]);
        
    }
    else if (pickerView == self.Z_Seconds) {
        NSLog(@"Seconds set to %@", self.availableSeconds[row]);
        
    }
    else if (pickerView == self.Quality) {
        // since it is an array of commandObjects, we want the value for display
        NSLog(@"Quality set to %@", [self.availableQuality[row] valueForKey:@"value"]);
        
    }
    else if (pickerView == self.IntervalExposure) {
        // since it is an array of commandObjects, we want the value for display
        NSLog(@"Interval set to %@", [self.availableInterval[row] valueForKey:@"value"]);
        
    }
    else if (pickerView == self.Size) {
        NSLog(@"Width set to %@", self.availableSize[row]);
        
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

-(void) equationForTimeLapse {
    NSLog(@"Changing values for properties - do I return a property or set it?");
// testing purposes - change each picker depending on what values are changed. How to determine which one to change first? What is prioritized? Or decided by user? [keep minutes, keep FPS, etc. - now do we change the seconds or the interval?]
    [self.Y_FPS selectRow:2 inComponent:0 animated:YES];

}

@end
