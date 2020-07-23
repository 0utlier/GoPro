//
//  StreamViewController.m
//  GoProApp
//
//  Created by JD Leonard on 7/2/18.
//  Copyright © 2018 JD Leonard. All rights reserved.
//

#import "StreamViewController.h"

/* // CHECK me out 07.22.20 https://cocoapods.org/pods/CocoaAsyncSocket*/
@interface StreamViewController ()

@end

@implementation StreamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updatedVideoStream];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updatedVideoStream {
//    NSURL *videoURL = [NSURL URLWithString:@"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
//    NSURL *videoURL = [NSURL URLWithString:@"http://10.5.5.9/gp/gpControl/execute?p1=gpStream&a1=proto_v2&c1=restart"];
    NSURL *videoURL = [NSURL URLWithString:@"udp://10.5.5.9:8554"];
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:playerLayer];
    [player play];
}

-(void)tryMe {
    NSURL *videoURL = [NSURL URLWithString:@"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerViewController *playerViewController = [AVPlayerViewController new];
    playerViewController.player = player;
    [self presentViewController:playerViewController animated:YES completion:nil];
}

/*// untested 07.22.20
 -(void)attemptJulyTwentyTwenty {
 GCDAsyncUdpSocket *udpSocket;
 udpSocket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
 NSData *data = [@"initialize" dataUsingEncoding:NSUTF8StringEncoding];
 [udpSocket sendData:data toHost:@"127.0.0.1" port:5000 withTimeout:-1 tag:1];
 NSError *error = nil;
 
 if (![udpSocket bindToPort:0 error:&error])
 {
 NSLog(@"Error binding: %@", [error description]);
 return;
 }
 if (![udpSocket beginReceiving:&error])
 {
 NSLog(@"Error receiving: %@", [error description]);
 return;
 }
 
 To repeatetly send the initialiszation I used a timer initlilzieServer containes the code above):
 
 timer = [NSTimer scheduledTimerWithTimeInterval:150
 target:self
 selector:@selector(initializeServer)
 userInfo:nil
 repeats:YES];
 
 And then I do the processing of the responses in this class:
 
 - (void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data fromAddress:(NSData *)address withFilterContext:(id)filterContext
 {
 NSString *msg = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
 if (msg)
 {
 NSLog(@"%@",msg);
 
 }
 else
 {
 NSString *host = nil;
 uint16_t port = 0;
 [GCDAsyncUdpSocket getHost:&host port:&port fromAddress:address];
 
 NSLog(@"Unknown Message: %@:%hu", host, port);
 }
 }
 }*/

/*
-(void)createVideoPlayer {
    NSString *videoURLString = @"http://path-to-iphone-compliant-video-stream";
    NSURL *videoURL = [NSURL URLWithString:videoURLString];
    MPMoviePlayerController moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
    [moviePlayer prepareToPlay];
    [moviePlayer play];
    [self.view addSubview:moviePlayer.view];
}

-(void)createVPOther {
    NSString *videoURLString = @"http://path-to-iphone-compliant-video-stream";
    NSURL *videoURL = [NSURL URLWithString:videoURLString];
    MPMoviePlayerViewController *moviePlayerView = [[[MPMoviePlayerViewController alloc] initWithContentURL:videoURL] autorelease];
    [self presentMoviePlayerViewControllerAnimated:moviePlayerView];
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
