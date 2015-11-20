//
//  XSHttpTool.m
//  送给越越的微博
//
//  Created by xiaos on 15/11/10.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "XSHttpTool.h"
#import "AFNetworking.h"

@implementation XSHttpTool

+ (void)GET:(NSString *)URLStr
      param:(id)param
    success:(void (^)(id))success
    failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:URLStr
      parameters:param
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)POST:(NSString *)URLStr
       param:(id)param
     success:(void (^)(id))success
     failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:URLStr
       parameters:param
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
