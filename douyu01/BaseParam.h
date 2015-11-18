//
//  BaseParam.h
//  douyu01
//
//  Created by xiaos on 15/11/18.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseParam : NSObject
@property (nonatomic,strong) NSString *aid;         ///< 客户端id      默认是ios
@property (nonatomic,strong) NSString *auth;        ///< 授权码
@property (nonatomic,strong) NSString *client_sys;  ///< 客户端系统类型 默认是ios
@property (nonatomic,strong) NSString *time;        ///< 请求时间      默认是1446450360
@end

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>栏目
@interface ColumnParam : BaseParam

@end

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>直播
@interface OnlineParam : BaseParam
@property (nonatomic,strong) NSString *limit;       ///< 每次请求获得结果个数
@property (nonatomic,strong) NSString *offset;      ///< 每次请求的偏移量 一般是limit的整数倍
@end