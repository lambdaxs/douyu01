//
//  NetworkTool.h
//  douyu01
//
//  Created by xiaos on 15/11/18.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface NetworkTool : NSObject

singleton_interface(NetworkTool)
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>首页



//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>栏目
/** 获取栏目信息 */
- (void)netColumnSuccess:(void(^)(NSArray *data))success failure:(void(^)(NSError *error))failure;

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>直播
/** 获取直播信息 times是下拉次数*/
- (void)netOnlineWithTimes:(NSInteger)times success:(void(^)(NSArray *data))success failure:(void(^)(NSError *error))failure;


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>我
/** 用户登录 */

@end
