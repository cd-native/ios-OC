//
//  ListLoader.m
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/22.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "ListLoader.h"

@implementation ListLoader

- (void)loadListData{
    NSString* url = @"https://www.baidu.com/?name=chongduo&age=10";
    //    为什么要将string 转换成 nsurl 原因是nsurl将其 进行了封装
    NSURL*  nsUrl = [NSURL URLWithString:url];
    //    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:nsUrl];
    //  在session  根据 request 创建好 task
    //   创建session  有很多中
    NSURLSession* session = [NSURLSession sharedSession];
    //    task 有四种
    //   在session中封装urlRequset到task中的状态
    //    NSURLSessionDataTask* task = [session dataTaskWithRequest:urlRequest];
    NSURLSessionDataTask* task = [session  dataTaskWithURL:nsUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"test23232323");
    }];
    [task resume];
    //    po nsUrl 可以在终端上打印出来
}
@end
