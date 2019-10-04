//
//  VideoCollectionViewCell.h
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/25.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoCollectionViewCell : UICollectionViewCell
// 封装外界传入两个url

//- (void)layoutWithVideoUrl:(NSString*)videoUrl  coverImageUrl:(NSString*) coverImageUrl;
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END
