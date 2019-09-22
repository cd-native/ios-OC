//
//  VideoViewController.m
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/19.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController
- (instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem.title =@"视频";
        self.tabBarItem.image= [UIImage imageNamed:@"icon.bundle/video@2x.png"];
        self.tabBarItem.selectedImage  =  [UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor whiteColor];
    
//    UIView* view  = [[UIView alloc] init];
//    view.backgroundColor = [UIColor redColor];
////    CGRectMake
//    view.frame=CGRectMake(100, 100, 100, 100);
//    [self.view addSubview:view];
    
    
//    UICollectionView通过 collectionViewLayout 管理 每个类
//   这个类也很重要；
    UICollectionViewFlowLayout* collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionViewFlowLayout.minimumLineSpacing = 30; // 上下间距
    collectionViewFlowLayout.minimumInteritemSpacing = 10; // 左右间距
//    CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    collectionViewFlowLayout.itemSize = CGSizeMake((self.view.frame.size.width-10)/2, 300);
//    initWithFrame 和屏幕大小
//    UITableView
    //   一般情况下， 需要继承 UICollectionView, 暂时先这样;
    UICollectionView* uiCollectView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:collectionViewFlowLayout];
    uiCollectView.delegate = self;
    uiCollectView.dataSource = self;
//    UICollectionView 先要注册 为了能够在 view 复用池
//    重用 cell 类型的注册
//    首先找 在复用回收池里面找，如果没找到就会新建一个，和下面的代码功能一样
    
//    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
//    }
    
//  请注意这个位置UICollectionViewCell
//   注册一个，需要重用的 cell 类型
    [uiCollectView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionView"];
    [self.view addSubview:uiCollectView];
    // Do any additional setup after loading the view.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionView" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"collectionView");
    if (indexPath.item % 3 == 0) {
        return CGSizeMake(self.view.frame.size.width, 100);
    }else{
        return CGSizeMake((self.view.frame.size.width - 10)/2, 300);
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
