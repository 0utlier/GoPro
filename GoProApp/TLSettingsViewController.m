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

/*An object that can be passed through and confirmed as right one, with a float value*/
@interface FloatValueObject : NSObject
@property float valueOf;
- (id)init;
@end
@implementation FloatValueObject
- (id)init {return self;}
@end // end float object

#pragma mark -

@interface TLSettingsViewController ()

/* please check out these websites
 
 iOS/Swift — Creating Multiple Dynamic Picker Views: a Quick Tutorial
 https://medium.com/@smehta/ios-swift-creating-a-dynamic-picker-view-843b3290e7f0
 
 
 iOS9 UIPickerView Example and Tutorial in Swift and Objective-C
 https://codewithchris.com/uipickerview-example/
 
 */


@property (strong, nonatomic) MethodManager *methodManager;

// Settings Array to use throughout current page [assigned values from DAO's version for simpler code]
//@property (weak, nonatomic) NSMutableArray *currentSettingsArray; // 07.22.20 removed from code. Why have it?

@property BOOL testForHardCode;

// if user chooses to lock current value [button on UIPickerView] this BOOL will be checked so that equation can be implemented with that in mind
@property BOOL lockedForMinutes;
@property BOOL lockedForSeconds;
@property BOOL lockedForFPS;
@property BOOL lockedForIntervalExposure;

// equation values - to be set and used for the assignment of others
@property FloatValueObject* intervalValue;
@property FloatValueObject* minutesValue;
@property FloatValueObject* FPSValue;
@property FloatValueObject* secondsValue;

@property UILabel* displayValues;
@property UIButton* submitButton;

// properties of the timer
@property int timerSeconds;
@property NSDate* startDate;
@property NSTimer* stopWatchTimer;
@property NSDateFormatter* dateFormatter;
@property BOOL timerIsCountingDown;
/*
 
 
 07.13.20
 Check if NightMode Time Lapse [interval becomes exposure!]
 
 03.19.18
 NEXT things TODO
 [DONE! Check below] Set item when other item changed (ie time in seconds affects shooting minutes, effected by interval)
 Once this happens, add SUBMIT button
 Try to make the button send the signal to MM to send signal
 make 2 buttons: submit and set view
 if submit hit, start clock timer after sending signal
 
 07.02.18
 set up live stream
 */


@end

@implementation TLSettingsViewController

#pragma mark - SET UP PAGE VALUES

- (void)viewDidLoad {
    [super viewDidLoad];
    /*create a methodManager - use sharedDAO*/
    self.methodManager = [MethodManager sharedManager];
    /*check if it exists, and did not return empty/null*/
    NSLog(@"device is object %@", self.methodManager.deviceCurrent);
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    /*This is where the assignment comes in*/
    [self assignAvailable];
    //    NSLog(@"TLSettings Page Loading for %@", self.availableFPS);
    [self createRefreshButton];
    [self createSubmitButton];
    [self createValueLabel];

    // buttons for testing locked binaries for settings
    [self createLockIntervalButton];
    [self createLockMinutesButton];
    [self createLockSecondsButton];
    [self createLockFPSButton];

    /* in case we need hard code 03.19.18 */ /*removed 07.15.20*/
    //     [self makeHardCodeTestData];
    
    [self delegateForUIPickers];
    [self labelForUIPickerViews];
    
    // assign the default index for each UIViewPicker
    [self assignInitialValues];
    
}

-(void) assignAvailable {

    // allocate the float objects in memory
    self.intervalValue = [[FloatValueObject alloc]init];
    self.minutesValue = [[FloatValueObject alloc]init];
    self.FPSValue = [[FloatValueObject alloc]init];
    self.secondsValue = [[FloatValueObject alloc]init];
    
    // obtain all available intervals of Time Lapse [video 07.18.20] // may need to get MSTLInterval as well
    self.availableInterval = [self.methodManager.deviceCurrent.heroDAO getVideoTLInterval];
    if ([self.availableInterval count] == 0) {
        NSLog(@"The Interval Array is EMPTY! Make hardcode");
        self.testForHardCode = YES;
        // still causes crash if GoPro is not connected
        self.availableInterval = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", nil];
        
    }
    
    // obtain all available qualities of Time Lapse
    // 07.15.20 HARDCODE for now, because it seems limited in qualities for Time Lapse [at least on H4]
    self.availableQuality = [[NSMutableArray alloc]initWithObjects:@"2.7K 4:3", @"4K", nil];
    //    self.availableQuality = [self.methodManager.deviceCurrent.heroDAO getVideoResolution]; // 07.13.20 this is going to get ALL resolution qualities, and not JUST Time Lapse qualities [TODO figure out if new method required (e.g. GetVideoTLResolition)]
    
    // hard code these two, as it is up to user and NOT determined by the GoPro
    self.availableMinutes = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", nil]; // available to shoot
    self.availableSeconds = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", nil]; // post after creation
    self.availableFPS = [[NSMutableArray alloc]initWithObjects:@"24", @"30", @"60", nil]; // post after creation
    
    self.availableSize = [[NSMutableArray alloc]initWithObjects:@"standard", @"wide", nil]; // need to set in protocol and DAO
    
    
}

- (void) makeHardCodeTestData{ // NOT CURRENTLY BEING USED 07.15.20
    // Initialize Data
    self.availableInterval = [[NSMutableArray alloc]initWithObjects:@".5", @"1", @"2", nil];
    self.availableQuality = [[NSMutableArray alloc]initWithObjects:@"2.7K 4:3", @"4K", nil];
    
    self.availableMinutes = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", nil];
    self.availableFPS = [[NSMutableArray alloc]initWithObjects:@"24", @"30", @"60", nil];
    self.availableSeconds = [[NSMutableArray alloc]initWithObjects:@".5", @"1", @"2", @"3", @"4", @"5", @"6", nil];
    self.availableSize = [[NSMutableArray alloc]initWithObjects:@"standard", @"wide", nil];
    
}

- (void) assignInitialValues { // 07.13.20 default for each of the sections
    // HARDCODED for default values
    [self.X_Minutes selectRow:5 inComponent:0 animated:YES]; // 6 min
    [self.Y_FPS selectRow:1 inComponent:0 animated:YES]; // 30FPS
    [self.Z_Seconds selectRow:5 inComponent:0 animated:YES]; // 6 Sec
    
    /*Find the value of Time Lapse interval -- then assign that to the index*/
    // assign array to be used from DAO
    NSMutableArray *videoSettings = [self.methodManager.deviceCurrent.heroDAO assignCurrentVideoSettingsArray];
    NSString *currentIntervalValue = [[NSString alloc]init];
    
    // obtain current SettingsObject.value that is Time Lapse Interval
    for (SettingsObject *timeLapseInterval in videoSettings) {
        if ([timeLapseInterval.title isEqualToString:@"Time Lapse Interval"]) {
            NSLog(@"we found it %@", timeLapseInterval.value);
            currentIntervalValue = timeLapseInterval.value;
            break;
        }
    }
    
    // assign array of Time Lapse Interval to be used from DAO
    /* // already assigned with a private value, no need to make this call again
     //    NSMutableArray *intervalSettings = [self.methodManager.deviceCurrent.heroDAO getVideoTLInterval];
     //    for (CommandPathObject *fpsAvailable in intervalSettings) { */
    int indexForTL = 0; // assign the index of current
    
    if (self.testForHardCode == NO) {
        for (CommandPathObject *fpsAvailable in self.availableInterval) {
            if ([fpsAvailable.value isEqualToString:currentIntervalValue]) {
                NSLog(@"%@ at index: %d",fpsAvailable.value, indexForTL);
                break;
            }
            indexForTL++;
        }

    }    //    NSLog(@"Time Lapse interval value: %d",self.IntervalExposureIndex);
    // ASSIGNED
    [self.IntervalExposure selectRow:indexForTL inComponent:0 animated:YES];
    //==============================================//
    
    /*Find the value of Time Lapse quality -- then assign that to the index*/
    // assign array to be used from DAO
    NSMutableArray *videoSettingsForQuality = [self.methodManager.deviceCurrent.heroDAO assignCurrentVideoSettingsArray];
    NSString *currentQualityValue = [[NSString alloc]init];
    
    // obtain SettingsObject.value that is Time Lapse Interval
    for (SettingsObject *timeLapseQuality in videoSettingsForQuality) {
        if ([timeLapseQuality.title isEqualToString:@"Resolution"]) {
            NSLog(@"we found it %@", timeLapseQuality.value);
            currentQualityValue = timeLapseQuality.value;
            break;
        }
    }
    
    // assign array of Time Lapse Interval to be used from DAO
    NSMutableArray *qualitySettings = [self.methodManager.deviceCurrent.heroDAO getVideoResolution];
    int indexForTLQuality = 0; // assign the index of current
    
    for (CommandPathObject *qualityAvailable in qualitySettings) {
        if ([qualityAvailable.value isEqualToString:currentQualityValue]) {
            NSLog(@"%@ at index: %d",qualityAvailable.value, indexForTL);
            break;
        }
        indexForTLQuality++;
    }
    NSLog(@"Time Lapse quality value: %d",indexForTLQuality);
    int countOfArrayForModulo = (int)[self.availableQuality count]; // should be 2 for hardcode
    int i = indexForTLQuality%countOfArrayForModulo;
    NSLog(@"modulo %d for count: %d",i, countOfArrayForModulo);
    
    // ASSIGNED
    [self.Quality selectRow:i inComponent:0 animated:YES];
    
    
}

#pragma mark - UIButtons


// refreshes values of pickers compared to the JSON of the GoPro. Also considers if HARDCODED
- (void) createRefreshButton {
    UIButton *refreshPicker = [UIButton buttonWithType:UIButtonTypeCustom];
    [refreshPicker addTarget:self
                      action:@selector(refreshButtonPressed:)
            forControlEvents:UIControlEventTouchUpInside];
    [refreshPicker setTitle:@"Refresh [x2]" forState:UIControlStateNormal];
    if (self.testForHardCode == YES) {
        [refreshPicker setTitle:@"HARDCODE [x2]" forState:UIControlStateNormal];    }
    refreshPicker.frame = CGRectMake(120.0, 340.0, 160.0, 40.0);
    refreshPicker.backgroundColor = [UIColor blueColor];
    [self.view addSubview:refreshPicker];
}

-(void)refreshButtonPressed:(UIButton *)refresh {
    NSLog(@"works, refreshing pickers");
    
    // refresh the GoPro settings [JSON] and refresh initial index for UIPickerViews [only the ones that are assigned by the camera]
    [self.methodManager.deviceCurrent.heroDAO splitJSON];
    // TODO 07.15.20 Needs "listener" here, so that it can refresh once done!
    [self assignInitialValues];
    [self.Quality reloadAllComponents];
    [self.Y_FPS reloadAllComponents];
    
    /*    UIViewController *settingsController = (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"OptionAssignViewController"];
     [self presentViewController:settingsController animated:YES completion:nil];
     */
}

// SUBMIT button so that you can submit values for UIPickerViews
- (void) createSubmitButton {
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitButton addTarget:self
                      action:@selector(submitButtonPressed:)
            forControlEvents:UIControlEventTouchUpInside];
    [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    submitButton.frame = CGRectMake(280.0, 340.0, 100.0, 40.0);
    submitButton.backgroundColor = [UIColor greenColor];
    self.submitButton = submitButton;
    [self.view addSubview:self.submitButton];
}

-(void)submitButtonPressed:(UIButton *)submit {
    // if timer is already running, reset timer, bool and title
    if (self.timerIsCountingDown == YES) {
        [self stopTimer];
        return;
    }
    
    self.timerIsCountingDown = YES; // timer is going to be ON
    [submit setTitle:@"STOP" forState:(UIControlStateNormal)];
    // obtain currently assigned value for picker, using row as the index
    int indexForObject = (int)[self.IntervalExposure selectedRowInComponent:0];
    NSString *currentValueOfIntervalExposure = self.availableInterval[indexForObject];
    NSLog(@"works, submit picker value for Interval/Exposure %@", currentValueOfIntervalExposure);
    if (self.testForHardCode == YES) {
        NSLog(@"Hardcoded, so no value sent for %@",currentValueOfIntervalExposure);
        return;}
    
    CommandPathObject *objectAtIndex = [self.availableInterval objectAtIndex:indexForObject];
    NSLog(@"User selected %@", objectAtIndex.value);
    // send signal to GoPro
    [self.methodManager.deviceCurrent.heroDAO sendCurrentURL:objectAtIndex];
    // TODO 07.22.20 Needs "listener" here, so that it can refresh once done!
    // once signal is received, send URL to start recording
    // once recording has begun, start timer based on minutes value
    int indexForMinutes = (int)[self.X_Minutes selectedRowInComponent:0];
    NSInteger currentMinuteCount = [self.availableMinutes[indexForMinutes] integerValue];
    self.timerSeconds=(int)currentMinuteCount*60; // makes into seconds
    
    // Create a date formatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];

    self.dateFormatter = dateFormatter;
    [self startTimer];
}
//===================START TIMER===========================//

- (void)updateTimer {
    // Create date from the elapsed time
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:self.startDate];
//    NSLog(@"time interval %f",timeInterval); // will print out elapsed time
    // stop timer once seconds has been hit
    if (timeInterval > self.timerSeconds) {
        NSLog(@"We are done!");
        [self stopTimer];
        /*Offer a notification? 07.23.20*/
        return;
    }
    // seconds count down [remaining]
    NSTimeInterval timeIntervalCountDown = self.timerSeconds - timeInterval;
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeIntervalCountDown];
    
    // Format the remaining time and set it to the label
    NSString *timeString = [self.dateFormatter stringFromDate:timerDate];
    [self.displayValues setText:timeString];
}

- (void)startTimer {
    if (self.stopWatchTimer) {
        [self.stopWatchTimer invalidate];
        self.stopWatchTimer = nil;}
    self.startDate = [NSDate date];
    // Create the stop watch timer that fires every 300 ms [Orig was 100ms]
    self.stopWatchTimer = [NSTimer scheduledTimerWithTimeInterval:3.0/10.0 target:self selector:@selector(updateTimer)userInfo:nil repeats:YES];
}

- (void)stopTimer {
    // send signal to STOP /*TODO 07.23.20*/
    [self.stopWatchTimer invalidate];
    self.stopWatchTimer = nil;
    [self.submitButton setTitle:@"Submit" forState:(UIControlStateNormal)];
    [self updateValuesWithEquation];
    self.timerIsCountingDown = NO;
}

//===================END TIMER===========================//

-(void)createValueLabel {
    UILabel *valueLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 300, 400, 40)];
    valueLabel.backgroundColor = [UIColor redColor];
    //    NSString *textForLabel = [NSString stringWithFormat:@"Values: I=%.02f, X=%.02f, Y=%.02f, Z=%.02f",self.intervalValue.valueOf, self.minuteValue.valueOf, self.FPSValue.valueOf, self.secondsValue.valueOf];
    ;
    //    [valueLabel setText:textForLabel];
    self.displayValues = valueLabel;
    [[self view] addSubview:self.displayValues];
}

// button for testing the BOOL of IntervalExposure being locked or not
- (void) createLockIntervalButton {
    UIButton *lockIntervalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lockIntervalButton addTarget:self
                           action:@selector(lockIntervalButtonPressed:)
                 forControlEvents:UIControlEventTouchUpInside];
    if (self.lockedForIntervalExposure == YES) {
        [lockIntervalButton setTitle:@"Interval is Locked" forState:UIControlStateNormal];}
    else {[lockIntervalButton setTitle:@"Interval Not Locked" forState:UIControlStateNormal];}
    
    if (self.testForHardCode == YES) {
        //        [lockIntervalButton setTitle:@"HARDCODE [x2]" forState:UIControlStateNormal];
    }
    lockIntervalButton.frame = CGRectMake(120.0, 450.0, 160.0, 40.0);
    lockIntervalButton.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:lockIntervalButton];
}

-(void)lockIntervalButtonPressed:(UIButton *)locked {
    if (self.lockedForIntervalExposure == YES) {
        //        NSLog(@"works, Interval Locked no longer");
        [locked setTitle:@"Interval Not Locked" forState:UIControlStateNormal];
        self.lockedForIntervalExposure = NO;
        return;
    }
    //    NSLog(@"works, Interval Now Locked");
    [locked setTitle:@"Interval is Locked" forState:UIControlStateNormal];
    self.lockedForIntervalExposure = YES;
}

// button for testing the BOOL of Minutes being locked or not
- (void) createLockMinutesButton {
    UIButton *lockMinutesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lockMinutesButton addTarget:self
                          action:@selector(lockMinuteButtonPressed:)
                forControlEvents:UIControlEventTouchUpInside];
    if (self.lockedForMinutes == YES) {
        [lockMinutesButton setTitle:@"Minutes is Locked" forState:UIControlStateNormal];}
    else {[lockMinutesButton setTitle:@"Minute Not Locked" forState:UIControlStateNormal];}
    
    if (self.testForHardCode == YES) {
        //        [lockIntervalButton setTitle:@"HARDCODE [x2]" forState:UIControlStateNormal];
    }
    lockMinutesButton.frame = CGRectMake(0.0, 200.0, 160.0, 40.0);
    lockMinutesButton.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:lockMinutesButton];
}

-(void)lockMinuteButtonPressed:(UIButton *)locked {
    if (self.lockedForMinutes == YES) {
        //        NSLog(@"works, Interval Locked no longer");
        [locked setTitle:@"Minute Not Locked" forState:UIControlStateNormal];
        self.lockedForMinutes = NO;
        return;
    }
    //    NSLog(@"works, Interval Now Locked");
    [locked setTitle:@"Minutes is Locked" forState:UIControlStateNormal];
    self.lockedForMinutes = YES;
}

// button for testing the BOOL of Seconds being locked or not
- (void) createLockSecondsButton {
    UIButton *lockSecondsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lockSecondsButton addTarget:self
                          action:@selector(lockSecondButtonPressed:)
                forControlEvents:UIControlEventTouchUpInside];
    if (self.lockedForSeconds == YES) {
        [lockSecondsButton setTitle:@"Seconds is Locked" forState:UIControlStateNormal];}
    else {[lockSecondsButton setTitle:@"Second Not Locked" forState:UIControlStateNormal];}
    
    if (self.testForHardCode == YES) {
        //        [lockIntervalButton setTitle:@"HARDCODE [x2]" forState:UIControlStateNormal];
    }
    lockSecondsButton.frame = CGRectMake(240.0, 200.0, 160.0, 40.0);
    lockSecondsButton.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:lockSecondsButton];
}

-(void)lockSecondButtonPressed:(UIButton *)locked {
    if (self.lockedForSeconds == YES) {
        //        NSLog(@"works, Interval Locked no longer");
        [locked setTitle:@"Second Not Locked" forState:UIControlStateNormal];
        self.lockedForSeconds = NO;
        return;
    }
    //    NSLog(@"works, Interval Now Locked");
    [locked setTitle:@"Seconds is Locked" forState:UIControlStateNormal];
    self.lockedForSeconds = YES;
}

// button for testing the BOOL of FPS being locked or not
- (void) createLockFPSButton {
    UIButton *lockFPSButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lockFPSButton addTarget:self
                          action:@selector(lockFPSButtonPressed:)
                forControlEvents:UIControlEventTouchUpInside];
    if (self.lockedForFPS == YES) {
        [lockFPSButton setTitle:@"FPS is Locked" forState:UIControlStateNormal];}
    else {[lockFPSButton setTitle:@"FPS Not Locked" forState:UIControlStateNormal];}
    
    if (self.testForHardCode == YES) {
        //        [lockIntervalButton setTitle:@"HARDCODE [x2]" forState:UIControlStateNormal];
    }
    lockFPSButton.frame = CGRectMake(120.0, 260.0, 160.0, 40.0);
    lockFPSButton.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:lockFPSButton];
}

-(void)lockFPSButtonPressed:(UIButton *)locked {
    if (self.lockedForFPS == YES) {
        //        NSLog(@"works, Interval Locked no longer");
        [locked setTitle:@"FPS Not Locked" forState:UIControlStateNormal];
        self.lockedForFPS = NO;
        return;
    }
    //    NSLog(@"works, Interval Now Locked");
    [locked setTitle:@"FPS is Locked" forState:UIControlStateNormal];
    self.lockedForFPS = YES;
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

// The data to return for the row and component (column) that's being displayed
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
        /*
         // 07.15.20 hardcoded because not all video qualities are available for Time Lapse
         // since it is an array of commandObjects, we want the value for display
         return [self.availableQuality[row] valueForKey:@"value"]; */
        
    }
    else if (pickerView == self.IntervalExposure) {
        if (self.testForHardCode == YES) {
            return self.availableInterval[row];
        }
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
        
        if (self.testForHardCode == NO) {
            // 07.12.20 TODO using equation, find other values due to this selection
            //            [self updateValuesWithEquation];
            //        [self.Y_FPS selectRow:2 inComponent:0 animated:YES]; // testing purposes
        }
        //        [self updateValuesWithEquation];
    }
    else if (pickerView == self.Y_FPS) {
        NSLog(@"FPS set to %@", self.availableFPS[row]);
        //        [self updateValuesWithEquation];
        
    }
    else if (pickerView == self.Z_Seconds) {
        NSLog(@"Seconds set to %@", self.availableSeconds[row]);
        //        [self updateValuesWithEquation];
        
    }
    else if (pickerView == self.Quality) {
        NSLog(@"Quality set to %@", self.availableQuality[row]);
        
        /*        // since it is an array of commandObjects, we want the value for display
         NSLog(@"Quality set to %@", [self.availableQuality[row] valueForKey:@"value"]);*/
    }
    else if (pickerView == self.IntervalExposure) {
        if (self.testForHardCode == YES) {
            NSLog(@"Interval [hardcode] set to %@", self.availableInterval[row]);
            return;
        }
        // since it is an array of commandObjects, we want the value for display
        NSLog(@"Interval set to %@", [self.availableInterval[row] valueForKey:@"value"]);
        //        [self updateValuesWithEquation];
    }
    else if (pickerView == self.Size) {
        NSLog(@"Width set to %@", self.availableSize[row]);
        
    }
    else {
        NSLog(@"none of the known pickers chosen/n%@",pickerView);}
    // update values at end [since there is no parameter] 07.22.20
    [self updateValuesWithEquation];
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

#pragma mark - FIND VALUES

-(float)currentValueForPicker:(UIPickerView*)pickerView ofArray:(NSMutableArray*)availableArray {
    NSInteger row;
    row = [pickerView selectedRowInComponent:0];
    // obtain value of currentSelectedRow
    NSString *currentlyAssignedValue = currentlyAssignedValue = [availableArray objectAtIndex:row];
    // check if array has objects. Necessary to get "value" key
    //    if (pickerView == self.IntervalExposure) { //refactor, so that not hardcoded [check if obtains objects]
    if (![availableArray[0] isKindOfClass:[NSString class]]) {
        
        
        currentlyAssignedValue = [[availableArray objectAtIndex:row]valueForKey:@"value"];
    }
    float currentValue = [currentlyAssignedValue floatValue];
    NSLog(@"row %d AND object value %f", (int)row, currentValue);
    return currentValue;
}

-(void) updateValuesWithEquation {
    NSLog(@"Changing values for properties - do I return a property or set it?");
    
    // testing purposes - change each picker depending on what values are changed. How to determine which one to change first? What is prioritized? Or decided by user? [keep minutes, keep FPS, etc. - now do we change the seconds or the interval?]
    // obtain current index/value of each of the pickers
    self.intervalValue.valueOf = [self currentValueForPicker:self.IntervalExposure ofArray:self.availableInterval];
    self.minutesValue.valueOf = [self currentValueForPicker:self.X_Minutes ofArray:self.availableMinutes];
    self.FPSValue.valueOf = [self currentValueForPicker:self.Y_FPS ofArray:self.availableFPS];
    self.secondsValue.valueOf = [self currentValueForPicker:self.Z_Seconds ofArray:self.availableSeconds];
    NSLog(@"print correct value: I=%f, X=%f, Y=%f, Z=%f",self.intervalValue.valueOf, self.minutesValue.valueOf, self.FPSValue.valueOf, self.secondsValue.valueOf);
    
    NSString *textForLabel = [NSString stringWithFormat:@"Values: I=%.02f, X=%.02f, Y=%.02f, Z=%.02f",self.intervalValue.valueOf, self.minutesValue.valueOf, self.FPSValue.valueOf, self.secondsValue.valueOf];
    ;
    [self.displayValues setText:textForLabel];

    /*07.20.20 PRIORITY for values: // in case locked is NOT for 3 values [need to determine 2 values]
     (0) FPS [30 default]
     (1) Minutes [6 default]
     (2) Seconds [6 default]
     (3) Interval [determined by camera]
     */
    
    /* // hardcode testing 07.20.20
     self.lockedForSeconds = YES;
     self.lockedForMinutes = YES;
     self.lockedForFPS = YES;
     self.lockedForIntervalExposure = NO;*/
    
    /*For values that are not locked, follow the priority list above. Assign until there is only one value NOT locked. Once assigned, unlock previously changed. 07.22.20 maybe consider a notification if ONLY one of the values is unlocked, that it cannot be changed without unlocking a different value */
    
    /*07.15.20 this is where the decision about which value is locked and which is calculated*/
    if (self.lockedForIntervalExposure) {// Interval is locked
        if (self.lockedForFPS) {// Interval AND FPS is locked
            if (self.lockedForMinutes) {// Interval AND FPS AND Minutes ONLY is locked
                [self equationForTimeLapse:self.availableSeconds forCurrentValue:self.secondsValue];
                return;
            }
            else if (self.lockedForSeconds) {// Interval AND FPS AND Seconds ONLY is locked
                [self equationForTimeLapse:self.availableMinutes forCurrentValue:self.minutesValue];
                return;
            }
            // Interval AND FPS ONLY is locked
            self.lockedForMinutes = YES; // lock Minutes due to priority list
            [self equationForTimeLapse:self.availableSeconds forCurrentValue:self.secondsValue];
            self.lockedForMinutes = NO; // lock Minutes due to priority list
            return;
        }
        else if (self.lockedForMinutes) {// Interval AND Minutes is locked
            if (self.lockedForSeconds) {// Interval AND Minutes AND Seconds ONLY is locked
                [self equationForTimeLapse:self.availableFPS forCurrentValue:self.FPSValue];
            return;
            }
            // Interval and Minutes ONLY locked
            self.lockedForFPS = YES; // lock FPS due to priority list
            [self equationForTimeLapse:self.availableSeconds forCurrentValue:self.secondsValue];
            self.lockedForFPS = NO; // lock FPS due to priority list
            return;
        }
        
        else if (self.lockedForSeconds) {// Interval AND Seconds ONLY is locked
            self.lockedForFPS = YES; // lock FPS due to priority list
            [self equationForTimeLapse:self.availableMinutes forCurrentValue:self.minutesValue];
            self.lockedForFPS = NO; // lock FPS due to priority list
            return;
        }
        // Interval ONLY is locked
        self.lockedForFPS = YES; // lock FPS due to priority list
        self.lockedForMinutes = YES; // lock Minutes due to priority list
        [self equationForTimeLapse:self.availableSeconds forCurrentValue:self.secondsValue];
        self.lockedForFPS = NO; // lock FPS due to priority list
        self.lockedForMinutes = NO; // lock Minutes due to priority list
        return;
    }
    
    else if (self.lockedForMinutes) {// Minutes is locked
        if (self.lockedForSeconds) {// Minutes AND Seconds is locked
            if (self.lockedForFPS) {// Minutes AND Seconds AND FPS ONLY is locked
                [self equationForTimeLapse:self.availableInterval forCurrentValue:self.intervalValue];
                return;
            }
            // Minutes AND Seconds ONLY is locked
            self.lockedForFPS = YES; // lock FPS due to priority list
            [self equationForTimeLapse:self.availableInterval forCurrentValue:self.intervalValue];
            self.lockedForFPS = NO; // lock FPS due to priority list
            return;
        }
        else if (self.lockedForFPS) {// Minutes AND FPS ONLY is locked
            self.lockedForSeconds = YES; // lock seconds due to priority list
            [self equationForTimeLapse:self.availableInterval forCurrentValue:self.intervalValue];
            self.lockedForSeconds = NO; // lock seconds due to priority list
            return;
        }
        // Minutes is ONLY locked
        self.lockedForFPS = YES; // lock FPS due to priority list
        self.lockedForSeconds = YES; // lock Seconds due to priority list
        [self equationForTimeLapse:self.availableInterval forCurrentValue:self.intervalValue];
        self.lockedForFPS = NO; // lock FPS due to priority list
        self.lockedForSeconds = NO; // lock Seconds due to priority list
        return;
    }
    else if (self.lockedForFPS) {// FPS is locked
        
        if (self.lockedForSeconds) {// FPS AND Seconds ONLY is locked
            self.lockedForMinutes = YES; // lock Minutes due to priority list
            [self equationForTimeLapse:self.availableInterval forCurrentValue:self.intervalValue];
            self.lockedForMinutes = NO; // lock Minutes due to priority list
            return;
        }
        // FPS is ONLY locked
        self.lockedForMinutes = YES; // lock Minutes due to priority list
        self.lockedForSeconds = YES; // lock Seconds due to priority list
        [self equationForTimeLapse:self.availableInterval forCurrentValue:self.intervalValue];
        self.lockedForMinutes = NO; // lock Minutes due to priority list
        self.lockedForSeconds = NO; // lock Seconds due to priority list
        return;
    }
    
    else if (self.lockedForSeconds) {// Seconds ONLY is locked
        self.lockedForFPS = YES; // lock FPS due to priority list
        self.lockedForMinutes = YES; // lock Minutes due to priority list
        [self equationForTimeLapse:self.availableInterval forCurrentValue:self.intervalValue];
        self.lockedForFPS = NO; // unlock FPS due to priority list
        self.lockedForMinutes = NO; // unlock Minutes due to priority list
        return;
    }
    
    return;
}



// 07.15.20 this is to take which array is being changed // look for locked/prioritized currentSettings and base new value from there
-(void)equationForTimeLapse:(NSMutableArray*)currentArray forCurrentValue:(FloatValueObject*)currentValue {
    float equationValue = 0;
    int indexToAssign = 0;
    
    if (self.testForHardCode == YES) {//testing purposes
        [self.IntervalExposure selectRow:2 inComponent:0 animated:YES];
        return;
    }

    /*Obtain which value is to be equated
     Find assigned value
     Find index in array
     Assign the UIPickerView index/row*/
    
    if (currentValue == self.intervalValue) { // change interval Value
        equationValue = [self equate:self.intervalValue];
        indexToAssign = [self findIndexForArray:currentArray forEquationValue:equationValue];
        [self.IntervalExposure selectRow:indexToAssign inComponent:0 animated:YES];
//        return; // row is set for Interval, no need to go forward
    }
    
    else if (currentValue == self.minutesValue) { // change minute Value
        equationValue = [self equate:self.minutesValue];
        indexToAssign = [self findIndexForArrayForHardCodedValues:currentArray forEquationValue:equationValue];
        [self.X_Minutes selectRow:indexToAssign inComponent:0 animated:YES]; //testing purposes
    }
    
    else if (currentValue == self.secondsValue) { // change seconds Value
        equationValue = [self equate:self.secondsValue];
        indexToAssign = [self findIndexForArrayForHardCodedValues:currentArray forEquationValue:equationValue];
        [self.Z_Seconds selectRow:indexToAssign inComponent:0 animated:YES]; //testing purposes
    }
    
    else if (currentValue == self.FPSValue) { // change FPS Value
        equationValue = [self equate:self.FPSValue];
        indexToAssign = [self findIndexForArrayForHardCodedValues:currentArray forEquationValue:equationValue];
        [self.Y_FPS selectRow:indexToAssign inComponent:0 animated:YES]; //testing purposes
    }
    
}

// 07.20.20 calculate value for given value
-(float)equate:(FloatValueObject*)currentValue {
    float equationValue = 0;
    
    /* ZYI/60 = X */
    // I have 6 minutes to shoot. I want 30fps in post. I want 6 seconds of footage in post. What is my interval
    if (currentValue == self.intervalValue) {
        NSLog(@"This is the INTERVAL here!");
        equationValue = ((self.minutesValue.valueOf*60)/self.secondsValue.valueOf)/self.FPSValue.valueOf;
    }
    else if (currentValue == self.secondsValue) {
        NSLog(@"This is the SECONDS here!");
        equationValue = ((self.minutesValue.valueOf*60)/self.intervalValue.valueOf)/self.FPSValue.valueOf;
    }
    else if (currentValue == self.FPSValue) {
        NSLog(@"This is the FPS here!");
        equationValue = ((self.minutesValue.valueOf*60)/self.secondsValue.valueOf)/self.intervalValue.valueOf;
    }
    else if (currentValue == self.minutesValue) {
        NSLog(@"This is the MINUTES here!");
        equationValue = ((self.intervalValue.valueOf/60)*self.secondsValue.valueOf)*self.FPSValue.valueOf;
    }
    
    NSLog(@"The value necessary would be %f",equationValue);
    NSString *textForLabel = [NSString stringWithFormat:@"Values %.02f: I=%.02f, X=%.02f, Y=%.02f, Z=%.02f", equationValue,self.intervalValue.valueOf, self.minutesValue.valueOf, self.FPSValue.valueOf, self.secondsValue.valueOf];
    ;
    [self.displayValues setText:textForLabel];

    return equationValue;
    
}

-(int)findIndexForArray:(NSMutableArray *)currentArray forEquationValue:(float)equationValue {
    int indexToAssign = (int)currentArray.count - 1; // most likely, make this its own method (07.22.20 I don't think necessary. Just keep here)
    for (int i = indexToAssign; i >= 0; i--) {
        NSLog(@"%f",[[currentArray[i] valueForKey:@"value"]floatValue]);
        indexToAssign = i;
        /*check if above zero using intValue*/
        if (equationValue >= [[currentArray[i] valueForKey:@"value"]intValue]) {
            if (equationValue == [[currentArray[i] valueForKey:@"value"]floatValue]) {
                NSLog(@"The value is the SAME! Index: %d, value of row %@",i, [currentArray[i] valueForKey:@"value"]);
                indexToAssign = i; // i think ok to remove 07.21.20
                break;
            }
//            indexToAssign = i;
            // check as long as it is not the top of the array, add 1
            if (indexToAssign != currentArray.count - 1) {
                indexToAssign = i+1;
            }
            // check if counter is 0, because if it is, don't increase by 1. Also, ensure it is actually LESS THAN index 0 [.66 between .5 and 1 would not be zero index]
            if (i == 0 &&
                equationValue < [[currentArray[i] valueForKey:@"value"]floatValue]) {
                indexToAssign = i; // i think ok to remove 07.21.20
            }
            NSLog(@"The value is %f, so assign the value to above current: %@",equationValue, [currentArray[indexToAssign] valueForKey:@"value"]);
            // since it is not equal, it needs to be the index above
            break;
        }
    }
    return indexToAssign;
}

-(int)findIndexForArrayForHardCodedValues:(NSMutableArray *)currentArray forEquationValue:(float)equationValue {
    int indexToAssign = (int)currentArray.count - 1; // most likely, make this its own method
    for (int i = indexToAssign; i >= 0; i--) {
        NSLog(@"%f",[currentArray[i]floatValue]);
        indexToAssign = i; // only needs changning if +1 for 0 value
        /*check if above zero using intValue*/
        if (equationValue >= [currentArray[i]intValue]) {
            if (equationValue == [currentArray[i]floatValue]) {
                NSLog(@"The value is the SAME! Index: %d, value of row %@",i, currentArray[i]);
                indexToAssign = i;// i think ok to remove 07.21.20
                break;
            }
            indexToAssign = i; // i think ok to remove 07.21.20
            // if it is larger than the largest value, do not add 1. Keep as is
            if (indexToAssign != currentArray.count - 1) {
                indexToAssign = i+1;
            }
            // check if counter is 0, because if it is, don't increase by 1. Also, ensure it is actually LESS THAN index 0 [.66 between .5 and 1 would not be zero index]
            if (i == 0 &&
                equationValue < [currentArray[i]floatValue]) {
                indexToAssign = i;// i think ok to remove 07.21.20
            }
            NSLog(@"The value is %f, so assign the value to above current: %@",equationValue, currentArray[indexToAssign]);
            // since it is not equal, it needs to be the index above
            break;
        }
    }
    return indexToAssign;
}



@end

