//
//  ListLoader.m
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/22.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "ListLoader.h"
#import "ListItem.h"
#import "AFNetworking.h"

@implementation ListLoader

//loadListDataBlock 作为形参不需要 *
- (void)loadListDataBlock:(loadListDataBlock)finshBlock {
    NSArray<ListItem*>* localData  = [self _getListDataFromLocalPath];
    if (localData) {
        finshBlock(YES,localData.copy);
    }
    
//    https://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e
    [[AFHTTPSessionManager manager] GET:@"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json" parameters:nil progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        NSArray *list = [((NSDictionary *)[(NSDictionary *) responseObject objectForKey:@"result"]) objectForKey:@"data"];
//       将 json 转化为为 结构性数据，其中进行了很多强制类型转换，yymodel
        NSMutableArray *mutableArray = @[].mutableCopy;
        for (NSDictionary *info in list) {
            ListItem *item = [[ListItem alloc] init];
            [item configWithDictionary:info];
            [mutableArray addObject:item];
        }
//        [strongSelf _archiveListDataWithArray:listItemArray.copy];
        [self _archiveListDataWithArray:mutableArray.copy];
//        所有的东西，都是在主线程李阿敏
        dispatch_async(dispatch_get_main_queue(), ^{
                           if (finshBlock) {
//              不知道为什么要copy  是不是就可以变成 不可变数组
                               finshBlock(YES, mutableArray.copy);

                           }
                       });
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        NSLog(@"");
    }];
    
    

/*
    下面是 原生 request请求
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
        po nsUrl 可以在终端上打印出来
 */
}
-  (NSArray<ListItem*>*)_getListDataFromLocalPath{
    NSFileManager* fileManger = [NSFileManager defaultManager];
    NSArray* cachePath =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    [cachePath firstObject];
    NSString* localPath = [[cachePath firstObject] stringByAppendingPathComponent:@"data/list"];
    NSData* localContent = [fileManger contentsAtPath:localPath];
    id value = [NSKeyedUnarchiver  unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[ListItem  class], nil] fromData:localContent error:nil];
    if ([value isKindOfClass:[NSArray class]] &&  [value count]>0) {
        return (NSArray<ListItem*>* )value;
    }
    return  nil;
//    fileManger
}

-  (void)_archiveListDataWithArray:(NSArray<ListItem*>*)dataList{
//    domain 是比较大的
//    NSDocumentDirectory
//    NSUserDefaults
    NSString* cacheUrl = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* directoryUrl =  [cacheUrl stringByAppendingPathComponent:@"data"];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSError* error;
//   先是创建文件夹
    [fileManager createDirectoryAtPath:directoryUrl withIntermediateDirectories:YES attributes:nil error:&error];
//    生成文件
    NSString* dataUrl = [directoryUrl stringByAppendingPathComponent:@"list"];
//    将object 全部转换成编码 只要转变为nsdata
    NSData* data= [NSKeyedArchiver archivedDataWithRootObject:dataList requiringSecureCoding:YES error:nil] ;
//    NSData* data2 = [@"chognduo" dataUsingEncoding:NSUTF8StringEncoding];
    [fileManager  createFileAtPath:dataUrl contents:data attributes:nil];
    
//    BOOL file = [fileManager fileExistsAtPath:dataUrl];
    if ([fileManager fileExistsAtPath:dataUrl]) {
        NSData* data3  = [fileManager   contentsAtPath:dataUrl];
        id value = [NSKeyedUnarchiver  unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[ListItem class],nil] fromData:data3 error:nil];
    }
    
//    NSFileHandle* fileHandle  = [NSFileHandle fileHandleForUpdatingAtPath:dataUrl];
//    [fileHandle  seekToEndOfFile];
//    [fileHandle writeData:[@"momo" dataUsingEncoding:NSUTF8StringEncoding]];
//    [fileHandle synchronizeFile];
//
//    NSData* data2 =   [fileHandle readDataToEndOfFile];
//    data2
//    fileManager  contentsOfDirectoryAtPath:<#(nonnull NSString *)#> error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>
//    fileManager contentsAtPath:<#(nonnull NSString *)#>   //
    
//    根据内容创建文件
    
    
    NSLog(@"");
}
@end

