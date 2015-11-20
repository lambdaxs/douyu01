//
//  MoreOnlineController.m
//  douyu01
//
//  Created by xiaos on 15/11/19.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "MoreOnlineController.h"


@interface MoreOnlineController ()

@end

@implementation MoreOnlineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.titleView = nil;
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)back:(UIBarButtonItem *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 覆写加载数据的方法
- (void)loadNetData
{
    self.dataSource = [NSMutableArray array];
    self.times = 0;
    
    [[NetworkTool sharedNetworkTool] netHomeWithCateId:self.cate_id times:0 success:^(NSArray *data) {
        [self.collectionView headerEndRefreshing];
        if (self.dataSource.count) {
            [self.dataSource removeAllObjects];
        }
        [self.dataSource addObjectsFromArray:data];
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];

}

- (void)loadMoreData
{
    [[NetworkTool sharedNetworkTool] netHomeWithCateId:self.cate_id times:++self.times success:^(NSArray *data) {
        [self.collectionView footerEndRefreshing];
        [self.dataSource addObjectsFromArray:data];
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}


@end
