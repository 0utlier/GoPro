//
//  OptionAssignViewController.m
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "OptionAssignViewController.h"

// this is the page to use as the options available for the current setting (ie rsolution, FPS...)
/*NOTHING GETS STORED HERE. ONLY ASSIGNED*/
@interface OptionAssignViewController ()

@end

@implementation OptionAssignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self makeHardCodeTestData]; // this is to be deleted, after data is accessible
}

- (void)makeHardCodeTestData {
    self.availableModesForHero4 = [[NSMutableArray alloc]initWithObjects:@"video", @"photo", @"multi", nil];
    NSLog(@"%@", self.availableModesForHero4);
    // assign to currentProperties available modes
    // assign to buttons, using array? compare
    // gray out the buttons that are not found
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - BUTTONS
- (IBAction)option1:(id)sender {
//    NSLog(@"print out %@", _option1.currentTitle);
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
