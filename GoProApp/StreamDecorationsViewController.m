//
//  StreamDecorationsViewController.m
//  GoProApp
//
//  Created by SATURN on 8/11/20.
//  Copyright © 2020 JD Leonard. All rights reserved.
//

#import "StreamDecorationsViewController.h"
#import "MethodManager/MethodManager.h"
/* This is to be added once the streaming function works properly. For now, just to decorate the way it will work 08.11.20*/

/*08.17.20 TO DO
 Save a screenshot of the current page? [for Time Lapse setup] [or export screen grab from the UDP stream would be even better]
 Hide all decorations? Or picture of just layer with nothing on top?
 */

@interface StreamDecorationsViewController ()

@property (strong, nonatomic) MethodManager *methodManager;

@property UIButton *enableGrid; // 08.11.20
@property UIButton *shutterButton; // 08.18.20
@property NSInteger gridCount;

// 08.18.20 Decorations
@property UIStackView *rowView; // view to remove or add 08.11.20
//@property UIStackView *columnView;
@property UILabel* displayValues;
@property UIImageView *screenShotView;

@property CGFloat screenHeight;
@property CGFloat screenWidth;

// 08.18.20 Used to change button view [camera vs red, etc]. Change the icon, or switcher for modes
typedef enum  { // current mode, to determine what arrays to call upon, or what views are necessary
    VIDEO = 0,
    PHOTO = 1,
    MULTI = 2
} CurrentMode;
@property(nonatomic) CurrentMode currentMode;

@end

@implementation StreamDecorationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Decorations page loaded");
    /*create a methodManager - use sharedDAO*/
    self.methodManager = [MethodManager sharedManager];
    /*check if it exists, and did not return empty/null*/
    NSLog(@"device is object %@", self.methodManager.deviceCurrent);
    
    self.view.backgroundColor = [UIColor grayColor];
    self.screenHeight = self.view.bounds.size.height;
    self.screenWidth = self.view.bounds.size.width;
    
    [self createGridButton];
    [self createShutterButton];
    [self createValueLabel];
}

-(int) checkMode { // for other cameras, this will most likely have to change 08.13.20
    [self.methodManager.deviceCurrent.heroDAO splitJSON];
    // since this takes too long, button needs to be pressed twice.
    
    //    NSLog(@"Current mode is %d",self.currentMode);
    
    if ([self.methodManager.deviceCurrent.heroDAO.currentMode isEqualToString:@"Video"]) {
        self.displayValues.text = @"Video";
        return VIDEO;
    }
    if ([self.methodManager.deviceCurrent.heroDAO.currentMode isEqualToString:@"Photo"]) {
        self.displayValues.text = @"Photo";
        return PHOTO;
    }
    if ([self.methodManager.deviceCurrent.heroDAO.currentMode isEqualToString:@"MultiShot"]) {
        self.displayValues.text = @"MultiShot";
        return MULTI;
    }
    self.displayValues.text = @"UNSURE";
    return VIDEO;
}


-(void)createValueLabel {
    UILabel *valueLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, 400, 40)];
    valueLabel.backgroundColor = [UIColor redColor];
    valueLabel.text = @"unassigned?";
    [self.methodManager.deviceCurrent.heroDAO getVideoResolution];
    //    [valueLabel setText:textForLabel];
    self.displayValues = valueLabel;
    self.currentMode = [self checkMode]; // will assign the text of the label as per value
    [[self view] addSubview:self.displayValues];
}

-(void)createLineForGrid {
    self.currentMode = [self checkMode]; // will assign the text of the label as per value
    
    // remove the view
    [self.rowView removeFromSuperview];
    
    if (self.gridCount > 5) { //|| self.gridCount == 0) {
        self.gridCount = 0;
    }
    self.gridCount += 1;
    
    // change the gridCount value and label for button
    NSInteger n = self.gridCount;
    NSString *labelForGridButton = [NSString stringWithFormat:@"GRID %ld", (long)n];
    [self.enableGrid setTitle:labelForGridButton forState:UIControlStateNormal];
    //    NSLog(@"User chose %ld for the grid",(long)n);
    
    UIStackView *rowView = [[UIStackView alloc] init];
    rowView.translatesAutoresizingMaskIntoConstraints = false;
    rowView.axis = UILayoutConstraintAxisHorizontal;
    rowView.distribution = UIStackViewDistributionFillEqually;
    rowView.userInteractionEnabled = false;
    self.rowView = rowView;
    [self.view addSubview:self.rowView];
    
    for (NSInteger row = 0; row < n; row++) {
        UIStackView *columnView = [[UIStackView alloc] init];
        columnView.translatesAutoresizingMaskIntoConstraints = false;
        columnView.axis = UILayoutConstraintAxisVertical;
        columnView.distribution = UIStackViewDistributionFillEqually;
        
        [rowView addArrangedSubview:columnView];
        for (NSInteger col = 0; col < n; col++) {
            UIView *view = [[UIView alloc] init];
            //            view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0
            //                                                   green:arc4random_uniform(256) / 255.0
            //                                                    blue:arc4random_uniform(256) / 255.0
            //                                                   alpha:1.0];
            view.backgroundColor = [UIColor clearColor];
            view.translatesAutoresizingMaskIntoConstraints = false;
            view.layer.borderColor = [UIColor blackColor].CGColor;
            view.layer.borderWidth = 0.5;
            view.userInteractionEnabled = false;
            [columnView addArrangedSubview:view];
            
            // make it it the width of the column stack view, and 1/n of the height of the column stack view
            
            [columnView addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth  relatedBy:NSLayoutRelationEqual toItem:columnView attribute:NSLayoutAttributeWidth  multiplier:1 constant:0]];
            [columnView addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:columnView attribute:NSLayoutAttributeHeight multiplier:1.0 / (CGFloat)n constant:0]];
            
        }
    }
    
    // make it square
    
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rowView attribute:NSLayoutAttributeWidth  relatedBy:NSLayoutRelationEqual toItem:rowView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
    
    // center it
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rowView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rowView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    // ensure it never exceeds 80% of the width or height of super view
    
    NSLayoutConstraint *maxWidthConstraint  = [NSLayoutConstraint constraintWithItem:rowView attribute:NSLayoutAttributeWidth  relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeWidth  multiplier:1 constant:0];
    NSLayoutConstraint *maxHeightConstraint = [NSLayoutConstraint constraintWithItem:rowView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    [self.view addConstraints:@[maxWidthConstraint, maxHeightConstraint]];
    
    // But have it take up 80% of either the width or height of super view
    
    NSLayoutConstraint *preferredWidthConstraint  = [NSLayoutConstraint constraintWithItem:rowView attribute:NSLayoutAttributeWidth  relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth  multiplier:1 constant:0];
    preferredWidthConstraint.priority = 900;
    NSLayoutConstraint *preferredHeightConstraint = [NSLayoutConstraint constraintWithItem:rowView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    preferredHeightConstraint.priority = 900;
    [self.view addConstraints:@[preferredWidthConstraint, preferredHeightConstraint]];
}

- (void)createShutterButton {
    UIButton *shutterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [shutterButton addTarget:self
                   action:@selector(shutterButtonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
    [shutterButton setTitle:@"SHUTTER" forState:UIControlStateNormal];
    // currently hardcoded
    shutterButton.frame = CGRectMake(self.screenWidth-(self.screenWidth/3), (self.screenHeight/2)-20.0, self.screenWidth/3, 40.0);
    shutterButton.backgroundColor = [UIColor greenColor];
    self.shutterButton = shutterButton;
    [self.view addSubview:self.shutterButton];
}

-(void)shutterButtonPressed:(UIButton *)submitShutter {
    if (self.methodManager.shootingCurrently == YES) { // if currently shooting, stop and reset
        self.shutterButton.backgroundColor = [UIColor greenColor];
        self.methodManager.shootingCurrently = NO;
        [self showAllDecorations];
        [self.screenShotView setHidden:YES];
        [self.shutterButton setTitle:@"SHUTTER" forState:UIControlStateNormal];
        
        return;
    } //otherwise, start shooting, hide all and show screenshot
    [self hideAllDecorations];
    [self showScreenShot];
    self.shutterButton.backgroundColor = [UIColor purpleColor];
    self.methodManager.shootingCurrently = YES;
    [self.shutterButton setTitle:@"SHOOTING" forState:UIControlStateNormal];
}


- (void)createGridButton {
    UIButton *enableGrid = [UIButton buttonWithType:UIButtonTypeCustom];
    [enableGrid addTarget:self
                   action:@selector(gridButtonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
    [enableGrid setTitle:@"GRID" forState:UIControlStateNormal];
    // currently hardcoded
    enableGrid.frame = CGRectMake(0.0, (self.screenHeight/12)*11, self.screenWidth/3, 40.0);
    enableGrid.backgroundColor = [UIColor redColor];
    self.enableGrid = enableGrid;
    [self.view addSubview:self.enableGrid];
}

-(void)gridButtonPressed:(UIButton *)submitGridCode {
//    NSLog(@"test pressed");
    self.enableGrid.backgroundColor = [UIColor redColor];
    if (self.gridCount%2 == 0) { // for shits and giggles and see the change happen 08.18.20
        self.enableGrid.backgroundColor = [UIColor blueColor];
    }
    [self createLineForGrid];
    [self showScreenShot];
    //    [self hideAllDecorations]; // testing 08.17.20 // works 08.18.20
}

- (void) showScreenShot {
    // hide all decorations and capture screen [or pull image from correct layer] TODO 08.18.20
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    CGRect rect = [keyWindow bounds];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [keyWindow.layer renderInContext:context];
    UIImage *screenShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();// ?
    
    /*08.17.20 if you want to save the image to camera roll - quality is low. Fix that if necessary*/
    //    UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
    int portionHeight = self.screenHeight/3;
    int portionWidth = self.screenWidth/3;
    
    UIImageView *myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.screenWidth-portionWidth, self.screenHeight-portionHeight, portionWidth, portionHeight)];
    myImageView.image = screenShot;
    self.screenShotView = myImageView;
    [self.view addSubview:self.screenShotView];
}

-(void)hideAllDecorations {
    [self.displayValues setHidden:YES];
    [self.enableGrid setHidden:YES];
}

-(void)showAllDecorations {
    [self.displayValues setHidden:NO];
    [self.enableGrid setHidden:NO];
}

@end
