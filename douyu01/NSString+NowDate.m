//
//  NSString+NowDate.m
//  douyu01
//
//  Created by xiaos on 15/11/18.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "NSString+NowDate.h"

@implementation NSString (NowDate)

+ (NSString *)getCurrentTime
{
    NSDate *date = [NSDate date];
    NSTimeInterval times = date.timeIntervalSince1970;
    return [NSString stringWithFormat:@"%.0f",times];
}

@end
