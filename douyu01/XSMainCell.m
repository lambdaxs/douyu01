//
//  XSMainCell.m
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "XSMainCell.h"

#import "XSOnlineModel.h"

#import "UIImageView+WebCache.h"

@interface XSMainCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;    ///< 房间图片
@property (weak, nonatomic) IBOutlet UILabel *roomName;         ///< 房间名字
@property (weak, nonatomic) IBOutlet UILabel *nickName;         ///< 主播名字
@property (weak, nonatomic) IBOutlet UILabel *online;             ///< 粉丝人数
@end

@implementation XSMainCell

- (void)setOnlineModel:(XSOnlineModel *)onlineModel
{
    _onlineModel = onlineModel;
    /** 房间名字 */
    self.roomName.text = onlineModel.room_name;
    /** 主播名字 */
    self.nickName.text = onlineModel.nickname;
    /** 观看人数 */
    self.online.text = onlineModel.online;
    /** 设置图片 */
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:onlineModel.room_src] placeholderImage:[UIImage imageNamed:@"Img_default"]];
    
}


@end
