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

@property (strong, nonatomic) MethodManager *methodManager;

@end

@implementation OptionAssignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*create a methodManager - use sharedDAO*/
    self.methodManager = [MethodManager sharedManager];
    [self.methodManager assignDeviceManager:NULL];
    /*check if it exists, and did not return empty/null*/
    NSLog(@"device is object %@", self.methodManager.deviceCurrent);
    
/*assign buttons to correct OPTION (i.e. modes,subModes,FR, Res) */
    [self createButtons];
	   
}

- (void)createButtons {
    for (NSString *i in self.methodManager.deviceCurrent.heroDAO.availableModes) {
        NSLog(@"Here is the mode, assign a button = %@", i);
    }
    
    for (NSString *i in self.methodManager.deviceCurrent.heroDAO.availableSubModes) {
        NSLog(@"Here is the subMode, assign a button = %@", i);
    }
    
    for (NSString *i in self.methodManager.deviceCurrent.heroDAO.availableFrameRates) {
        NSLog(@"Here is the frameRate, assign a button = %@", i);
        
    }
    
    // try to assign titles and buttons
    
}

/*
-(void)assignSlices {
    self.screenSize = self.view.bounds.size;
    
    self.leftB = [[UIButton alloc]initWithFrame:CGRectMake((self.screenSize.width/6), (self.screenSize.height/4)*3, self.screenSize.width/3, self.screenSize.height/6)];
    // Add an action in current code file (i.e. target)
    [self.leftB addTarget:self
                   action:@selector(leftBPressed:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.leftB setBackgroundImage:[UIImage imageNamed:@"MCQSliceLEFTb.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.leftB];
    
    
    self.rightB = [[UIButton alloc]initWithFrame:CGRectMake((self.screenSize.width/2), (self.screenSize.height/4)*3, self.screenSize.width/3, self.screenSize.height/6)];
    // Add an action in current code file (i.e. target)
    [self.rightB addTarget:self
                    action:@selector(rightBPressed:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.rightB setBackgroundImage:[UIImage imageNamed:@"MCQSliceRIGHTb.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.rightB];
    
    
    self.leftT = [[UIButton alloc]initWithFrame:CGRectMake((self.screenSize.width/6), (self.screenSize.height/4)*3 - (self.screenSize.height/6), self.screenSize.width/3, self.screenSize.height/6)];
    // Add an action in current code file (i.e. target)
    [self.leftT addTarget:self
                   action:@selector(leftTPressed:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.leftT setBackgroundImage:[UIImage imageNamed:@"MCQSliceLEFTt.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.leftT];
    
    
    self.rightT = [[UIButton alloc]initWithFrame:CGRectMake((self.screenSize.width/2), (self.screenSize.height/4)*3 - (self.screenSize.height/6), self.screenSize.width/3, self.screenSize.height/6)];
    // Add an action in current code file (i.e. target)
    [self.rightT addTarget:self
                    action:@selector(rightTPressed:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.rightT setBackgroundImage:[UIImage imageNamed:@"MCQSliceRIGHTt.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.rightT];
    
    
    self.top = [[UIButton alloc]initWithFrame:CGRectMake(((self.screenSize.width/2) - (self.screenSize.width/6)), (7*(self.screenSize.height/12) - self.screenSize.height*0.026), self.screenSize.width/3, self.screenSize.height/6 + self.screenSize.height*0.026)];
    // Add an action in current code file (i.e. target)
    [self.top addTarget:self
                 action:@selector(topPressed:)
       forControlEvents:UIControlEventTouchUpInside];
    [self.top setBackgroundImage:[UIImage imageNamed:@"MCQSliceTOP.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.top];
    
    
    self.bottom = [[UIButton alloc]initWithFrame:CGRectMake(((self.screenSize.width/2) - (self.screenSize.width/6)), ((self.screenSize.height/4)*3), self.screenSize.width/3, self.screenSize.height/6 + self.screenSize.height*0.026)];
    // Add an action in current code file (i.e. target)
    [self.bottom addTarget:self
                    action:@selector(bottomPressed:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.bottom setBackgroundImage:[UIImage imageNamed:@"MCQSliceBOTTOM.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.bottom];
}

*/
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
