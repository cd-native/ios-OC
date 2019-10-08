//
//  ViewController.m
//  SimpleApp
//
//  Created by 杨崇多 on 2019/9/16.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "ViewController.h"
#import "NormalTableViewCell.h"
#import "WkViewController.h"
#import "DelCellView.h"
#import "../model/ListLoader.h"
#import "../model/ListItem.h"
#import "GTMediator.h"

// 有一个 uiview 执行栈
// 了解uiView的执行周期
// uiViewController 生命周期

@interface TestView : UIView

@end

@implementation TestView
- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

// 了解 每个uiview 的生命周期
- (void)willMoveToSuperview:(nullable UIView *)newSuperview {
    NSLog(@"将要移动父uiview上");
    [super willMoveToSuperview:newSuperview];
}

- (void)didMoveToSuperview {
    NSLog(@"已经移动到 父uiview上了");
    [super didMoveToSuperview];
}

- (void)willMoveToWindow:(nullable UIWindow *)newWindow {
    NSLog(@"将要移动到视图中");
//   只是这个view 要贴到视图中，当然还有其他view 也需要贴到视图中
    [super willMoveToWindow:newWindow];
}

- (void)didMoveToWindow {
// 已经和主视图 集合在一起，但是这个时候页面 还是没有展示，等待其他view 合并
    NSLog(@"已经移动到视图中");
    [super didMoveToWindow];
}

@end

// 类扩展 是隐私的；不需要暴露在外的 属性一定放在这
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, NormalTableViewProtpcol>

// delegate 是weak  block 是copy；
@property  (strong, readwrite, nonatomic) UITableView *uiView;
// 这个位置尽量使用 NSArray
@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic, readwrite) NSMutableArray *newsList;

@end

@implementation ViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _dataArray = @[].mutableCopy;
        for (int i = 0; i < 20; i++) {
//            请注意 此处 @()
//            [_dataArray addObject:@(i)];
        }
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"将要显示到视图中");
    [super viewWillAppear:animated];
}

// Called when the view is about to made visible. Default does nothing
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"已经显示到视图中");
    [super viewDidAppear:animated];
}

// Called when the view has been fully transitioned onto the screen. Default does nothing
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

// Called when the view is dismissed, covered or otherwise hidden. Default does nothing
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

// Called after the view was dismissed, covered or otherwise hidden. Default does nothing

//所有 viewController init 之后马上调用
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // bounds：界限
    _uiView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _uiView.dataSource = self;
    _uiView.delegate = self;
//    id <UITableViewDataSource> dataSource;
    [self.view addSubview:_uiView];

    ListLoader *listloader = [[ListLoader alloc] init];
//    [[listloader loadListDataBlock:(__autoreleasing loadListDataBlock *){
//
//    }];
//    self.newsList
    [listloader loadListDataBlock:^(BOOL success,NSArray<ListItem*>* listdata){
        self.dataArray= listdata;
//       重新渲染页面
        [self.uiView reloadData];
        
    }];
//

//    [self.view addSubview: ({
//        UILabel* label = [[UILabel alloc] init];
//        label.text=@"hello world";
//    })];
    //    是不是每个页面都有一个viewController;？
//
//    TestView* view = [[TestView alloc] init];
//    view.backgroundColor=[UIColor redColor];
////   距离
//    view.frame = CGRectMake(100,100,100,100);
//    [self.view addSubview:view];
////    self.navigationController pushViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#>
////    self.navigationController
//
//    //   调用完 viewDidLoad说明 主view和子view都已经准备好， 开始要在页面中共展示;
//    // Do any additional setup after loading the view, typically from a nib.
////   生成一个手势 把这个手势 增加到对应的view
//    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
//    [view addGestureRecognizer:tapGesture];
}

// cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

// 选择哪个 cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ListItem* item   = [self.dataArray objectAtIndex:indexPath.row];
//   组件有耦合的方式
//    WkViewController *wkViewController = [[WkViewController alloc] initWithUrl:item.url];
//    [self.navigationController pushViewController:wkViewController animated:YES];
//    组件抽离第一种 target - action
    __kindof UIViewController* detailController =[GTMediator detailControllerWithUrl:item.url];
    [self.navigationController pushViewController:detailController animated:YES];
    
//   组件抽离通讯第二种方式 url Scheme
//    detail:// 是写死
//    缺陷：params 无法知道，需要看具体的load 注册是如何实现的
     [GTMediator openUrl:@"detail" params:@{@"url":item.url,@"controller":self.navigationController}];
    
    
//   点击的时候 记录是否点击
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.uniquekey];
//    UIViewController* uiViewController = [[UIViewController alloc] init];
//    uiViewController.title= [NSString stringWithFormat:@"id = %ld",indexPath.row];
//    uiViewController.view.backgroundColor= [UIColor whiteColor];
//    [self.navigationController pushViewController:uiViewController animated:YES];
}

// 有多少个cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    tableView是可以服用
//    使用标识符出列可重用单元格
    NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
//        NormalTableViewCell
        //       这边要使用自己的tabViewCell;
        cell = [[NormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    [cell  layoutTextWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    cell.delegate = self;
//    - (void)layoutTextWithItem:(ListItem*) item
//    [cell  layoutText];
//    cell layoutTextWithItem:(nonnull ListItem *)
//    UITableViewCell* cell = [[UITableViewCell  alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
//    去掉默认的cell展示
//    cell.textLabel.text=[NSString stringWithFormat:@"标题index-%ld",indexPath.row];
//    cell.detailTextLabel.text=@"副标题";
//    cell.imageView.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
    return cell;
}

#pragma mark-  delView
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDelButton:(UIButton *)delButton {
    DelCellView *delCellView = [[DelCellView alloc] initWithFrame:self.view.bounds];
//    将button的坐标系 转换成 window坐标系
    CGRect rect = [tableViewCell convertRect:delButton.frame toView:nil];
//    self.tableView indexPathForCell:tableViewCell
    [delCellView showDeleteViewFromPoint:rect.origin clickBlock:^{
//       必须先删除数据
//        [self.dataArray removeLastObject];
//        回调
//        删除单个tableViewCell 需要父级 tableCell
//        self.tableView indexPathForCell:<#(nonnull UITableViewCell *)#>
//        [self.tableView deleteRowsAtIndexPaths:@[[self.tableView indexPathForCell:tableViewCell]  withRowAnimation:UITableViewRowAnimationAutomatic];
//        这是一个deleteRowsAtIndexPaths 数组
        [self.uiView deleteRowsAtIndexPaths:@[[self.uiView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationFade];
//        [self.uiView deleteRowsAtIndexPaths:@[[self.uiView indexPathForCell: tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
//        先这样 保证效果

        NSLog(@"删除");
    }];
}

- (void)pushController {
    UIViewController *uiViewController = [[UIViewController alloc] init];
    uiViewController.view.backgroundColor = [UIColor whiteColor];
    uiViewController.navigationItem.title = @"内容";
//    UIBarButtonItemStylePlain 这个不知道什么意思？
//    Plain 川
    uiViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:nil];

    [self.navigationController pushViewController:uiViewController animated:YES];
}

@end
