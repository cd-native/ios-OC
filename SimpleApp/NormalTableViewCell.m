//
//  NormalTableViewCell.m
//  用户界面
//
//  Created by 杨崇多 on 2019/9/20.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "NormalTableViewCell.h"

@implementation NormalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

// option +  command + /
/**
 <#Description#>

 @param selected <#selected description#>
 @param animated <#animated description#>
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 重写方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        @property (nonatomic,strong,readwrite) UILabel* titleLable;
//        @property (nonatomic,strong,readwrite) UILabel* sourceLable;
//        @property (nonatomic,strong,readwrite) UILabel* commentLable;
//        @property (nonatomic,strong)  UILabel*  timeLable;

        [self.contentView addSubview:({
            UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 400, 50)];
//            titleLable.backgroundColor =[UIColor grayColor];
            titleLable.font = [UIFont systemFontOfSize:16];
            titleLable.textColor = [UIColor darkGrayColor];
            self.titleLable = titleLable;
        })];
        [self.contentView addSubview:({
            UILabel *sourceLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 60, 30)];
//            sourceLable.backgroundColor = [UIColor redColor];
            sourceLable.font = [UIFont systemFontOfSize:12];
            sourceLable.textColor = [UIColor darkGrayColor];
            self.sourceLable = sourceLable;
        })];

        [self.contentView addSubview:({
            UILabel *commentLable = [[UILabel alloc] initWithFrame:CGRectMake(80, 70, 60, 30)];
//            commentLable.backgroundColor = [UIColor redColor];
            commentLable.font = [UIFont systemFontOfSize:12];
            commentLable.textColor = [UIColor darkGrayColor];
            self.commentLable = commentLable;
        })];

        [self.contentView addSubview:({
            UILabel *timeLable = [[UILabel alloc] initWithFrame:CGRectMake(150, 70, 60, 30)];
//            timeLable.backgroundColor = [UIColor redColor];
            timeLable.font = [UIFont systemFontOfSize:12];
            timeLable.textColor = [UIColor darkGrayColor];
            self.timeLable = timeLable;
        })];

        [self.contentView addSubview:({
            UIImageView *rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(330, 15, 60, 30)];
            //            先暂时先这样;
//            newImageView.backgroundColor = [UIColor redColor];
//            rightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightImageView = rightImageView;
        })];

        [self.contentView addSubview:({
            UIButton *delButton = [[UIButton alloc] initWithFrame:CGRectMake(330, 70, 80, 20)];

            [delButton setTitle:@"X" forState:UIControlStateNormal];
            [delButton setTitle:@"C" forState:UIControlStateHighlighted];

            delButton.backgroundColor = [UIColor  blueColor];
//            layer 是继承来自layer的
            delButton.layer.cornerRadius = 30;
            delButton.layer.masksToBounds = YES;
//[UIColor  lightGrayColor].CGColor;  不知道什么意思
            delButton.layer.borderColor = [UIColor  lightGrayColor].CGColor;
            delButton.layer.borderWidth = 2;
//         UIControlEventTouchUpInside 点击
            [delButton addTarget:self action:@selector(delButtonClick) forControlEvents:UIControlEventTouchUpInside];
//            timeLable.font = [UIFont systemFontOfSize:12];
//            timeLable.textColor = [UIColor darkGrayColor];
            self.delButton = delButton;
        })];

//        UITapGestureRecognizer* tapGesture = [UITapGestureRecognizer alloc] initWithTarget:<#(nullable id)#> action:<#(nullable SEL)#>
//    [[UILabel alloc]initWithFrame:CGRectMake(20,64,100,30 )];
    }
    return self;
}

- (void)layoutText {
    NSLog(@"layoutText");
//   设置文案 设置字体 设置自适应间距
    //    @property (nonatomic,strong,readwrite) UILabel* titleLable;
    //        @property (nonatomic,strong,readwrite) UILabel* sourceLable;
    //        @property (nonatomic,strong,readwrite) UILabel* commentLable;
    //        @property (nonatomic,strong)  UILabel*  timeLable;
    self.titleLable.text = @"北京欢迎你";
//    [self.titleLable sizeToFit];

    self.sourceLable.text = @"北京欢迎你1testtetss";
    [self.sourceLable sizeToFit];

    self.commentLable.text = @"真好2323";
    [self.commentLable sizeToFit];
//   frame 是位置
    self.commentLable.frame = CGRectMake(self.sourceLable.frame.origin.x + self.sourceLable.frame.size.width + 15, self.commentLable.frame.origin.y, self.commentLable.frame.size.width, self.commentLable.frame.size.height);

    self.timeLable.text = @"三天前";
    [self.timeLable sizeToFit];
    self.timeLable.frame = CGRectMake(self.commentLable.frame.origin.x + self.commentLable.frame.size.width + 15, self.timeLable.frame.origin.y, self.timeLable.frame.size.width, self.timeLable.frame.size.height);

    self.rightImageView.image = [UIImage imageNamed:@"icon.bundle/splash.png"];
}

- (void)delButtonClick {
// self.delegate respondsToSelector  有没有实现这个方法
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDelButton:)]) {
        [self.delegate tableViewCell:self clickDelButton:self.delButton];
    }
    NSLog(@"delButtonClick");
}

@end
