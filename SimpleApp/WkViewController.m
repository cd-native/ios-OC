//
//  WkViewController.m
//  用户界面
//
//  Created by 杨崇多 on 2019/9/20.
//  Copyright © 2019 杨崇多. All rights reserved.
//

#import "WkViewController.h"
#import <WebKit/WebKit.h>

@interface WkViewController ()<WKNavigationDelegate>

@end

@implementation WkViewController

-  (instancetype)initWithUrl:(NSString*) url{
    self =  [super init];
    if (self) {
        _artileUrl = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
//       需要确认一下self.view.frame 和 self.view.bounds
        WKWebView* webView1 = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//        通过delegate 给予 用户操作行为
        webView1.navigationDelegate = self;
        self.webView = webView1;
        self.webView;
    })];
    
//  增加滚动条 UIProgressView
    [self.view addSubview:({
        self.uiProgressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];
        self.uiProgressView;
    })];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.artileUrl]]];
    

    //     webView 协议 实现 协议两个方法比较重要;
//    options 发生什么 变化的时候通知我们呢
//     context  是参数?
//    监听 estimatedProgress（webView加载进度的） 变化
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
//    WkWebView
    // Do any additional setup after loading the view.
}
#pragma mark-addObserver的回调

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{
//  webview加载进度 同步到 uiProgressView的属性 progress
    self.uiProgressView.progress = self.webView.estimatedProgress;
}

#pragma mark- 是否允许 加载url
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSLog(@"navigationAction=%@",navigationAction);
    decisionHandler(WKNavigationActionPolicyAllow);
}
// 加载完成url
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
//  这个webview已经加载好了
    NSLog(@"navigation");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)test{
//    [self.webView  loadRequest:[NSURLRequest requestWithURL: NSURL URLWithString: ]];
}

@end
