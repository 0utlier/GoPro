//
//  OptionAssignViewController.h
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionAssignViewController : UIViewController

@property (nonatomic, retain) NSString *optionsType; //which type of options (ie resolution, fps, etc.)
@property (nonatomic, retain) NSMutableArray *optionsAvailableForDevice; // assign to correct model's array of current settings


@end
