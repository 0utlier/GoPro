//
//  Hero4.m
//  GoProApp
//
//  Created by JD Leonard on 10/29/17.
//  Copyright © 2017 JD Leonard. All rights reserved.
//

#import "Hero4.h"

@implementation Hero4

#pragma mark - URL HANDLING

- (void)sendDeviceCall {
    NSURL *url = [[NSURL alloc]initWithString:self.urlForCurrentCall];
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



#pragma mark - POWER


- (void)powerDeviceOff {
//    NSURL *url = [[NSURL alloc]initWithString:@"http://10.5.5.9/bacpac/PW?t=inbinary&p=%00"];
    NSURL *url = [[NSURL alloc]initWithString:@"http://10.5.5.9/gp/gpControl/command/system/sleep"];
    //type your URL you can use initWithFormat for placeholders
    NSURLSession *session = [NSURLSession sharedSession];  //use NSURLSession class
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    //You then can use NSURLSessionDownloadTask or NSURLSessionUploadTask
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        //note that your requested data are stored on the disk automatic
        // if u need to retrieve your data use the location parameter not the response parameter
        //as it stores the location of ur retrieved data that was saved on the disk
        //works asynchronously i think
    }];
    [task resume]; // to start the download task

}
#pragma mark - SHUTTER
#pragma mark - MODE
#pragma mark - SUB MODE
#pragma mark - RESOLUTION
#pragma mark - FRAME RATE

/*
 POST HTTP
 NSURL *url = [[NSURL alloc]initWithString:@"http://10.5.5.9/bacpac/PW?t=inbinary&p=%00"];
 //type your URL you can use initWithFormat for placeholders
 NSURLSession *session = [NSURLSession sharedSession];  //use NSURLSession class
 NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
 //You then can use NSURLSessionDownloadTask or NSURLSessionUploadTask
 
 NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
 //note that your requested data are stored on the disk automatic
 // if u need to retrieve your data use the location parameter not the response parameter
 //as it stores the location of ur retrieved data that was saved on the disk
 //works asynchronously i think
 }];
 [task resume]; // to start the download task
 
 */

/*
 GET HTTP
 For POST Requests same thing but use NSMutableURLRequest instead of NSURLRequest and then set your Method to POST
 
 NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:url];
 request.HTTPMethod = @"POST";
 */

/*
 MODES:
 (Primary modes:)
 
 Video: http://10.5.5.9/gp/gpControl/command/mode?p=0
 Photo: http://10.5.5.9/gp/gpControl/command/mode?p=1
 MultiShot: http://10.5.5.9/gp/gpControl/command/mode?p=2

 SUB MODES:
 Secondary modes:
 
 Video (VIDEO): http://10.5.5.9/gp/gpControl/command/sub_mode?mode=0&sub_mode=0
 TimeLapse Video (VIDEO): http://10.5.5.9/gp/gpControl/command/sub_mode?mode=0&sub_mode=1
 Video + Photo (VIDEO): http://10.5.5.9/gp/gpControl/command/sub_mode?mode=0&sub_mode=2
 Looping (VIDEO): http://10.5.5.9/gp/gpControl/command/sub_mode?mode=0&sub_mode=3
 Single (PHOTO): http://10.5.5.9/gp/gpControl/command/sub_mode?mode=1&sub_mode=0
 Continuous (PHOTO): http://10.5.5.9/gp/gpControl/command/sub_mode?mode=1&sub_mode=1
 Night (PHOTO): http://10.5.5.9/gp/gpControl/command/sub_mode?mode=1&sub_mode=2
 Burst (MultiShot): http://10.5.5.9/gp/gpControl/command/sub_mode?mode=2&sub_mode=0
 Timelapse (MultiShot): http://10.5.5.9/gp/gpControl/command/sub_mode?mode=2&sub_mode=1
 NightLapse (MultiShot): http://10.5.5.9/gp/gpControl/command/sub_mode?mode=2&sub_mode=2

 */
@end
