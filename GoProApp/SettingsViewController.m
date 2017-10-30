//
//  SettingsViewController.m
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // which device are we using?
    // assign properties
    [self assignValues];
    // change background color to black
    self.view.backgroundColor = [UIColor blackColor];
    
}

- (void)assignValues {
    // assign all the properties
    self.heroCurrent = @"HeroFour";
    NSLog(@"My current model is %@", self.heroCurrent);
    //    self.modeCurrent = @"";
    //    self.subModeCurrent = @"";
    //    self.resolutionCurrent = @"";
}

#pragma mark - BUTTON CREATION


- (void)createResolutionButton {
    UIButton *resolutionChange = [UIButton buttonWithType:UIButtonTypeCustom];
    [resolutionChange addTarget:self
                       action:@selector(resolutionButtonPressed:)
             forControlEvents:UIControlEventTouchUpInside];
    [resolutionChange setTitle:@"Show View" forState:UIControlStateNormal];
    resolutionChange.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    resolutionChange.backgroundColor = [UIColor redColor];
    [self.view addSubview:resolutionChange];
}

-(void)resolutionButtonPressed:(UIButton *)resolutionChange {
    NSLog(@"changing resolution");
    UIViewController *settingsController = (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
    [self presentViewController:settingsController animated:YES completion:nil];
    
}


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
