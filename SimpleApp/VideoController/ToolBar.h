//
//  ToolBar.h
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/26.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTScreen.h"

//#define GTVideoToolbarHeight UI(60)
#define GTVideoToolbarHeight UI(60)

//NS_ASSUME_NONNULL_BEGIN

@interface ToolBar : UIView
- (void)layoutWithModel:(id)model;
@end

//NS_ASSUME_NONNULL_END
