//
//  HomTableCell.h
//  douyu01
//
//  Created by xiaos on 15/11/18.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CELL_MARGIN 5

typedef void(^tapCellCallBack)(NSString *);

@interface HomTableCell : UITableViewCell

//@property (nonatomic,strong) NSArray *roomList;

@property (nonatomic,strong) NSArray *dataSource;

@property (nonatomic,copy) tapCellCallBack callBack;

@end
