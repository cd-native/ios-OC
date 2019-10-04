//
//  AppDelegate.m
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/16.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "AppDelegate.h"
#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "./VideoController/VideoViewController.h"
#import "RecommendViewController.h"
#import "NormalTableViewCell.h"
#import "GTSplashView.h"
// app 代表
//  类扩张
//UITabBarController
@interface AppDelegate ()<UITabBarControllerDelegate>

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //    controller 是C view 是tabbar提供的 tabbar view;
    
    UITabBarController* tabBarController =  [[UITabBarController alloc] init];
    //    UIViewController* controller1 = [[UIViewController alloc] init];
    
    UIViewController* uiViewController = [[ViewController alloc] init];
    uiViewController.tabBarItem.title =@"新闻";
    uiViewController.view.backgroundColor= [UIColor whiteColor];
    uiViewController.tabBarItem.image= [UIImage imageNamed:@"icon.bundle/page@2x.png"];
    uiViewController.tabBarItem.selectedImage  =  [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    //   更换页面 Controller
    //    UIViewController* controller2 = [[UIViewController alloc] init];
    VideoViewController* videoController = [[VideoViewController alloc] init];

    RecommendViewController*  recommendViewController =  [[RecommendViewController alloc] init];
    
    UIViewController* controller4 = [[UIViewController alloc] init];
    controller4.view.backgroundColor = [UIColor grayColor];
    controller4.tabBarItem.title=@"我的";
    controller4.tabBarItem.image= [UIImage imageNamed:@"icon.bundle/home@2x.png"];
    controller4.tabBarItem.selectedImage  =  [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    [tabBarController setViewControllers:@[uiViewController,videoController,recommendViewController,controller4]];
    //   这是现在比较 流行 tab
    //   设置委托
    tabBarController.delegate = self;
    
    UINavigationController* newsNavigationController = [[UINavigationController alloc] initWithRootViewController:tabBarController];
    
    self.window.rootViewController = newsNavigationController;
    //    [self.window.makeKeyAndVisible];
    // Override point for customization after application launch.
//   在ui准备完成之后 系统闪屏就会消失，这个时候要加入自己的闪屏
    [self.window addSubview:({
        GTSplashView* splashView =  [[GTSplashView alloc] initWithFrame:self.window.bounds];
        splashView;
    })];
    return YES;
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"didSelectViewController");
}

// 将要从前台进入后台
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

// 已经进入后台 要减少app对系统内存的使用，防止被系统kill掉，ios系统发现在后台，同时占用内存过大，会自动kill掉这个app
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//  将要从后台进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

// 已经从后台进入前台，app已经激活
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

// kill app 之后
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
