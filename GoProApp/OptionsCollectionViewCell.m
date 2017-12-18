//
//  OptionsCollectionViewCell.m
//  GoProApp
//
//  Created by JD Leonard on 12/14/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "OptionsCollectionViewCell.h"

@implementation OptionsCollectionViewCell

-(void)awakeFromNib {
    // should start at grey and then highlight color for given OPTION type
    self.backgroundColor = [UIColor orangeColor];
    self.textLabel.textColor = [UIColor blackColor];
    
}

@end
