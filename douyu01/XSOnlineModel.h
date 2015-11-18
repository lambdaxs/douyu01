//
//  XSOnlineModel.h
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSOnlineModel : NSObject

@property(nonatomic,strong)NSString *room_id;       ///< 房间号
@property(nonatomic,strong)NSString *room_src;      ///< 图片
@property(nonatomic,strong)NSString *cate_id;       ///< id
@property(nonatomic,strong)NSString *room_name;     ///< 房间名字
@property(nonatomic,strong)NSString *show_status;   ///< 显示状态
@property(nonatomic,strong)NSString *show_time;     ///< 播放时间
@property(nonatomic,strong)NSString *owner_uid;     ///< 房主id
@property(nonatomic,strong)NSString *nickname;      ///< 主播昵称
@property(nonatomic,strong)NSString *online;        ///< 在线人数
@property(nonatomic,strong)NSString *url;           ///< URL
@property(nonatomic,strong)NSString *game_url;      ///< 游戏URL
@property(nonatomic,strong)NSString *game_name;     ///< 游戏名称
@property(nonatomic,strong)NSString *fans;          ///< 粉丝数

@end
