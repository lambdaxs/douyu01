//
//  XSMineController.m
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "XSMineController.h"

#import "XSFirstCell.h"

@interface XSMineController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray     *dataArray;        ///< 数据源数组

@end

@implementation XSMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initSubviews];
    
}

- (void)initData
{
    self.dataArray = @[@[@"Image_focus.png",@"我的关注"],@[@"Image_history.png",@"观看历史"],@[@"Image_tesk.png",@"我的任务"],@[@"Image_remind.png",@"开播提醒"],@[@"Image_set.png",@"系统设置"],@[@"Image_recommend.png",@"精彩推荐"]];
}

- (void)initSubviews
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[XSFirstCell class] forCellReuseIdentifier:@"firstCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"middleCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"lastCell"];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 1 ? 5: 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section == 0 ? 70: 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        XSFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
        return cell;
    }else if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"middleCell"];
        NSArray *arr = self.dataArray[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:arr[0]];
        cell.textLabel.text = arr[1];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else
    {
       UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"lastCell"];
        NSArray *arr = [self.dataArray lastObject];
        cell.imageView.image = [UIImage imageNamed:arr[0]];
        cell.textLabel.text = arr[1];
        cell.detailTextLabel.text = @"更多鱼丸等你来拿";
        return cell;
    }
}

#pragma mark - UITableViewDelegate

@end
