//
//  StreamViewController.m
//  GoProApp
//
//  Created by JD Leonard on 7/2/18.
//  Copyright © 2018 JD Leonard. All rights reserved.
//

#import "StreamViewController.h"


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
