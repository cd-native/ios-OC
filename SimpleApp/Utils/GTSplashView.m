//
//  GTSplashView.m
//  SimpleApp
//
//  Created by 杨崇多 on 2019/10/4.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "GTSplashView.h"
#import "GTScreen.h"


/**
 闪屏逻辑
 */
@interface GTSplashView()

@property(nonatomic, strong, readwrite)UIButton *button;

@end


@implementation GTSplashView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.image= [UIImage imageNamed:@"icon.bundle/splash.png"];
        [self addSubview:({
            _button = [[UIButton alloc] initWithFrame:UIRect(330,100,60,40)];
            _button.backgroundColor = [UIColor lightGrayColor];
            [_button setTitle:@"跳过" forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(_removeSplashView) forControlEvents:UIControlEventTouchUpInside];
            _button;
        })];
//        因为闪屏是一个 uiimageview，所以要支持点击
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)_removeSplashView{
//   从父级移除自己
    [self removeFromSuperview];
}

@end
