//
//  DleCellView.h
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/21.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DelCellView : UIView

- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock;
//- (void)showDeleteViewFromPoint:(CGPoint)point;
//- (void)showDeleteView;

@end

NS_ASSUME_NONNULL_END
