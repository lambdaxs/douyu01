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
/** 获取首页顶部banner数据 */
- (void)netHomeTopSuccess:(void(^)(NSArray *tops))success
                  failure:(void(^)(NSError *error))failure;

/** 获得首页数据 */
- (void)netHomeSuccess:(void(^)(NSArray *data))success
               failure:(void(^)(NSError *error))failure;
/** 获得首页某频道所有数据 */
- (void)netHomeWithCateId:(NSString *)cateId
                    times:(NSInteger)times
                  success:(void(^)(NSArray *data))success
                  failure:(void(^)(NSError *error))failure;

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>栏目
/** 获取所有栏目信息 */
- (void)netColumnSuccess:(void(^)(NSArray *data))success
                 failure:(void(^)(NSError *error))failure;

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>直播
/** 获取所有直播信息*/
- (void)netOnlineWithTimes:(NSInteger)times
                   success:(void(^)(NSArray *data))success
                   failure:(void(^)(NSError *error))failure;


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>我
/** 用户登录 */

@end
