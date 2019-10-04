//
//  ListLoader.h
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/22.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListItem;

NS_ASSUME_NONNULL_BEGIN
//
typedef void(^loadListDataBlock)(BOOL success,NSArray<ListItem* >* listData);

// 测试block
typedef void(^simpleBlock)(NSString* name);

/**
 新闻列表加载数据
 */
@interface ListLoader : NSObject

// loadListDataBlock 只是block 类型;
- (void)loadListDataBlock:(loadListDataBlock)finshBlock;

@end

NS_ASSUME_NONNULL_END
