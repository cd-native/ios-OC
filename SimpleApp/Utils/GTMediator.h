//
//  GTMediator.h
//  SimpleApp
//
//  Created by 杨崇多 on 2019/10/5.
//  Copyright © 2019 杨崇多. All rights reserved.
//
// 主要target action 中转

#import "UIKit/UIKit.h"
#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

//typedef (^processBlock)(NSDictionary*  params);
typedef void(^GTMediatorProcessBlock)(NSDictionary *params);
//调解员
@interface GTMediator : NSObject

+ (__kindof UIViewController*)detailControllerWithUrl:(NSString*) detailUrl;


// 组件通讯第二种  url scheme
// 定义一个block 类型
+ (void)registerScheme:(NSString*)scheme processBlock:(GTMediatorProcessBlock)processBlock;
+ (void)openUrl:(NSString*)url params:(NSDictionary* )params;

@end

NS_ASSUME_NONNULL_END
