//
//  XSOnlineController.m
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "XSOnlineController.h"

#import "XSMainCell.h"
#import "XSOnlineModel.h"
#import "ZWCollectionViewFlowLayout.h"

#import "NetworkTool.h"
#import "MJRefresh.h"

@interface XSOnlineController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,ZWwaterFlowDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;  ///< 集合视图
@property (nonatomic,strong) NSMutableArray   *dataSource;

@end

static NSString *cellId = @"onlineCell";

@implementation XSOnlineController{
    NSInteger _times;
}
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initCollectionView];
}
#pragma mark - 实现代理方法
#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XSMainCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.onlineModel = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
}

#pragma mark ZWwaterFlowDelegate
- (CGFloat)ZWwaterFlow:(ZWCollectionViewFlowLayout *)waterFlow heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPach
{/** 返回item高度 */
    return 150*0.7;
}

#pragma mark - 网络请求
- (void)loadNetData
{
    self.dataSource = [NSMutableArray array];
    _times = 0;
    
    [[NetworkTool sharedNetworkTool] netOnlineWithTimes:0 success:^(NSArray *data) {
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
    [[NetworkTool sharedNetworkTool] netOnlineWithTimes:++_times success:^(NSArray *data) {
        [self.collectionView footerEndRefreshing];
        [self.dataSource addObjectsFromArray:data];
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - 初始化子控件
- (void)initCollectionView
{
    ZWCollectionViewFlowLayout *flowLayout = [ZWCollectionViewFlowLayout new];
    flowLayout.degelate = self;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.rowMagrin = 10;
    flowLayout.colMagrin = 10;
    flowLayout.colCount = 2;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:0.25];
    UINib *cellNib = [UINib nibWithNibName:@"XSMainCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:cellId];
    [self.view addSubview:self.collectionView];
    
    __weak typeof(self) weakSelf = self;
    [self.collectionView addHeaderWithCallback:^{
        [weakSelf loadNetData];
    }];
    [self.collectionView addFooterWithCallback:^{
        [weakSelf loadMoreData];
    }];
    [self.collectionView headerBeginRefreshing];
}
@end
