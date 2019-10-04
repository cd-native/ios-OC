//
//  ListItem.h
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/23.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
  cell 结构化
 */
@interface ListItem : NSObject<NSSecureCoding>


@property (strong,nonatomic,readwrite) NSString*  uniquekey;
@property (strong,nonatomic,readwrite) NSString*  title ;
@property (strong,nonatomic,readwrite) NSString*  date ;
@property (strong,nonatomic,readwrite) NSString*  category ;
@property (strong,nonatomic,readwrite) NSString*  author_name ;
@property (strong,nonatomic,readwrite) NSString*  url ;
@property (strong,nonatomic,readwrite) NSString*  thumbnail_pic_s;
@property (strong,nonatomic,readwrite) NSString*  thumbnail_pic_s02 ;
@property (strong,nonatomic,readwrite) NSString*  thumbnail_pic_s03 ;

- (void)configWithDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
