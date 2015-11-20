//
//  HomTableCell.m
//  douyu01
//
//  Created by xiaos on 15/11/18.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "HomTableCell.h"

#import "ZWCollectionViewFlowLayout.h"
#import "XSMainCell.h"

#import "HomeModel.h"

@interface HomTableCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,ZWwaterFlowDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@end

static NSString *cellId = @"homeCollectionCell";

@implementation HomTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initCollectionView];
    }
    return self;
}

- (void)initCollectionView
{
    ZWCollectionViewFlowLayout *flow = [ZWCollectionViewFlowLayout new];
    CGFloat margin = CELL_MARGIN;
    flow.colMagrin = margin;
    flow.rowMagrin = margin;
    flow.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
    flow.colCount = 2;
    flow.degelate = self;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KWidth, KWidth*0.618 + (3*margin*0.382)) collectionViewLayout:flow];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    UINib *cellNib = [UINib nibWithNibName:@"XSMainCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:cellId];
    self.collectionView.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    self.collectionView.scrollsToTop = NO;
    [self.contentView addSubview:self.collectionView];
}

#pragma mark - 实现代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XSMainCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.roomModel = self.dataSource[indexPath.row];
    return cell;
}

- (CGFloat)ZWwaterFlow:(ZWCollectionViewFlowLayout *)waterFlow heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPach
{
    return width*0.618;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld---%ld",(long)indexPath.section,(long)indexPath.row);
    roomModel *room = self.dataSource[indexPath.row];
    NSLog(@"%@",room.url);
    
    if (self.callBack) {
        self.callBack(room.url);
    }
    
}


@end
