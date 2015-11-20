//
//  NetworkTool.m
//  douyu01
//
//  Created by xiaos on 15/11/18.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "NetworkTool.h"
#import "URLPool.h"

#import "XSHttpTool.h"
#import "MJExtension.h"
#import "NSString+NowDate.h"

#import "BaseParam.h"
#import "BaseResult.h"

#import "HomeModel.h"

@implementation NetworkTool

singleton_implementation(NetworkTool)       /** 实现单例 */

#pragma mark - 首页请求


- (void)netHomeTopSuccess:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    BaseParam *param = [BaseParam new];
    
    [XSHttpTool GET:URL_HOME_TOP param:param.keyValues success:^(id responseObject) {
        HomeTopResult *result = [HomeTopResult objectWithKeyValues:responseObject];
        if (success && [result.error isEqualToString:@"0"]) {
            NSMutableArray *titles = [NSMutableArray array];
            NSMutableArray *images = [NSMutableArray array];
            [result.data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                HomeTopModel *top = (HomeTopModel *)obj;
                [titles addObject:top.title];
                [images addObject:top.pic_url];
            }];
            success(@[titles,images]);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


- (void)netHomeSuccess:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    HomeParam *param = [HomeParam new];
    param.limit = @"4";
    
    [XSHttpTool GET:URL_HOME_CHANNAL_INFO param:param.keyValues success:^(id responseObject) {
        HomeResult *result = [HomeResult objectWithKeyValues:responseObject];
        if (success && [result.error isEqualToString:@"0"]) {
            success(result.data);
        }else{
            NSLog(@"%s request error",__func__);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)netHomeWithCateId:(NSString *)cateId times:(NSInteger)times success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    NSString *URL = [NSString stringWithFormat:@"%@%@",URL_HOME_CHANNAL_DETAIL,cateId];
    OnlineParam *param = [OnlineParam new];
    param.offset = [NSString stringWithFormat:@"%ld",(long)times*20];
    param.limit = @"20";
    
    [XSHttpTool GET:URL param:param.keyValues success:^(id responseObject) {
        OnlineResult *result = [OnlineResult objectWithKeyValues:responseObject];
        if (success && [result.error isEqualToString:@"0"]) {
            success(result.data);
        }else {
            NSLog(@"%@ %d request error",NSStringFromClass([self class]),__LINE__);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark - 栏目请求
- (void)netColumnSuccess:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    ColumnParam *param = [ColumnParam new];
    
    [XSHttpTool GET:URL_COLUMN_INFO param:param.keyValues success:^(id responseObject) {
        ColumnResult *result = [ColumnResult objectWithKeyValues:responseObject];
        if (success && [result.error isEqualToString:@"0"]) {
            success(result.data);
        }else{
            NSLog(@"%s request error",__func__);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark - 直播请求
- (void)netOnlineWithTimes:(NSInteger)times success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    OnlineParam *param = [OnlineParam new];
    param.offset = [NSString stringWithFormat:@"%ld",(long)times*20];
    param.limit = @"20";
    
    [XSHttpTool GET:URL_ONLINE_INFO param:param.keyValues success:^(id responseObject) {
        OnlineResult *result = [OnlineResult objectWithKeyValues:responseObject];
        if (success && [result.error isEqualToString:@"0"]) {
            success(result.data);
        }else {
            NSLog(@"%s request error",__func__);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark - 我的请求


@end
