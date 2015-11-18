//
//  NetworkTool.m
//  douyu01
//
//  Created by xiaos on 15/11/18.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "NetworkTool.h"
#import "MJExtension.h"
#import "XSHttpTool.h"

#import "BaseParam.h"
#import "BaseResult.h"


@implementation NetworkTool
singleton_implementation(NetworkTool)

- (void)netColumnSuccess:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    NSString *URL = @"http://www.douyutv.com/api/v1/game";
    ColumnParam *param = [ColumnParam new];
    
    [XSHttpTool GET:URL param:param.keyValues success:^(id responseObject) {
        ColumnResult *result = [ColumnResult objectWithKeyValues:responseObject];
        if (success) {
            success(result.data);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)netOnlineWithTimes:(NSInteger)times success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    NSString *URL = @"http://www.douyutv.com/api/v1/live";
    OnlineParam *param = [OnlineParam new];
    param.offset = [NSString stringWithFormat:@"%ld",(long)times*20];
    param.limit = @"20";
    
    [XSHttpTool GET:URL param:param.keyValues success:^(id responseObject) {
        OnlineResult *result = [OnlineResult objectWithKeyValues:responseObject];
        if (success) {
            success(result.data);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
