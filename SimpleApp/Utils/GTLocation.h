//
//  GTLocation.h
//  SimpleApp
//
//  Created by 杨崇多 on 2019/10/7.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTLocation : NSObject
+ (GTLocation *)locationManager;

- (void)checkLocationAuthorization;
@end

NS_ASSUME_NONNULL_END
