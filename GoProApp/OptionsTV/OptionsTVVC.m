//
//  OptionsTVVC.m
//  GoProApp
//
//  Created by JDSL on 11/24/18.
//  Copyright © 2018 JD Leonard. All rights reserved.
//

#import "OptionsTVVC.h"

/*Options TableView Controller meant for displaying all available options for the GoPro and giving option to change given option (e.g. Mode, SubMode, MP=12 >> MP=7 >> makes call via DAO)*/

@interface OptionsTVVC ()

// MethodManager property
@property (strong, nonatomic) MethodManager *methodManager;
// Settings Array to use throughout current page [assigned values from DAO's version for simpler code]
@property (strong, nonatomic) NSMutableArray *currentSettingsArray;

@end

@implementation OptionsTVVC

/*TODO 07.18.20 refresh tableview once returned to this page. Currently reloadData duplicates the information. Need to clear the contents and reload it
 07.18.20 add switches for binary options*/

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Options tableview loaded");

    // create method manager
    self.methodManager = [MethodManager sharedManager];
    // set delegate for collection view to self
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // assign array to be used from DAO
    self.currentSettingsArray = self.methodManager.deviceCurrent.heroDAO.currentSettingsArray;
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.view.backgroundColor = [UIColor blackColor];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.currentSettingsArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OptionsTVC" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];

    // Configure the cell
    UILabel *labelTitle = [[UILabel alloc] initWithFrame:[[cell contentView] frame]];
    [labelTitle setBackgroundColor:[UIColor blackColor]];
    [labelTitle setTextColor:[UIColor yellowColor]];
    [labelTitle setTextAlignment:NSTextAlignmentCenter];
    SettingsObject *objectAtIndex = [self.currentSettingsArray objectAtIndex:indexPath.row];
    [labelTitle setText:[NSString stringWithFormat:@"%@ = %@", objectAtIndex.title, objectAtIndex.value]];
    
    [cell addSubview:labelTitle];
    // if a binary setting, display its binary value on the left side
    if ([objectAtIndex.paramType containsString:@"Binary"]) {
        UILabel *labelBinary = [[UILabel alloc] initWithFrame:[[cell contentView] frame]];
        [labelBinary setTextColor:[UIColor blueColor]];
        [labelBinary setTextAlignment:NSTextAlignmentLeft];
        SettingsObject *objectAtIndex = [self.currentSettingsArray objectAtIndex:indexPath.row];
        [labelBinary setText:[NSString stringWithFormat:@"%d", objectAtIndex.switchStatus]];
        
        [cell addSubview:labelBinary];
    }
    
    return cell;
}

// once selected, open tableView of values for options 07.11.20
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //  NSLog(@"did select goes");
    // assign object to currentSettings
    SettingsObject *objectAtIndex = [self.currentSettingsArray objectAtIndex:indexPath.row];
    NSLog(@"User selected %@, %@", objectAtIndex.title, objectAtIndex.value);
    // if a Binary setting, no need to show a page of options. Will be switches at one point 07.18.20
    if ([objectAtIndex.paramType containsString:@"Binary"]) {
        NSLog(@"%@ is BINARY, with status %d - TODO update the cell text and binary switch", objectAtIndex.title, objectAtIndex.switchStatus);
        // insert binary function here
        [self.methodManager.deviceCurrent.heroDAO switchStatusForObject:objectAtIndex];
        return;
    }
    // call upon proper "available arrays" and check off one that is current settings.
    // present in table view format and use selection to make call to the gopro
    NSMutableArray *availableList = ([self.methodManager.deviceCurrent.heroDAO showAvailableArray:objectAtIndex.title]);
    NSLog(@"Table should show: %@", [availableList valueForKey:@"value"]); // changed using the property
    self.methodManager.deviceCurrent.heroDAO.currentValuesArray = availableList;
//    NSLog(@"TEST for MM CurrentValues %@",self.methodManager.deviceCurrent.heroDAO.currentValuesArray);

    //        [self dismissViewControllerAnimated:NO completion:nil];
    // using storyBoard to open ValuesTVVC
    [self performSegueWithIdentifier:@"showMe" sender:indexPath];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"segue selected");


//    NSIndexPath *path = sender;
//    SettingsObject *objectAtIndex = [self.currentSettingsArray objectAtIndex:path.row];
//    NSLog(@"path for segue is %@", objectAtIndex.title);
    UIViewController *settingsController = (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"ValuesTVVC"];
//    [settingsController.view setFrame:CGRectMake(self.navigationController.view.frame.origin.x,
//                                       [UIApplication sharedApplication].statusBarFrame.size.height, self.navigationController.view.frame.size.width, [[UIScreen mainScreen] bounds].size.height-[UIApplication sharedApplication].statusBarFrame.size.height)];
    settingsController = segue.destinationViewController;

}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
