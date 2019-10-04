//
//  VideoCollectionViewCell.m
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/25.
//  Copyright © 2019 杨崇多. All rights reserved.
//
// cell 专门做ui的parent 组装局部ui 为一个整体的大的ui

#import <UIKit/UIKit.h>
#import "VideoCollectionViewCell.h"
// 专门 做是 框架才可以 使用 视频提供的
#import "AVFoundation/AVFoundation.h"
#import "VideoPlayer.h"
#import "ToolBar.h"

/*
 只做展示功能，调用VideoPlayer实现播放
 */
@interface VideoCollectionViewCell ()

@property (strong, readwrite, nonatomic) UIImageView *coverUIImage;
@property (strong, readwrite, nonatomic) UIImageView *btnUIImage;
@property (strong, readwrite, nonatomic) NSString *videoUrl;
@property (strong, readwrite, nonatomic) ToolBar *toolBar;

@end

@implementation VideoCollectionViewCell

// 初始化的时候进行 渲染页面
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverUIImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,frame.size.width, frame.size.height-GTVideoToolbarHeight)];
            _coverUIImage;
        })];
        [_coverUIImage addSubview:({
            _btnUIImage = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50) / 2, (frame.size.height - 50-GTVideoToolbarHeight) / 2, 50, 50)];
            _btnUIImage.image = [UIImage imageNamed:@"icon.bundle/videoPlay@3x.png"];
            _btnUIImage;
        })];

//      我们要在初始化的时候就将 toolBar
        [self addSubview:({
//            frame 是外部传过来的
            _toolBar = [[ToolBar alloc] initWithFrame:CGRectMake(0, _coverUIImage.bounds.size.height, frame.size.width, GTVideoToolbarHeight)];
            _toolBar;
        })];

        UITapGestureRecognizer *tabGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_payBtn)];
        [self addGestureRecognizer:tabGesture];
    }
    return self;
}

#pragma- public methods

// 这边的数据统一从Controller里面获取，Controller是从网络获取的
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
    _coverUIImage.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
    [_toolBar layoutWithModel:nil];
}

#pragma- private methods
- (void)_payBtn {
    [[VideoPlayer Play] playVideoWithUrl:_videoUrl attachView:_coverUIImage];
}

@end
