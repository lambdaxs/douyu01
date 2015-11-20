//
//  BaseResult.h
//  douyu01
//
//  Created by xiaos on 15/11/18.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface BaseResult : NSObject
@property (nonatomic,strong) NSArray *data;
@property (nonatomic,strong) NSString *error;
@end

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>首页
@interface HomeResult : BaseResult<MJKeyValue>

@end

@interface HomeTopResult : BaseResult<MJKeyValue>

@end

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>栏目
@interface ColumnResult : BaseResult<MJKeyValue>

@end

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>直播
@interface OnlineResult : BaseResult<MJKeyValue>

@end

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>我
@interface MineResult : BaseResult<MJKeyValue>

@end