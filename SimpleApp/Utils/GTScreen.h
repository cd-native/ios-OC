//
//  GTScreen.h
//  SimpleApp
//
//  Created by 杨崇多 on 2019/10/4.
//  Copyright © 2019 杨崇多. All rights reserved.
//  适配方案： 写样式通过frame需要实现一些方法和进行适配 ，类似于reactnative 中的一个属性，具体忘记了
//  通过autolayout 横向方向是类似于 flex就行适配，纵向方向是可以通过 frame的方式一样
//


#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 宏要全部大写
#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))

#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen ] bounds].size.height : [[UIScreen mainScreen ] bounds].size.width)
#define SCREEN_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen ] bounds].size.width : [[UIScreen mainScreen ] bounds].size.height)

// 重命名两个宏
#define UI(x) UIAdapter(x)
#define UIRect(x,y,width,height) UIRectAdapter(x,y,width,height)

static inline NSInteger UIAdapter (float x){
    //1 - 分机型 特定的比例
    
    //2 - 屏幕宽度按比例适配
    CGFloat scale = 414 / SCREEN_WIDTH;
    return (NSInteger)x / scale;
}

//...完善其他方法..size..rect..origin..
static inline CGRect UIRectAdapter(x,y,width,height){
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
}

/**
 主要提供各种适配。类似于 javascript中的 px2rem
 */
@interface GTScreen : NSObject

@end

NS_ASSUME_NONNULL_END
