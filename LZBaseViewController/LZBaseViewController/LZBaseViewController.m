//
//  LZBaseViewController.m
//  LZBaseViewController
//
//  Created by Lovl_z on 2022/2/21.
//

#import "LZBaseViewController.h"

#define PADDING  20
@interface LZBaseViewController ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *messageBoxView;
@property (nonatomic, strong) UIButton *topBtn;

@property (nonatomic, strong) UIStatusBarManager *statusBarManager;
@end

@implementation LZBaseViewController
-(UIStatusBarManager *)statusBarManager
{
    if (!_statusBarManager) {
        self.statusBarManager = [UIApplication sharedApplication].keyWindow.windowScene.statusBarManager;
        id _statusBar = nil;
        if ([_statusBarManager respondsToSelector:@selector(createLocalStatusBar)]) {
            UIView *_localStatusBar = [_statusBarManager performSelector:@selector(createLocalStatusBar)];
            if ([_localStatusBar respondsToSelector:@selector(statusBar)]) {
                _statusBar = [_localStatusBar performSelector:@selector(statusBar)];
            }
        }
    }
    return _statusBarManager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createNav{
    
    if (_nav) {
        return;
    }
    _nav = [UIImageView new];
    _nav.userInteractionEnabled = YES;
    _nav.image = [UIImage imageNamed:@"nav_bg"];
    [self.view addSubview:_nav];
    NSLog(@"----height:%f", self.statusBarManager.statusBarFrame.size.height+44);
    NSLog(@"----statusHeight:%f", self.statusBarManager.statusBarFrame.size.height);
    _nav.frame = CGRectMake(0, 0, self.view.frame.size.width, self.statusBarManager.statusBarFrame.size.height+44);

    UIView *line = [UIView new];
    line.backgroundColor = [UIColor lightGrayColor];
    [_nav addSubview:line];
    line.frame = CGRectMake(0, self.statusBarManager.statusBarFrame.size.height+44, self.view.frame.size.width, 1);
}
#pragma mark 创建titleLabel
- (void)createTitleLabel{
    
    if (_titleLabel) {
        return;
    }
    
    _titleLabel = [UILabel new];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:21];
    [_titleLabel sizeToFit];
    
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.center = CGPointMake(self.view.frame.size.width/2, self.statusBarManager.statusBarFrame.size.height+PADDING);

    _titleLabel.bounds = CGRectMake(0, 0, 200, 40);
    [_nav addSubview:_titleLabel];
}
#pragma mark titleStr
- (void)setTitleStr:(NSString *)titleStr{
    
    if ([titleStr isEqualToString:_titleStr]) {
        return;
    }
    
    _titleStr = titleStr;
    [self createTitleLabel];
    _titleLabel.text = titleStr;
}

#pragma mark 创建返回按钮
- (void)createBackButton{
    
    UIButton *backBtn = [_nav viewWithTag:1001];
    
    if (backBtn) {
        return;
    }
   
    
    backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    backBtn.tag = 1001;
    [backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_nav addSubview:backBtn];
//    backBtn.sd_layout.heightIs(44).widthIs(44).yIs(STATUSBARFARME.size.height).xIs(0);
    backBtn.center = CGPointMake(30, self.statusBarManager.statusBarFrame.size.height+PADDING);

    backBtn.bounds = CGRectMake(0, 0, 40, 40);
}

#pragma mark 返回按钮事件
- (void)backBtnAction:(UIButton *)btn{

    if (self.presentingViewController) {
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            [self.navigationController popViewControllerAnimated:YES];
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
