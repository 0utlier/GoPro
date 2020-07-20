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

@property BOOL testForHardCode;

// if user chooses to lock current value [button on UIPickerView] this BOOL will be checked so that equation can be implemented with that in mind // TODO 07.18.20 needs to be used and implemented
@property BOOL lockedForMinutes;
@property BOOL lockedForSeconds;
@property BOOL lockedForFPS;
@property BOOL lockedForIntervalExposure;

// equation values - to be set and used for the assignment of others
@property FloatValueObject* intervalValue;
@property FloatValueObject* minuteValue;
@property FloatValueObject* FPSValue;
@property FloatValueObject* secondsValue;

@property UILabel* displayValues;

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

#pragma mark - SET UP PAGE VALUES

- (void)viewDidLoad {
    [super viewDidLoad];
    /*create a methodManager - use sharedDAO*/
    self.methodManager = [MethodManager sharedManager];
    /*check if it exists, and did not return empty/null*/
    NSLog(@"device is object %@", self.methodManager.deviceCurrent);
    
    /*This is where the assignment comes in*/
    [self assignAvailable];
    //    NSLog(@"TLSettings Page Loading for %@", self.availableFPS);
    [self createRefreshButton];
    [self createValueLabel];

    /* in case we need hard code 03.19.18 */ /*removed 07.15.20*/
    //     [self makeHardCodeTestData];
    
    [self delegateForUIPickers];
    [self labelForUIPickerViews];
    
    // assign the default index for each UIViewPicker
    [self assignInitialValues];
    
}

-(void)createValueLabel {
    UILabel *valueLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 300, 400, 40)];
    valueLabel.backgroundColor = [UIColor redColor];
//    NSString *textForLabel = [NSString stringWithFormat:@"Values: I=%.02f, X=%.02f, Y=%.02f, Z=%.02f",self.intervalValue.valueOf, self.minuteValue.valueOf, self.FPSValue.valueOf, self.secondsValue.valueOf];
;
//    [valueLabel setText:textForLabel];
    self.displayValues = valueLabel;
    [[self view] addSubview:self.displayValues];
}

-(void) assignAvailable {

    // allocate the float objects in memory
    self.intervalValue = [[FloatValueObject alloc]init];
    self.minuteValue = [[FloatValueObject alloc]init];
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

// 07.04.20 not called currently. Also crashes, and needs to be redirected
- (void) createRefreshButton {
    UIButton *refreshPicker = [UIButton buttonWithType:UIButtonTypeCustom];
    [refreshPicker addTarget:self
                      action:@selector(refreshButtonPressed:)
            forControlEvents:UIControlEventTouchUpInside];
    [refreshPicker setTitle:@"Refresh [x2]" forState:UIControlStateNormal];
    if (self.testForHardCode == YES) {
        [refreshPicker setTitle:@"HARDCODE [x2]" forState:UIControlStateNormal];    }
    refreshPicker.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
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
            [self updateValuesWithEquation];
            //        [self.Y_FPS selectRow:2 inComponent:0 animated:YES]; // testing purposes
        }
        [self updateValuesWithEquation];
    }
    else if (pickerView == self.Y_FPS) {
        NSLog(@"FPS set to %@", self.availableFPS[row]);
        [self updateValuesWithEquation];

    }
    else if (pickerView == self.Z_Seconds) {
        NSLog(@"Seconds set to %@", self.availableSeconds[row]);
        [self updateValuesWithEquation];

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
        [self updateValuesWithEquation];
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
    self.minuteValue.valueOf = [self currentValueForPicker:self.X_Minutes ofArray:self.availableMinutes];
    self.FPSValue.valueOf = [self currentValueForPicker:self.Y_FPS ofArray:self.availableFPS];
    self.secondsValue.valueOf = [self currentValueForPicker:self.Z_Seconds ofArray:self.availableSeconds];
    NSLog(@"print correct value: I=%f, X=%f, Y=%f, Z=%f",self.intervalValue.valueOf, self.minuteValue.valueOf, self.FPSValue.valueOf, self.secondsValue.valueOf);
    
    NSString *textForLabel = [NSString stringWithFormat:@"Values: I=%.02f, X=%.02f, Y=%.02f, Z=%.02f",self.intervalValue.valueOf, self.minuteValue.valueOf, self.FPSValue.valueOf, self.secondsValue.valueOf];
    ;
    [self.displayValues setText:textForLabel];

    /*07.20.20 PRIORITY for values: // in case locked is NOT for 3 values [need to determine 2 values]
     (0) FPS [30 default]
     (1) Minutes [6 default]
     (2) Seconds [6 default]
     (3) Interval [determined by camera]
     */
    
    // hardcode testing 07.20.20
    self.lockedForSeconds = YES;
    self.lockedForMinutes = YES;
    self.lockedForFPS = YES;
    self.lockedForIntervalExposure = NO;
    
    /*07.15.20 TODO this is where the decision about which value is locked and which is figured out*/
    if (self.lockedForIntervalExposure) {// Interval is locked
        if (self.lockedForFPS) {// Interval AND FPS is locked
            if (self.lockedForMinutes) {// Interval AND FPS AND Minutes ONLY is locked
                // TODO change to correct // testing until equation function is corrected
                [self equationForTimeLapse:self.availableSeconds forCurrentValue:self.secondsValue];
                return;
            }
            else if (self.lockedForSeconds) {// Interval AND FPS AND Seconds ONLY is locked
                return;
            }
            // Interval AND FPS ONLY is locked
            return;
        }
        else if (self.lockedForMinutes) {// Interval AND Minutes ONLY is locked
            return;
        }
        
        else if (self.lockedForSeconds) {// Interval AND Seconds ONLY is locked
            return;
        }
        // Interval ONLY is locked
        return;
    }
    
    else if (self.lockedForMinutes) {// Minutes is locked
        if (self.lockedForSeconds) {// Minutes AND Seconds is locked
            if (self.lockedForFPS) {// Minutes AND Seconds AND FPS ONLY is locked
                [self equationForTimeLapse:self.availableInterval forCurrentValue:self.intervalValue];
                return;
            }
        }
        else if (self.lockedForFPS) {// Minutes AND FPS ONLY is locked
            return;
        }
    }
    else if (self.lockedForFPS) {// FPS is locked
        
        if (self.lockedForSeconds) {// FPS AND Seconds ONLY is locked
            return;
        }
    }
    
    else if (self.lockedForSeconds) {// Seconds ONLY is locked
        return;
    }
    
    // Interval is ONLY locked
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
    
    else if (currentValue == self.minuteValue) { // change minute Value
        equationValue = [self equate:self.minuteValue];
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

// TODO 07.15.20 if statements for what is input
// 07.20.20 this is only checking the float value, not the object that we are aiming to change
-(float)equate:(FloatValueObject*)currentValue {
    float equationValue = 0;
    
    /* ZYI/60 = X */
    // I have 6 minutes to shoot. I want 30fps in post. I want 6 seconds of footage in post. What is my interval
    if (currentValue == self.intervalValue) {
        NSLog(@"This is the INTERVAL here!");
        equationValue = ((self.minuteValue.valueOf*60)/self.secondsValue.valueOf)/self.FPSValue.valueOf;
    }
    if (currentValue == self.secondsValue) {
        NSLog(@"This is the SECONDS here!");
        equationValue = ((self.minuteValue.valueOf*60)/self.intervalValue.valueOf)/self.FPSValue.valueOf;
    }
    if (currentValue == self.FPSValue) {
        NSLog(@"This is the FPS here!");
        equationValue = ((self.minuteValue.valueOf*60)/self.secondsValue.valueOf)/self.intervalValue.valueOf;
    }
    if (currentValue == self.minuteValue) {
        NSLog(@"This is the MINUTES here!");
        equationValue = ((self.intervalValue.valueOf/60)*self.secondsValue.valueOf)*self.FPSValue.valueOf;
    }
    // if statement, or case? Discover which one we are working with
    NSLog(@"The value necessary would be %f",equationValue);
    NSString *textForLabel = [NSString stringWithFormat:@"Values %.02f: I=%.02f, X=%.02f, Y=%.02f, Z=%.02f", equationValue,self.intervalValue.valueOf, self.minuteValue.valueOf, self.FPSValue.valueOf, self.secondsValue.valueOf];
    ;
    [self.displayValues setText:textForLabel];

    return equationValue;
    
}

-(int)findIndexForArray:(NSMutableArray *)currentArray forEquationValue:(float)equationValue {
    int indexToAssign = (int)currentArray.count - 1; // most likely, make this its own method
    for (int i = indexToAssign; i >= 0; i--) {
        NSLog(@"%f",[[currentArray[i] valueForKey:@"value"]floatValue]);
        
        /*check if above zero using intValue*/
        if (equationValue >= [[currentArray[i] valueForKey:@"value"]intValue]) {
            if (equationValue == [[currentArray[i] valueForKey:@"value"]floatValue]) {
                NSLog(@"The value is the SAME! Index: %d, value of row %@",i, [currentArray[i] valueForKey:@"value"]);
                indexToAssign = i;
                break;
            }
            indexToAssign = i;
            // check as long as it is not the top of the array, add 1
            if (indexToAssign != currentArray.count - 1) {
            indexToAssign = i+1;
            }
            // check if counter is 0, because if it is, don't increase by 1. Also, ensure it is actually LESS THAN index 0 [.66 between .5 and 1 would not be zero index]
            if (i == 0 &&
                equationValue < [[currentArray[i] valueForKey:@"value"]floatValue]) {
                indexToAssign = i;
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
        
        /*check if above zero using intValue*/
        if (equationValue >= [currentArray[i]intValue]) {
            if (equationValue == [currentArray[i]floatValue]) {
                NSLog(@"The value is the SAME! Index: %d, value of row %@",i, currentArray[i]);
                indexToAssign = i;
                break;
            }
            indexToAssign = i;
            // if it is larger than the largest value, do not add 1. Keep as is
            if (indexToAssign != currentArray.count - 1) {
                indexToAssign = i+1;
            }
            // check if counter is 0, because if it is, don't increase by 1. Also, ensure it is actually LESS THAN index 0 [.66 between .5 and 1 would not be zero index]
            if (i == 0 &&
                equationValue < [currentArray[i]floatValue]) {
                indexToAssign = i;
            }
            NSLog(@"The value is %f, so assign the value to above current: %@",equationValue, currentArray[indexToAssign]);
            // since it is not equal, it needs to be the index above
            break;
        }
    }
    return indexToAssign;
}



@end

