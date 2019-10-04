//
//  ToolBar.m
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/26.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "ToolBar.h"

/**
 视频下方展示
 */

@interface ToolBar ()

@property (nonatomic, strong, readwrite) UIImageView *avatorImageView;
@property (nonatomic, strong, readwrite) UILabel *nickLabel;

@property (nonatomic, strong, readwrite) UIImageView *commentImageView;
@property (nonatomic, strong, readwrite) UILabel *commentLabel;

@property (nonatomic, strong, readwrite) UIImageView *likeImageView;
@property (nonatomic, strong, readwrite) UILabel *likeLabel;

@property (nonatomic, strong, readwrite) UIImageView *shareImageView;
@property (nonatomic, strong, readwrite) UILabel *shareLabel;

@end

@implementation ToolBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        [self addSubview:({
            _avatorImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _avatorImageView.layer.masksToBounds = YES;
            _avatorImageView.layer.cornerRadius = 15;
            _avatorImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _avatorImageView;
        })];
        [self addSubview:({
            _nickLabel = [[UILabel alloc] init];
            _nickLabel.font = [UIFont systemFontOfSize:15];
            _nickLabel.textColor = [UIColor lightGrayColor];
            _nickLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _nickLabel;
        })];

        [self addSubview:({
            _commentImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _commentImageView.layer.masksToBounds = YES;
            _commentImageView.layer.cornerRadius = 15;
            _commentImageView.translatesAutoresizingMaskIntoConstraints = NO;

            _commentImageView;
        })];
        [self addSubview:({
            _commentLabel = [[UILabel alloc] init];
            _commentLabel.font = [UIFont systemFontOfSize:15];
            _commentLabel.textColor = [UIColor lightGrayColor];
            _commentLabel.translatesAutoresizingMaskIntoConstraints = NO;

            _commentLabel;
        })];

        [self addSubview:({
            _likeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _likeImageView.layer.masksToBounds = YES;
            _likeImageView.layer.cornerRadius = 15;
            _likeImageView.translatesAutoresizingMaskIntoConstraints = NO;

            _likeImageView;
        })];
        [self addSubview:({
            _likeLabel = [[UILabel alloc] init];
            _likeLabel.font = [UIFont systemFontOfSize:15];
            _likeLabel.textColor = [UIColor lightGrayColor];
            _likeLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _likeLabel;
        })];

        [self addSubview:({
            _shareImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _shareImageView.layer.masksToBounds = YES;
            _shareImageView.layer.cornerRadius = 15;
            _shareImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _shareImageView.contentMode = UIViewContentModeScaleToFill;
            _shareImageView;
        })];

        [self addSubview:({
            _shareLabel = [[UILabel alloc] init];
            _shareLabel.font = [UIFont systemFontOfSize:15];
            _shareLabel.textColor = [UIColor lightGrayColor];
            _shareLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _shareLabel;
        })];
    }
    return self;
}

#pragma public methods

- (void)layoutWithModel:(id)model {
//   通过model赋
    _avatorImageView.image = [UIImage imageNamed:@"icon.bundle/icon.png"];
    _nickLabel.text = @"极客时间";

    _commentImageView.image = [UIImage imageNamed:@"icon.bundle/comment@3x.png"];
    _commentLabel.text = @"100";

    _likeImageView.image = [UIImage imageNamed:@"icon.bundle/praise@3x.png"];
    _likeLabel.text = @"25";

    _shareImageView.image = [UIImage imageNamed:@"icon.bundle/share@3x.png"];
    _shareLabel.text = @"分享";
    //    Constraint： 约束
//
    [NSLayoutConstraint activateConstraints:@[
//                                              这里的self 就是 toolbar
//                                              上下的约束
         [NSLayoutConstraint constraintWithItem:_avatorImageView
                                      attribute:NSLayoutAttributeCenterY
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:self
                                      attribute:NSLayoutAttributeCenterY
                                     multiplier:1
                                       constant:0],
         [NSLayoutConstraint constraintWithItem:_avatorImageView
                                      attribute:NSLayoutAttributeLeft
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:self
                                      attribute:NSLayoutAttributeLeft
                                     multiplier:1
                                       constant:15],
//         设置宽度和高度
         [NSLayoutConstraint constraintWithItem:_avatorImageView
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                     multiplier:1
                                       constant:30],
     [NSLayoutConstraint constraintWithItem:_avatorImageView
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:1
                                   constant:30],

         [NSLayoutConstraint constraintWithItem:_nickLabel
                                      attribute:NSLayoutAttributeCenterY
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:_avatorImageView
                                      attribute:NSLayoutAttributeCenterY
                                     multiplier:1
                                       constant:0],
         [NSLayoutConstraint constraintWithItem:_nickLabel
                                      attribute:NSLayoutAttributeLeft
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:_avatorImageView
                                      attribute:NSLayoutAttributeRight
                                     multiplier:1
                                       constant:0]
    ]];
//    || 是父级元素
//   如果想要大小相同大小
//    看样子好像只可能是 横向布局无法纵向布局
    NSString *vlfString = @"H:|-15-[_avatorImageView]-0-[_nickLabel]-(>=0)-[_commentImageView(==_avatorImageView)]-0-[_commentLabel]-15-[_likeImageView(==_avatorImageView)]-0-[_likeLabel]-15-[_shareImageView(==_avatorImageView)]-0-[_shareLabel]-15-|";
//
    [NSLayoutConstraint activateConstraints:[

         NSLayoutConstraint constraintsWithVisualFormat:vlfString options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_avatorImageView, _nickLabel, _commentImageView,_commentLabel, _likeImageView,_likeLabel, _shareImageView, _shareLabel)
     ]];

//
//    views 书写字符串中的view对应字符串中的view 是什么
//    options 所有的都竖向的都居中
//    metrics 是可以替换字符串可变的变量，有点类似于JavaScript中的模板字符串
}

@end
