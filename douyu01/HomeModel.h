//
//  HomeModel.h
//  douyu01
//
//  Created by xiaos on 15/11/18.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface HomeModel : NSObject<MJKeyValue>
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *cate_id;
@property (nonatomic,strong) NSArray  *roomlist;
@end

@interface roomModel : NSObject
@property (nonatomic,strong) NSString *room_id;
@property (nonatomic,strong) NSString *room_src;
@property (nonatomic,strong) NSString *cate_id;
@property (nonatomic,strong) NSString *room_name;
@property (nonatomic,strong) NSString *show_status;
@property (nonatomic,strong) NSString *show_time;
@property (nonatomic,strong) NSString *owner_uid;
@property (nonatomic,strong) NSString *specific_status;
@property (nonatomic,strong) NSString *vod_quality;
@property (nonatomic,strong) NSString *nickname;
@property (nonatomic,strong) NSString *online;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *game_url;
@property (nonatomic,strong) NSString *game_name;
@end

@interface HomeTopModel : NSObject
@property (nonatomic,strong) NSString     *title;
@property (nonatomic,strong) NSString     *pic_url;
@property (nonatomic,strong) NSDictionary *room;
@end