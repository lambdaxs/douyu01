//
//  XSOnlineModel.m
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "XSOnlineModel.h"

@implementation XSOnlineModel


- (void)setOnline:(NSString *)online
{
    float onlineNum = [online floatValue];
    if (onlineNum < 10000)
    {/** 小于一万 */
        _online = [NSString stringWithFormat:@"%ld",(NSInteger)onlineNum];
        return;
    }
    else
    {/** 大于一万 */
        _online = [NSString stringWithFormat:@"%.1f万",onlineNum/10000];
        return;
    }

}


@end
