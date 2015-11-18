//
//  XSNavigationController.m
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "XSNavigationController.h"

#import "public.h"

@interface XSNavigationController ()

@end

@implementation XSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 设置背景颜色 */
    self.navigationBar.barTintColor = [UIColor orangeColor];
    /** 设置字体颜色 */
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}

/** 设置状态栏为浅色 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
