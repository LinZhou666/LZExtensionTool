//
//  MainViewController.m
//  LZBaseViewController
//
//  Created by Lovl_z on 2022/2/21.
//

#import "MainViewController.h"
#import "PresentViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNav];
    self.titleStr = @"首页";
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    PresentViewController * vc = [[PresentViewController alloc]init];
    [self.navigationController pushViewController:vc animated:vc];
}


@end
