//
//  VideoPlayer.m
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/26.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "VideoPlayer.h"

@interface VideoPlayer()

//@property(strong,readwrite,nonatomic)UIImageView* coverUIImage;
//@property(strong,readwrite,nonatomic)UIImageView* btnUIImage;
//@property(strong,readwrite,nonatomic)NSString* videoUrl;


@property(strong,readwrite,nonatomic)AVPlayerItem* avPlayerItem;
@property(strong,readwrite,nonatomic)AVPlayer* avPlayer;
@property(strong,readwrite,nonatomic)AVPlayerLayer* avPlayerLayer;

@end
/**
 主要是为了能够实现播放
 */
@implementation VideoPlayer

// 静态方法
+  (VideoPlayer*)Play{
//    只会执行一次
//    这是单例模式
    static VideoPlayer* videoPlayer;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         videoPlayer= [[VideoPlayer alloc] init];
    });
    return videoPlayer;
}

- (void)playVideoWithUrl:(NSString*)videoUrl attachView:(UIView*)view{
    NSLog(@"test");
    [self _stopPlay];
    NSURL* _videoUrl =  [NSURL URLWithString:videoUrl];
    AVAsset* videoAsset = [AVAsset assetWithURL:_videoUrl];
    //  播放属性 播放状态
    _avPlayerItem= [AVPlayerItem playerItemWithAsset:videoAsset];
    
    [_avPlayerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [_avPlayerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
    _avPlayer =  [AVPlayer  playerWithPlayerItem:_avPlayerItem];
    //    1分钟1次回调播放状态
    [_avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        //       不知道这个作用是什么@()
        NSLog(@"CMTimeGetSeconds(time)=%@",@(CMTimeGetSeconds(time)));
    }];
    _avPlayerLayer  =  [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    _avPlayerLayer.frame =view.bounds;
    //    layer:层
    [view.layer addSublayer:_avPlayerLayer];
    
//  播放结束
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_didPlay) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    // 是否能够达到 播放状态
    if ([keyPath isEqualToString:@"status"]) {
        // integerValue
        if (((NSNumber*)[change objectForKey: NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay) {
            [_avPlayer play];
        };
    }else if ([keyPath isEqualToString:@"loadedTimeRanges"]){
        NSLog(@"loadedTimeRanges=%@",[change objectForKey:NSKeyValueChangeNewKey]);
    }
}
//  停止播放
- (void)_stopPlay{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_avPlayerItem  removeObserver:self forKeyPath:@"status"];
    [_avPlayerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    
    [_avPlayerLayer removeFromSuperlayer];
    _avPlayerItem = nil;
    _avPlayer = nil;
}
// 
- (void)_didPlay{
    [_avPlayer seekToTime:CMTimeMake(0, 1)];
    [_avPlayer play];
}

@end
