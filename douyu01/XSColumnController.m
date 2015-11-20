//
//  XSColumnController.m
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "XSColumnController.h"

#import "ZWCollectionViewFlowLayout.h"
#import "SDRotationLoopProgressView.h"

#import "XSColumnCell.h"
#import "XSColumnModel.h"

#import "NetworkTool.h"
#import "MJExtension.h"

@interface XSColumnController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,ZWwaterFlowDelegate>
@property (nonatomic,strong) UICollectionView           *collectionView;///< 集合视图
@property (nonatomic,strong) NSMutableArray             *dataSource;    ///< 数据源数组
@property (nonatomic,strong) SDRotationLoopProgressView *waitView;      ///< 等待加载视图
@end

static NSString *cellId = @"columnCell";
@implementation XSColumnController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self initCollectionView];
    [self showLoadView];
    [self loadNetData];
}

- (void)loadNetData
{
    
    self.dataSource = [NSMutableArray array];
    [[NetworkTool sharedNetworkTool] netColumnSuccess:^(NSArray *data) {
        if (self.waitView) {
            [self hidenLoadView];
        }
        self.dataSource = (NSMutableArray *)data;
        [self.collectionView reloadData];
    } failure:^(NSError *erro) {
        NSLog(@"%@",erro);
    }];

}

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
    XSColumnCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.columnModel = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark UICollectionViewDelegateFlowLayout
#pragma mark ZWwaterFlowDelegate
- (CGFloat)ZWwaterFlow:(ZWCollectionViewFlowLayout *)waterFlow heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPach
{
    return width*1.618;
}

#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"你点击了 %ld--%ld",(long)indexPath.section,(long)indexPath.item);
}


-(void)initCollectionView
{
    //初始化自定义layout
    ZWCollectionViewFlowLayout *flowLayout = [[ZWCollectionViewFlowLayout alloc] init];
    flowLayout.degelate = self;
    flowLayout.colCount=3;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout: flowLayout];
    //注册显示的cell的类型
    UINib *cellNib=[UINib nibWithNibName:@"XSColumnCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:cellId];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:0.25];
    [self.view addSubview:self.collectionView];
}

-(void)hidenLoadView
{
    [UIView animateWithDuration:0.3 animations:^{
        [self.waitView removeFromSuperview];
    }];
}

-(void)showLoadView
{
    self.waitView        = [SDRotationLoopProgressView progressView];
    self.waitView.frame  = CGRectMake(0, 0, 100, 100);
    self.waitView.center = self.view.center;
    [self.view addSubview: self.waitView ];
}

@end
