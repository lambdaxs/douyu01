//
//  BaseResult.m
//  douyu01
//
//  Created by xiaos on 15/11/18.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "BaseResult.h"

#import "XSColumnModel.h"
#import "HomeModel.h"

@implementation BaseResult

@end

@implementation HomeResult
+ (NSDictionary *)objectClassInArray
{
    return @{@"data":[HomeModel class]};
}
@end

@implementation HomeTopResult
+ (NSDictionary *)objectClassInArray
{
    return @{@"data":[HomeTopModel class]};
}
@end

@implementation ColumnResult
+ (NSDictionary *)objectClassInArray
{
    return @{@"data":[XSColumnModel class]};
}
@end

@implementation OnlineResult
+ (NSDictionary *)objectClassInArray
{
    return @{@"data":[roomModel class]};
}
@end

@implementation MineResult


@end