//
//  DleCellView.m
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/21.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "DelCellView.h"

// 类扩展 要放在 实现这个文件里面
@interface DelCellView ()

@property (nonatomic,readwrite,strong) UIView* backgroungView;
@property (nonatomic,readwrite,strong) UIButton* delButton;
@property (nonatomic,readwrite,copy) dispatch_block_t clickBlock;
@end

@implementation DelCellView

- (instancetype)initWithFrame:(CGRect)frame{
    self =  [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _backgroungView = [[UIView alloc] initWithFrame:self.bounds];
            _backgroungView.backgroundColor = [UIColor blackColor];
            _backgroungView.alpha = 0.5;
//           增加一个手势 也要将灰色的背景删除
            [_backgroungView addGestureRecognizer:({
                UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideDeleteView)];
                tapGesture;
            })];
            _backgroungView;
        })];
        
        [self addSubview:({
            _delButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            [_delButton addTarget:self action:@selector(_delClick) forControlEvents:   UIControlEventTouchUpInside];
            _delButton.backgroundColor = [UIColor greenColor];
            _delButton;
        })];
        
    }
    return self;
}

// 从点击的位置  展示，然后从
- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock{
    _delButton.frame= CGRectMake(point.x, point.y, 0, 0);
//    点击的时候持有这个block；
//    浅copy 地址的
    _clickBlock = [clickBlock copy];
//   最为普通的效果
//    [UIView animateWithDuration:1.f animations:^{
//        self.delButton.frame = CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
//    }];
    
//    _delButton.frame = CGMakeRect();
//    animateWithDuration 动画执行的时间
//    delay：延迟时间
//    options:<#(UIViewAnimationOptions)#> 类型 方式吧
//    animations 动画效果
//    completion 动画完成之后做什么是一个block
    [UIView animateWithDuration:1.f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.delButton.frame = CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
    } completion:^(BOOL finished) {
        NSLog(@"动画完成");
    }];
    
    [[UIApplication sharedApplication].keyWindow  addSubview:self];
}

- (void)hideDeleteView{
//   从父级 view 删除
    [self removeFromSuperview];
}

- (void)_delClick{
    NSLog(@"delClick");
    if (_clickBlock) {
        _clickBlock();
    }
//   尽管处理很多业务，最终还是要删除
    [self removeFromSuperview];
}
@end
