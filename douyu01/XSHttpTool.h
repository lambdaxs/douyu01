//
//  XSHttpTool.h
//  送给越越的微博
//
//  Created by xiaos on 15/11/10.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSHttpTool : NSObject
/** 普通GET请求 */
+ (void)GET:(NSString *)URLStr
        param:(id)param
        success:(void(^)(id responseObject))success
        failure:(void(^)(NSError *error))failure;

/** 普通POST请求 */
+ (void)POST:(NSString *)URLStr
      param:(id)param
    success:(void(^)(id responseObject))success
    failure:(void(^)(NSError *error))failure;

/** 上传文件POST请求 */
//+ (void)GET:(NSString *)URLStr
//      param:(id)param
//    success:(void(^)(id responseObject))success
//    failure:(void(^)(NSError *error))failure;


@end
