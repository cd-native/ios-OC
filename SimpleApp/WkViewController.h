//
//  WkViewController.h
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/20.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WkViewController : UIViewController

@property (strong,nonatomic,readwrite) WKWebView* webView;
@property (strong,nonatomic,readwrite) UIProgressView* uiProgressView;

@end

NS_ASSUME_NONNULL_END
