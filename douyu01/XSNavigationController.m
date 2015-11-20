//
//  XSNavigationController.m
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "XSNavigationController.h"

@interface XSNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation XSNavigationController

+ (void)initialize
{
    UINavigationBar *naviBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    /** 设置背景颜色 */
    naviBar.barTintColor = [UIColor orangeColor];
    /** 设置字体颜色 */
    naviBar.tintColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    /** 设置导航栏无阴影 */
    naviBar.shadowImage = [UIImage new];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 自定义返回按钮后滑动返回失效 */
    self.delegate = self;
    __weak typeof(self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
}

/** 设置状态栏为浅色 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - UINavigationControllerDelegate
/** 处理自定义返回按钮后的手势 */
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //是根控制器 关闭主界面的滑动返回
    if (viewController == self.viewControllers[0]) {
        
        self.interactivePopGestureRecognizer.enabled = NO;
    }else{
        //非根控制器 开启滑动返回
        if (!self.interactivePopGestureRecognizer.enabled) {
            self.interactivePopGestureRecognizer.enabled = YES;
        }
    }
    
}


@end
