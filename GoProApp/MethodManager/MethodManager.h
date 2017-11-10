//
//  MethodManager.h
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hero4.h"
/* This is to store all of the apps required calls, properties and information needed everywhere in the app*/

@interface MethodManager : NSObject

//bools
@property (nonatomic)BOOL successCall; // successful or not (NO = 0 = NOT)

//devices

//calls

/*this is going to be assigned when the app starts, by the current device being set, so that the calls and available options are set when methodManager offers information*/
@property (nonatomic, strong) NSObject *dao;


@end
