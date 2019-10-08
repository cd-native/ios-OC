//
//  GTMediator.m
//  SimpleApp
//
//  Created by 杨崇多 on 2019/10/5.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "GTMediator.h"

@implementation GTMediator

+ (__kindof UIViewController *)detailControllerWithUrl:(NSString *)detailUrl {
//    NSSelectorFromString(<#NSString * _Nonnull aSelectorName#>)
//    组件通讯第一种，这样就实现中间类和目标类是没有任何
    Class detailCls =  NSClassFromString(@"WkViewController");
    UIViewController *controller = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrl:") withObject:detailUrl];
//   备注，如果有参数加：
//   target-action 坏处 最多传递两个参数
//    - (id)performSelector:(SEL)aSelector;
//    - (id)performSelector:(SEL)aSelector withObject:(id)object;
//    - (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;
//    如果组件很多，就会造成GTMediator 非常庞大，可以将每个这样的方法，作为每个类的扩展（具体实施不清楚）
//    传递参数比较少，可以传递一个字典，这样就比较大了
    return controller;
}


+ (NSMutableDictionary*)mediatorCache{
//   存放东西一般为字典
    static NSMutableDictionary* cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache  = @{}.mutableCopy;
    });
    return cache;
}

// 有点类似于node javascript 观察者模式
+ (void)registerScheme:(NSString*)scheme processBlock:(GTMediatorProcessBlock)processBlock{
//   类方法里面 使用其他类方法的话，就需要使用
//   类方法里面 使用类就 self class
    if (scheme && processBlock) {
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme];
    }
}

+ (void)openUrl:(NSString*)url params:(NSDictionary* )params{
    GTMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
}


@end
