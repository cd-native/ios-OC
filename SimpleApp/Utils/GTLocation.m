//
//  GTLocation.m
//  SimpleApp
//
//  Created by 杨崇多 on 2019/10/7.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "GTLocation.h"
#import "CoreLocation/CoreLocation.h"

@interface GTLocation()<CLLocationManagerDelegate>
@property(nonatomic, strong, readwrite) CLLocationManager *manager;
@end

@implementation GTLocation

+ (GTLocation*)locationManager{
    static GTLocation* location;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        location = [[GTLocation alloc] init];
    });
    return location;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        self.manager = [[CLLocationManager alloc] init];
//        权限状态的变更通知我们
        self.manager.delegate = self;
    }
    return self;
}

- (void)checkLocationAuthorization{
    
    //判断系统是否开启
    if(![CLLocationManager locationServicesEnabled]){
        //引导弹窗
        //
        NSLog(@"tests");
    }
    
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined){
        [self.manager requestWhenInUseAuthorization];
    }
}

#pragma mark - delegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        //
        [self.manager startUpdatingLocation];
        
    }else if (status == kCLAuthorizationStatusDenied){
        //
    }
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    //地理信息
    CLLocation *location = [locations firstObject];
    
    CLGeocoder *coder = [[CLGeocoder alloc] init];
    
    [coder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        //地标信息
    }];
    
    [self.manager stopUpdatingLocation];
}

@end
