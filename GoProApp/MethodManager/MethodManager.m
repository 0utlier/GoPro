//
//  MethodManager.m
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "MethodManager.h"


@implementation MethodManager


#pragma mark - Singleton Methods

/*
- (void)powerOn {
    [_heroDAO powerOn];
}

- (void)powerOff {
    [_heroDAO powerOff];
}

*/


+ (id)sharedManager {
    static MethodManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

#pragma mark - START UP

- (void)startUpApp {
    /*
     open app
     [check wifi]
     choose gopro
     [check gopro and assign object]
     opens view of gopro
     */
    //    NSObject *passThrough = [[NSObject alloc]init];
//    self.dao = [Hero4 sharedDAO];
//    [self.dao shared];

    
    if (/*device is Hero 4*/true) {
        /*set DAO to Hero 4*/
//        self.dao = [Hero4 sharedDAO];
        
    }
    else /*device is NOT Hero 4*/{
        /*set DAO to Hero 3 plus*/
    }
    
}

- (void)assignDeviceManager: (NSObject *)device/*(*UIViewController or whatever to pass in right one)*/ {
    //    self.dao = device;
    
    //    NSLog(@"%@"self.device.gppower)
}

#pragma mark - CALLS

#pragma mark - URL HANDLING

- (void)sendDeviceCall {
    /*ensure DAO is setup
     assign currentCall with DAO.'givenCallURL'
     make the call
     check the call
     assign BOOL to success/fail
     */
    NSString *urlForCurrentCall;
    NSURL *url = [[NSURL alloc]initWithString:urlForCurrentCall];
    //type your URL you can use initWithFormat for placeholders
    NSURLSession *session = [NSURLSession sharedSession];  //use NSURLSession class
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    //You then can use NSURLSessionDownloadTask or NSURLSessionUploadTask
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        //note that your requested data are stored on the disk automatic
        //if you need to retrieve your data use the location parameter not the response parameter
        //as it stores the location of ur retrieved data that was saved on the disk
        //works asynchronously i think
    }];
    [task resume]; // to start the download task
}



@end
