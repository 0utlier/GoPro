//
//  OptionsCollectionViewController.m
//  GoProApp
//
//  Created by JD Leonard on 12/14/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "OptionsCollectionViewController.h"
#import "OptionsCollectionViewCell.h"

// this is the page to use as the options available for the current device's settings (ie rsolution, FPS...)
/*NOTHING GETS STORED HERE. ONLY ASSIGNED*/
@interface OptionsCollectionViewController ()

@property (strong, nonatomic) MethodManager *methodManager;

@end

@implementation OptionsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*create a methodManager - use sharedDAO*/
    self.methodManager = [MethodManager sharedManager];
    [self.methodManager assignDeviceManager:NULL];
    /*check if it exists, and did not return empty/null*/
    NSLog(@"device is object %@", self.methodManager.deviceCurrent);
    
    /**Please remove this ASAP, as it is HARDCODE**/
    /*This is where the assignment comes in*/
    self.optionsAvailableForDevice = self.methodManager.deviceCurrent.heroDAO.availableFrameRates;
//    self.optionsAvailableForDevice = self.methodManager.deviceCurrent.heroDAO.availableModes;
    
    /*set which options Type is being requested*/
    NSLog(@"Options Page Loading for %@", self.optionsAvailableForDevice);
//    NSLog(@"Options Page Loading for %@", self.optionsAvailableForDevice);
    
    /*assign buttons to correct OPTION (i.e. modes,subModes,FR, Res) */
//    [self createButtons];
    
    self.methodManager.desiredOptions = self.optionsAvailableForDevice;
	   

    
    // FOLLOWING is specific to CollectionView:
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
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


#pragma mark - COLLECTIONVIEW

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    NSUInteger arrayLength = self.optionsAvailableForDevice.count;
//    arrayLength -= 30;
    NSLog(@"Length of the array = %lu", (unsigned long)arrayLength);
    return arrayLength;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    OptionsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    
// assign the string by the current option being edited (eg frameRates, Modes)
    // use string to be textlabel for cell
    // assign the title as per the number of index AND frameRate array
    NSString *myString = [NSString stringWithFormat:@"%@", [self.optionsAvailableForDevice objectAtIndex:indexPath.row]];
    cell.textLabel.text = myString;
    

    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    OptionsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    /*print the quality selected*/
    NSString* printMe = [self.optionsAvailableForDevice objectAtIndex:indexPath.row];
    NSLog(@"The user has chosen %@", printMe);
}
#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
