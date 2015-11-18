//
//  XSColumnModel.h
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

/** 栏目模型 */
#import <Foundation/Foundation.h>

@interface XSColumnModel : NSObject

@property(nonatomic,strong)NSString *cate_id;           ///< id
@property(nonatomic,strong)NSString *game_name;         ///< 游戏名称
@property(nonatomic,strong)NSString *short_name;        ///< 短名称
@property(nonatomic,strong)NSString *game_url;          ///< 游戏URL
@property(nonatomic,strong)NSString *game_src;          ///< 图片URL
@property(nonatomic,strong)NSString *game_icon;         ///< 图片
@property(nonatomic,strong)NSString *online_room;       ///< 在线房间
@property(nonatomic,strong)NSString *online_room_ios;   ///< 在线房间ios端

@end
