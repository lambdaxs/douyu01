//
//  XSMainCell.m
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "XSMainCell.h"

#import "HomeModel.h"
#import "UIImageView+WebCache.h"

@interface XSMainCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;    ///< 房间图片
@property (weak, nonatomic) IBOutlet UILabel *roomName;         ///< 房间名字
@property (weak, nonatomic) IBOutlet UILabel *nickName;         ///< 主播名字
@property (weak, nonatomic) IBOutlet UILabel *online;             ///< 粉丝人数
@end

@implementation XSMainCell

- (void)setRoomModel:(roomModel *)roomModel
{
    _roomModel = roomModel;
    /** 房间名字 */
    self.roomName.text = roomModel.room_name;
    /** 主播名字 */
    self.nickName.text = roomModel.nickname;
    /** 观看人数 */
    self.online.text = roomModel.online;
    /** 设置图片 */
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:roomModel.room_src] placeholderImage:[UIImage imageNamed:@"Img_default"]];
}



@end
