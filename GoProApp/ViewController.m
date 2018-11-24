//
//  ViewController.m
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "ViewController.h"
/* This is just for opening page use, to point to next pages, test buttons,etc.*/

@interface ViewController ()

// MethodManager property
@property (strong, nonatomic) MethodManager *methodManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Oh boy is it good to be back in Objective-C");
    // create a reference to the MethodManager
    self.methodManager = [MethodManager sharedManager];
    
    [self createTimeLapseButton];
    [self createSettingsButton];
    [self createStreamButton];
    [self createTESTButton];
    [self createConnectButton];
    [self createSetDesiredButton];
    [self createChangeDeviceButton];

    
}

#pragma mark - BUTTON CREATION


- (void)createTimeLapseButton {
    UIButton *openToTimeLapse = [UIButton buttonWithType:UIButtonTypeCustom];
    [openToTimeLapse addTarget:self
                        action:@selector(timeLapseButtonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
    [openToTimeLapse setTitle:@"Show TimeLapse" forState:UIControlStateNormal];
    openToTimeLapse.frame = CGRectMake(80.0, 110.0, 160.0, 40.0);
    openToTimeLapse.backgroundColor = [UIColor greenColor];
    [self.view addSubview:openToTimeLapse];
}

-(void)timeLapseButtonPressed:(UIButton *)openToTimeLapse {
    NSLog(@"works, opening timeLapse page");
    UIViewController *timeLapseController = (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"TLSettingsViewController"];
    [self presentViewController:timeLapseController animated:YES completion:nil];
    
}

- (void)createSettingsButton {
    UIButton *openToSettings = [UIButton buttonWithType:UIButtonTypeCustom];
    [openToSettings addTarget:self
                       action:@selector(settingsButtonPressed:)
             forControlEvents:UIControlEventTouchUpInside];
    [openToSettings setTitle:@"Show View" forState:UIControlStateNormal];
    openToSettings.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    openToSettings.backgroundColor = [UIColor blueColor];
    [self.view addSubview:openToSettings];
}

- (void)settingsButtonPressed:(UIButton *)openToSettings {
    NSLog(@"works, opening settings page");
    UIViewController *settingsController = (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"OptionAssignViewController"];
    [self presentViewController:settingsController animated:YES completion:nil];
    
}

- (void)createStreamButton {
    UIButton *openToStream = [UIButton buttonWithType:UIButtonTypeCustom];
    [openToStream addTarget:self
                     action:@selector(streamButtonPressed:)
           forControlEvents:UIControlEventTouchUpInside];
    [openToStream setTitle:@"Show Stream" forState:UIControlStateNormal];
    openToStream.frame = CGRectMake(80.0, 310.0, 160.0, 40.0);
    openToStream.backgroundColor = [UIColor redColor];
    [self.view addSubview:openToStream];
}

- (void)streamButtonPressed:(UIButton *)openToStream {
    NSLog(@"works, opening stream page");
    UIViewController *streamController = (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"StreamViewController"];
    [self presentViewController:streamController animated:YES completion:nil];
    
}

// this is a test button currently sends GoPro power off signal 03.05.18
- (void)createTESTButton {
    UIButton *openToSettings = [UIButton buttonWithType:UIButtonTypeCustom];
    [openToSettings addTarget:self
                       action:@selector(testButtonPressed:)
             forControlEvents:UIControlEventTouchUpInside];
    [openToSettings setTitle:@"TEST" forState:UIControlStateNormal];
    openToSettings.frame = CGRectMake(80.0, 410.0, 160.0, 40.0);
    openToSettings.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:openToSettings];
}

-(void)testButtonPressed:(UIButton *)submitTestCode {
    
}

// this is a test button to currently connect GoPro STRINGS to 09.22.18
- (void)createConnectButton {
    UIButton *connectStrings = [UIButton buttonWithType:UIButtonTypeCustom];
    [connectStrings addTarget:self
                       action:@selector(connectButtonPressed:)
             forControlEvents:UIControlEventTouchUpInside];
    [connectStrings setTitle:@"connect" forState:UIControlStateNormal];
    connectStrings.frame = CGRectMake(240.0, 40.0, 80.0, 40.0);
    connectStrings.backgroundColor = [UIColor greenColor];
    [self.view addSubview:connectStrings];
}

// this will be method to grab which GoPro is connected, to assign to the MethodManager and thus DAO
-(void)connectButtonPressed:(UIButton *)connectToDevice {
    // connect MM to the correct DAO
    // Assign the MM's currentString which GoPro Model
    self.methodManager.gpCurrent = [[NSString alloc]init];
    self.methodManager.gpCurrent = @"HeroStrings";
    NSLog(@"connected MM to the correct DAO [%@]", self.methodManager.gpCurrent);
    // device will be selected from given connection
    [self.methodManager assignDeviceManager:self.methodManager.gpCurrent];
    [self.methodManager.deviceCurrent.heroDAO objectDidLoad];
    [self.methodManager.deviceCurrent.heroDAO splitJSON];
    /*
     // testing to change to different gopro
     self.methodManager.gpCurrent = @"Hero4";
     [self.methodManager assignDeviceManager:self.methodManager.gpCurrent];
     self.methodManager.gpCurrent = @"NothingTestFail";
     [self.methodManager assignDeviceManager:self.methodManager.gpCurrent];
     */
}

// this is a test button to set the desired settings for the GoPro 09.25.18
- (void)createSetDesiredButton {
    UIButton *setDesired = [UIButton buttonWithType:UIButtonTypeCustom];
    [setDesired addTarget:self
                       action:@selector(setDesiredButtonPressed:)
             forControlEvents:UIControlEventTouchUpInside];
    [setDesired setTitle:@"SetDesir" forState:UIControlStateNormal];
    setDesired.frame = CGRectMake(240.0, 160.0, 80.0, 40.0);
    setDesired.backgroundColor = [UIColor grayColor];
    [self.view addSubview:setDesired];
}

// this will be method to grab which GoPro is connected, to assign to the MethodManager and thus DAO
-(void)setDesiredButtonPressed:(UIButton *)setDesired {
    
    // test code: self.methodManager.settingsCurrent.mode = @"photo";
    //    if the settingsCurrent is set, then submit to change with these values
    
//    self.methodManager.settingsDesired.mode = @"videod";
//    self.methodManager.settingsDesired.subMode = @"vidTL";
//    self.methodManager.settingsDesired.quality = @"1080p";
    //    to check if it is what is expected: NSLog(@"%@", self.methodManager.settingsCurrent.mode);
    
//    [self.methodManager SetMode:self.methodManager.settingsDesired.mode];
//    [self.methodManager SetSubMode:self.methodManager.settingsDesired.subMode];
//    [self.methodManager SetQuality:self.methodManager.settingsDesired.quality];
    
}

// this is a test button to set the desired settings for the GoPro 09.25.18
- (void)createChangeDeviceButton {
    UIButton *changeDevice = [UIButton buttonWithType:UIButtonTypeCustom];
    [changeDevice addTarget:self
                   action:@selector(changeDeviceButtonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
    [changeDevice setTitle:@"chngDevi" forState:UIControlStateNormal];
    changeDevice.frame = CGRectMake(240.0, 260.0, 80.0, 40.0);
    changeDevice.backgroundColor = [UIColor blackColor];
    [self.view addSubview:changeDevice];
}

// this will be method to grab which GoPro is connected, to assign to the MethodManager and thus DAO
-(void)changeDeviceButtonPressed:(UIButton *)changeDevice {
    NSLog(@"user requested to change device");
    if ([self.methodManager.gpCurrent isEqual:@"HeroStrings"]) {
        self.methodManager.gpCurrent = @"Hero4";
    }
    else
        self.methodManager.gpCurrent = @"HeroStrings";
    NSLog(@"connected MM to the correct DAO [%@]", self.methodManager.gpCurrent);
    // device will be selected from given connection
    [self.methodManager assignDeviceManager:self.methodManager.gpCurrent];
    
    /* // testing to change to different gopro
     self.methodManager.gpCurrent = @"Hero4";
     [self.methodManager assignDeviceManager:self.methodManager.gpCurrent];
     self.methodManager.gpCurrent = @"NothingTestFail";
     [self.methodManager assignDeviceManager:self.methodManager.gpCurrent];
     */


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* // code pulled from test. unsused 9.25.18
 // powerDeviceOn
 NSLog(@"power off please dfgdfvfdfdgdf");
 
 //    NSURL *url = [[NSURL alloc]initWithString:@"http://10.5.5.9/bacpac/PW?t=inbinary&p=%01"];
 NSURL *url = [[NSURL alloc]initWithString:@"http://10.5.5.9/gp/gpControl/command/system/sleep"];
 //type your URL you can use initWithFormat for placeholders
 NSURLSession *session = [NSURLSession sharedSession];  //use NSURLSession class
 NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
 //You then can use NSURLSessionDownloadTask or NSURLSessionUploadTask
 
 NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
 //note that your requested data are stored on the disk automatic
 //if u need to retrieve your data use the location parameter not the response parameter
 //as it stores the location of ur retrieved data that was saved on the disk
 //works asynchronously i think
 }];
 [task resume]; // to start the download task
 */


@end
