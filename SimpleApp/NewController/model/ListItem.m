//
//  ListItem.m
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/23.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem

#pragma -mark NSSecureCoding

// 存放
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.uniquekey =  [aDecoder decodeObjectForKey:@"uniquekey"];
        self.title =  [aDecoder decodeObjectForKey:@"title"];
        self.date =  [aDecoder decodeObjectForKey:@"date"];
        self.category =  [aDecoder decodeObjectForKey:@"category"];
        self.author_name =  [aDecoder decodeObjectForKey:@"author_name"];
        self.url =  [aDecoder decodeObjectForKey:@"url"];
        self.thumbnail_pic_s =  [aDecoder decodeObjectForKey:@"thumbnail_pic_s"];
        self.thumbnail_pic_s02 =  [aDecoder decodeObjectForKey:@"thumbnail_pic_s02"];
        self.thumbnail_pic_s03 =  [aDecoder decodeObjectForKey:@"thumbnail_pic_s03"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.uniquekey forKey:@"uniquekey"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.category forKey:@"category"];
    [aCoder encodeObject:self.author_name forKey:@"author_name"];
    [aCoder encodeObject:self.url forKey:@"url"];
    [aCoder encodeObject:self.thumbnail_pic_s forKey:@"thumbnail_pic_s"];
    [aCoder encodeObject:self.thumbnail_pic_s02 forKey:@"thumbnail_pic_s02"];
    [aCoder encodeObject:self.thumbnail_pic_s03 forKey:@"thumbnail_pic_s03"];
}
// 属性自带 get
+ (BOOL)supportsSecureCoding{
    return YES;
}

- (void)configWithDictionary:(NSDictionary *)dictionary {
#warning 应该判断是否
    self.uniquekey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date =  [dictionary objectForKey:@"date"];
    self.category =  [dictionary objectForKey:@"category"];
    self.author_name =  [dictionary objectForKey:@"author_name"];
    self.url =  [dictionary objectForKey:@"url"];
    self.thumbnail_pic_s =  [dictionary objectForKey:@"thumbnail_pic_s"];
    self.thumbnail_pic_s02 =  [dictionary objectForKey:@"thumbnail_pic_s02"];
    self.thumbnail_pic_s03 =  [dictionary objectForKey:@"thumbnail_pic_s03"];
}




@end
