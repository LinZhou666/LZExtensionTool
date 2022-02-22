//
//  LZBaseViewController.h
//  LZBaseViewController
//
//  Created by Lovl_z on 2022/2/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZBaseViewController : UIViewController
/*!
 * 导航栏属性
 */

@property (nonatomic, copy) NSString *titleStr;

@property (nonatomic, strong) UIImageView *nav;

@property (nonatomic, strong) UIView *titleView;

/* 导航栏事件 */

/*!
 * 创建导航栏
 */
- (void)createNav;

/*!
// * 创建返回按钮
 */
- (void)createBackButton;

/*!
// * 返回按钮事件(pop到上一页面)
// *
// * @param btn 返回按钮
// */
- (void)backBtnAction:(UIButton *)btn;
//
/*!
 * 导航栏右键按钮
 */
@property (nonatomic, strong) UIButton *rightNavButton;

/*!
 * 创建右键按钮
 */
- (void)createRightButton;

/*!
// * 导航栏左键按钮
// */
//@property (nonatomic, strong) UIButton *leftNavButton;
//
//- (void)createSubVC:(NSString *)titleStr;
//
//- (id)changeDic:(id)result;
@end

NS_ASSUME_NONNULL_END
