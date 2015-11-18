//
//  ToolBarView.h
//  BeautifulChina--test1
//
//  Created by scsys on 15/7/20.
//  Copyright (c) 2015年 孙祥龙. All rights reserved.
//
#import <UIKit/UIKit.h>
@class ZWCollectionViewFlowLayout;
@protocol ZWwaterFlowDelegate <NSObject>

-(CGFloat)ZWwaterFlow:(ZWCollectionViewFlowLayout*)waterFlow heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath*)indexPach;

@end

@interface ZWCollectionViewFlowLayout : UICollectionViewLayout
@property(nonatomic,assign)UIEdgeInsets sectionInset;
@property(nonatomic,assign)CGFloat rowMagrin;
@property(nonatomic,assign)CGFloat colMagrin;
@property(nonatomic,assign)CGFloat colCount;
@property(nonatomic,weak)id<ZWwaterFlowDelegate>degelate;
@end
