//
//  public.h
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#ifndef public_h
#define public_h


//相对iphone6 屏幕比
#define KWidth    [UIScreen mainScreen].bounds.size.width

#define TabBar_T_Color RGB(244, 89, 27)

//RGB
#define RGBA(r, g, b, a)    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)     RGBA(r, g, b, 1.0f)

//系统版本
#define SYSTEM_VERSION   [[UIDevice currentDevice].systemVersion floatValue]

//设备物理尺寸
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height

//数据库表名
#define Document_Path  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]


#endif /* public_h */
