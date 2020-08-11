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
@interface StreamDecorationsViewController ()

@property (strong, nonatomic) MethodManager *methodManager;

@property UIButton *openToSettings; // testing purposes 08.11.20
@property UIStackView *rowView; // view to remove or add 08.11.20
//@property UIStackView *columnView;
@property NSInteger gridCount;
@property UILabel* displayValues;

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
    [self createTESTButton];
//    [self createLineForGrid:2];
}

-(void)createValueLabel {
    UILabel *valueLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 300, 400, 40)];
    valueLabel.backgroundColor = [UIColor redColor];
    ;
    //    [valueLabel setText:textForLabel];
    self.displayValues = valueLabel;
    [[self view] addSubview:self.displayValues];
}

-(void)createLineForGrid {
    
    // remove the view
    [self.rowView removeFromSuperview];
    
    if (self.gridCount > 5) { //|| self.gridCount == 0) {
        self.gridCount = 0; 
    }
    self.gridCount += 1;

    
    NSInteger n = self.gridCount;
    NSLog(@"User chose %ld for the grid",(long)n);

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

- (void)createTESTButton {
    UIButton *openToSettings = [UIButton buttonWithType:UIButtonTypeCustom];
    [openToSettings addTarget:self
                       action:@selector(testButtonPressed:)
             forControlEvents:UIControlEventTouchUpInside];
    [openToSettings setTitle:@"TEST" forState:UIControlStateNormal];
    openToSettings.frame = CGRectMake(80.0, 410.0, 160.0, 40.0);
    openToSettings.backgroundColor = [UIColor redColor];
    self.openToSettings = openToSettings;
    [self.view addSubview:self.openToSettings];
}

-(void)testButtonPressed:(UIButton *)submitTestCode {
    NSLog(@"test pressed");
    self.openToSettings.backgroundColor = [UIColor blueColor];
    [self createLineForGrid];
}

@end
