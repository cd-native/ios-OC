//
//  VideoPlayer.h
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/26.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "AVFoundation/AVFoundation.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
// 对外 需要一个方法，播放的url 和 将播放器存放的位置
@interface VideoPlayer : NSObject

- (void)playVideoWithUrl:(NSString*)videoUrl attachView:(UIView*)view;
+ (VideoPlayer*)Play;

@end

NS_ASSUME_NONNULL_END
