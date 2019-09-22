//
//  NormalTableViewCell.h
//  用户界面
//
//  Created by 杨崇多 on 2019/9/20.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NormalTableViewProtpcol <NSObject>

- (void)tableViewCell: (UITableViewCell*) tableViewCell clickDelButton:(UIButton*) delButton;

@end

NS_ASSUME_NONNULL_BEGIN

@interface NormalTableViewCell : UITableViewCell

@property (nonatomic,weak,readwrite) id<NormalTableViewProtpcol> delegate;

// 标题 来源 评论 时间
@property (nonatomic,strong,readwrite) UILabel* titleLable;
@property (nonatomic,strong,readwrite) UILabel* sourceLable;
@property (nonatomic,strong,readwrite) UILabel* commentLable;
@property (nonatomic,strong,readwrite) UILabel*  timeLable;
@property (nonatomic,strong,readwrite) UIImageView* rightImageView;
@property (nonatomic,strong,readwrite) UIButton* delButton;

- (void)delButtonClick;
- (void)layoutText;

@end

NS_ASSUME_NONNULL_END
