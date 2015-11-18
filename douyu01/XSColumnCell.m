//
//  XSColumnCell.m
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "XSColumnCell.h"

#import "XSColumnModel.h"
#import "UIImageView+WebCache.h"

@interface XSColumnCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel     *title;
@end

@implementation XSColumnCell

- (void)setColumnModel:(XSColumnModel *)columnModel
{
    _columnModel = columnModel;
    self.title.text = columnModel.game_name;
    [self.image sd_setImageWithURL:[NSURL URLWithString:columnModel.game_src] placeholderImage:[UIImage imageNamed:@"Image_no_data"]];
}

@end
