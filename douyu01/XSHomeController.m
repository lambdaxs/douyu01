//
//  XSHomeController.m
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "XSHomeController.h"

#import "MoreOnlineController.h"

#import "ZWCollectionViewFlowLayout.h"
#import "HomTableCell.h"
#import "HomeModel.h"
#import "HomeHeadView.h"

#import "PlayerController.h"
#import "NetworkTool.h"
#import "MJRefresh.h"
#import "SDCycleScrollView.h"

@interface XSHomeController ()<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>

@property (nonatomic,strong) UITableView       *tableView;
@property (nonatomic,strong) NSArray           *dataSource;
@property (nonatomic,strong) SDCycleScrollView *topView;

@end

static NSString *cellId = @"homeTableCell";

@implementation XSHomeController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initTableView];
    [self initTopScrollView];

    [self.tableView headerBeginRefreshing];
}

- (void)initTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];

    __weak typeof(self) weakSelf = self;
    [self.tableView addHeaderWithCallback:^{
        [weakSelf loadData];
    }];
    
}

- (void)initTopScrollView
{
    self.topView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) imageURLStringsGroup:nil];
    self.topView.backgroundColor = RGB(220, 220, 220);
    self.topView.delegate = self;
    self.topView.placeholderImage = [UIImage imageNamed:@"Img_default"];
    self.topView.autoScrollTimeInterval = 5;
    self.topView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.topView.dotColor = [UIColor orangeColor];
    self.tableView.tableHeaderView = self.topView;
}


- (void)loadData
{
    [[NetworkTool sharedNetworkTool] netHomeSuccess:^(NSArray *data) {
        [self.tableView headerEndRefreshing];
        self.dataSource = data;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    [[NetworkTool sharedNetworkTool] netHomeTopSuccess:^(NSArray *data) {
        self.topView.titlesGroup          = data[0];
        self.topView.imageURLStringsGroup = data[1];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];

    
}

#pragma mark - 实现代理方法
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [NSString stringWithFormat:@"Cell%ld%ld", (long)indexPath.section, (long)indexPath.row];
    HomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[HomTableCell alloc] initWithStyle:0 reuseIdentifier:cellIdentifier];
    }

    cell.dataSource = [self.dataSource[indexPath.section] roomlist];
    
    cell.callBack = ^(NSString *url){
        PlayerController *playVC = [PlayerController new];
        [self presentViewController:playVC animated:YES completion:nil];
        NSLog(@"%@",url);
    };

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger num = [self.dataSource[indexPath.section] roomlist].count;
    CGFloat overTwoHeight = self.view.frame.size.width*0.618 + (3*CELL_MARGIN*0.382);
    CGFloat twoHeight = (self.view.frame.size.width - 3*CELL_MARGIN)*0.5*0.618 + 2*CELL_MARGIN;
    if (num == 0) {return 0;}
    return num > 2? overTwoHeight: twoHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HomeHeadView *headView = [HomeHeadView new];
    headView.tag = section;
    headView.title = [self.dataSource[section] title];
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headViewTapped:)];
    [headView addGestureRecognizer:tapG];
    return headView;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    PlayerController *playVC = [PlayerController new];
    [self presentViewController:playVC animated:YES completion:nil];
}

#pragma mark - 事件响应和监听
- (void)headViewTapped:(UITapGestureRecognizer *)tap
{
    MoreOnlineController *moreVC = [MoreOnlineController new];
    HomeModel *home = self.dataSource[tap.view.tag];
    moreVC.cate_id = home.cate_id;
    moreVC.title = home.title;
    [self.navigationController pushViewController:moreVC animated:YES];
}

@end
