//
//  OptionsTVVC.m
//  GoProApp
//
//  Created by JDSL on 11/24/18.
//  Copyright © 2018 JD Leonard. All rights reserved.
//

#import "OptionsTVVC.h"

@interface OptionsTVVC ()

// MethodManager property
@property (strong, nonatomic) MethodManager *methodManager;
// Settings Array to use throughout page
@property (strong, nonatomic) NSMutableArray *currentSettingsArray;

@end

@implementation OptionsTVVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // create method manager
    self.methodManager = [MethodManager sharedManager];
    // set delegate for collection view to self
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // assign array to be used from DAO
    self.currentSettingsArray = self.methodManager.deviceCurrent.heroDAO.currentSettingsArray;
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    
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
    
    // Configure the cell
    UILabel *lbl = [[UILabel alloc] initWithFrame:[[cell contentView] frame]];
    [lbl setTextColor:[UIColor blackColor]];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    SettingsObject *objectAtIndex = [self.currentSettingsArray objectAtIndex:indexPath.row];
    [lbl setText:[NSString stringWithFormat:@"%@", objectAtIndex.title]];
    
    [cell addSubview:lbl];
    
    if ([objectAtIndex.paramType containsString:@"Binary"]) {
        UILabel *lbl = [[UILabel alloc] initWithFrame:[[cell contentView] frame]];
        [lbl setTextColor:[UIColor blueColor]];
        [lbl setTextAlignment:NSTextAlignmentLeft];
        SettingsObject *objectAtIndex = [self.currentSettingsArray objectAtIndex:indexPath.row];
        [lbl setText:[NSString stringWithFormat:@"%d", objectAtIndex.switchStatus]];
        
        [cell addSubview:lbl];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SettingsObject *objectAtIndex = [self.currentSettingsArray objectAtIndex:indexPath.row];
    NSLog(@"User selected %@, %@", objectAtIndex.title, objectAtIndex.value);
    // call upon proper "available arrays" and check off one that is current settings.
    // present in table view format and use selection to make call to the gopro
    NSLog(@"%@", [self.methodManager.deviceCurrent.heroDAO showAvailableArray:objectAtIndex.title]);
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
