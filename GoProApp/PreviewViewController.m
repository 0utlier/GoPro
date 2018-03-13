//
//  PreviewViewController.m
//  GoProApp
//
//  Created by JD Leonard on 1/4/18.
//  Copyright © 2018 JD Leonard. All rights reserved.
//

#import "PreviewViewController.h"

@interface PreviewViewController ()

@end

@implementation PreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // check if grid is shown or not
    
    // call for whichever current GoPro is being used
    
    [self startLiveStream]; // this should load the visual
    
    }

- (void)startLiveStream {
    // Make the call to http://10.5.5.9/gp/gpControl/execute?p1=gpStream&a1=proto_v2&c1=restart
    // maybe try to use Kondrad's Python tool

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
