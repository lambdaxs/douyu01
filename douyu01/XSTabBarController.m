//
//  XSTabBarController.m
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "XSTabBarController.h"
#import "XSNavigationController.h"

#import "XSHomeController.h"
#import "XSColumnController.h"
#import "XSOnlineController.h"
#import "XSMineController.h"

#import "public.h"

@interface XSTabBarController ()

@end

@implementation XSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 设置tabbar背景色 */
    UIView *backView         = [[UIView alloc]initWithFrame:self.view.frame];
    backView.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque=YES;
    /** 设置tabbar高亮色 */
    self.tabBar.tintColor=[UIColor orangeColor];
    
    /** 初始化子控制器 */
    [self setUpChildController];
    
}

- (void)setUpChildController
{
    XSHomeController *home = [XSHomeController new];
    [self setUpController:home image:[UIImage imageNamed:@"btn_home_normal"] selImage:[UIImage imageNamed:@"btn_home_selected"] title:@"推荐"];
    
    XSColumnController *colmun = [[XSColumnController alloc] init];
    [self setUpController:colmun image:[UIImage imageNamed:@"btn_column_normal"] selImage:[UIImage imageNamed:@"btn_column_selected"] title:@"栏目"];
    
    XSOnlineController *online = [XSOnlineController new];
    [self setUpController:online image:[UIImage imageNamed:@"btn_live_normal"] selImage:[UIImage imageNamed:@"btn_live_selected"] title:@"直播"];
    
    XSMineController *mine = [XSMineController new];
    [self setUpController:mine image:[UIImage imageNamed:@"btn_user_normal"] selImage:[UIImage imageNamed:@"btn_user_selected"] title:@"我"];
    
}

- (void)setUpController:(XSBaseViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
    XSNavigationController *navi = [[XSNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:navi];
}


@end
