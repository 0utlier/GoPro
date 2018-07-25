//
//  ViewController.m
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Oh boy is it good to be back in Objective-C");
    [self createTimeLapseButton];
    [self createSettingsButton];
    [self createStreamButton];
    [self createTESTButton];
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
    openToSettings.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:openToSettings];
}

-(void)testButtonPressed:(UIButton *)openToSettings {
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

    

}




    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
