//
//  PresentViewController.m
//  LZBaseViewController
//
//  Created by Lovl_z on 2022/2/21.
//

#import "PresentViewController.h"

@interface PresentViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView * web;
@end

@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self createNav];
    [self createBackButton];
    self.titleStr = @"demo";
    
    [self.view addSubview:self.web];
    
}
-(UIWebView *)web
{
    if (!_web) {
        self.web =[[UIWebView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.nav.frame), self.view.frame.size.width, self.view.frame.size.height)];
        _web.delegate = self;
        
        [_web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
        
     
     
    }
    return _web;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //js方法遍历图片添加点击事件 返回图片个数

       static  NSString * const jsGetImages =

       @"function getImages(){\var objs = document.getElementsByTagName(\"img\");\for(var i=0;i<objs.length;i++){\objs[i].οnclick=function(){\document.location=\"myweb:imageClick:\"+this.src;\
        };\
        };\
        return objs.length;\
        };";
       [_web stringByEvaluatingJavaScriptFromString:jsGetImages];//注入js方法
       //注入自定义的js方法后别忘了调用 否则不会生效（不调用也一样生效了，，，不明白）
       NSString *resurlt = [_web stringByEvaluatingJavaScriptFromString:@"getImages()"];
    NSLog(@"---调用js方法--%@  %s  jsMehtods_result = %@",self.class,__func__,resurlt);
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //将url转换为string

    NSString *requestString = [[request URL] absoluteString];

    

    //hasPrefix 判断创建的字符串内容是否以pic:字符开始

    if ([requestString hasPrefix:@"myweb:imageClick:"]) {
        NSString *imageUrl = [requestString substringFromIndex:@"myweb:imageClick:".length];
        self.navigationController.navigationBarHidden = YES;
        return NO;

    }

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
