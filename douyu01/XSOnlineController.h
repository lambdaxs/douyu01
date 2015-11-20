//
//  XSOnlineController.h
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "XSBaseViewController.h"

#import "XSMainCell.h"
#import "HomeModel.h"
#import "ZWCollectionViewFlowLayout.h"

#import "NetworkTool.h"
#import "MJRefresh.h"

@interface XSOnlineController : XSBaseViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,ZWwaterFlowDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;  ///< 集合视图
@property (nonatomic,strong) NSMutableArray   *dataSource;      ///< 数据源
@property (nonatomic,assign) NSInteger        times;            ///< 下拉次数

- (void)loadNetData;                                            ///< 加载网络数据（可覆写）
- (void)loadMoreData;                                           ///< 加载更多网络数据（可覆写）

@end
