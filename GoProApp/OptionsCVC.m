//
//  OptionsCVC.m
//  GoProApp
//
//  Created by JDSL on 11/24/18.
//  Copyright © 2018 JD Leonard. All rights reserved.
//

#import "OptionsCVC.h"
#import "OptionsCVCCell.h"

@interface OptionsCVC ()

// MethodManager property
@property (strong, nonatomic) MethodManager *methodManager;
// Settings Array to use throughout page
@property (strong, nonatomic) NSMutableArray *currentSettingsArray;

@end

@implementation OptionsCVC

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // create method manager
    self.methodManager = [MethodManager sharedManager];
    // set delegate for collection view to self
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    // assign array to be used from DAO
    self.currentSettingsArray = self.methodManager.deviceCurrent.heroDAO.currentSettingsArray;
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
    return [self.currentSettingsArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        OptionsCVCCell *cell = (OptionsCVCCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"OptionsCustomCell" forIndexPath:indexPath];
    
    // Configure the cell
    UILabel *lbl = [[UILabel alloc] initWithFrame:[[cell contentView] frame]];
    [lbl setTextColor:[UIColor blackColor]];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    SettingsObject *objectAtIndex = [self.currentSettingsArray objectAtIndex:indexPath.row];
    [lbl setText:[NSString stringWithFormat:@"%@", objectAtIndex.title]];
    
    [cell addSubview:lbl];
//    cell.frame.size.width = [UIScreen mainScreen].bounds.size.width;
    return cell;
}

// this method overrides the changes you have made to inc or dec the size of cell using storyboard.
- (CGSize)collectionView:(UICollectionView *)collectionView layout:   (UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
//    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    return CGSizeMake(width, 50);
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/


// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"value of indexpath = %@", indexPath);
    NSLog(@"value of row = %ld", (long)indexPath.row);

    SettingsObject *objectAtIndex = [self.currentSettingsArray objectAtIndex:indexPath.row];
    NSLog(@"User selected %@", [NSString stringWithFormat:@"%@", objectAtIndex.title]);
    /*for (SettingsObject *settingsObject in self.currentSettingsArray) {
     if ([settingsObject.title isEqualToString:[[self.currentSettingsArray objectAtIndex:indexPath.row]title]]) {
     NSLog(@"User chose %@", settingsObject.title);
     }
     }*/
    return YES;
}


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
