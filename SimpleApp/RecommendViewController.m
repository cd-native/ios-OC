//
//  RecommendViewController.m
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/19.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation RecommendViewController


- (instancetype)init{
    
    self =  [super init];
    if (self) {
        self.tabBarItem.title=@"推荐";
        self.tabBarItem.image= [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage  =  [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView* scrollView =  [[UIScrollView alloc] initWithFrame:self.view.bounds];
//   设置contentSize
    scrollView.contentSize= CGSizeMake(self.view.bounds.size.width*5 , self.view.bounds.size.height);
    NSArray* colors =@[[UIColor lightGrayColor],[UIColor darkGrayColor],[UIColor redColor],[UIColor whiteColor],[UIColor greenColor]];
//  向 scrollView 增加 5个 子view
    for (int i =0 ; i<colors.count; i++) {
//       这里弄的和 块状作用域一样
        [scrollView addSubview:({
            
            UIView* uiView = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
            uiView.backgroundColor = [colors objectAtIndex:i];
            
            [uiView addSubview:({
                UIView* uiView1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
                //   这里的self 就是uiView1;
                UITapGestureRecognizer* uiTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(uiViewClick)];
                [uiView1 addGestureRecognizer:uiTapGestureRecognizer];
                
                uiTapGestureRecognizer.delegate = self;
                
                uiView1.backgroundColor = [UIColor yellowColor];
                uiView1;
            })];
            uiView;
        })];
    };
    //    @property(nonatomic)         BOOL                         showsHorizontalScrollIndicator; // default YES. show indicator while we are tracking. fades out after tracking
    //    @property(nonatomic)         BOOL                         showsVerticalScrollIndicator;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
//   通过delegate  回调 当前的状态和一些信息；
//    id<UIScrollViewDelegate>        delegate;
    scrollView.delegate = self;
//  通过委托
//    功能是 开启分页
//    分页已启用
    
//    scrollView.pagingEnabled=YES;
    [self.view addSubview:scrollView];
}

- (void)uiViewClick{
    NSLog(@"uiViewClick");
}
// 只要开始滚动，就会触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//  触发某些条件处理 哪些 业务逻辑
    NSLog(@"scrollView =%@",@(scrollView.contentOffset.x));
}                                               // any offset changes
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    中断一些业务逻辑， 比如视频 gif 就可以了；
    //    皮皮虾滑动的时候 ，自动播放;
    NSLog(@"scrollViewWillBeginDragging 拖拽 start");
}
//// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"scrollViewWillEndDragging 拖拽end");
}

//// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
//
//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;   // called on finger up as we are moving
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;

#pragma mark- 手势是否有用
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
//    NSLog(@"test=%@",gestureRecognizer.allowedTouchTypes);
// 可以判断 点击的位置 可以在一个完成的uiview中实现不同的点击效果
    return YES;
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
