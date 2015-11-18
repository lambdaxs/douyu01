//
//  XSBaseViewController.m
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "XSBaseViewController.h"

@interface XSBaseViewController ()

@end

@implementation XSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 设置导航栏上的item */
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"Image_scan"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, 25, 25);
    [leftButton addTarget:self action:@selector(scan:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"btn_search"] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(0, 0, 25, 25);
    [rightButton addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    /** 设置logo */
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"s_logo"]];
    titleView.contentMode = UIViewContentModeScaleAspectFit;
    titleView.frame = CGRectMake(0, 0, 104, 28);
    self.navigationItem.titleView = titleView;
}

- (void)scan:(UIButton *)sender
{
    NSLog(@"扫描二维码");
}

- (void)search:(UIButton *)sender
{
    NSLog(@"查询房间主播");
}




@end
