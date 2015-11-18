//
//  XSFirstCell.m
//  douyu01
//
//  Created by xiaos on 15/11/17.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "XSFirstCell.h"

@interface XSFirstCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userAvatar;

@end

@implementation XSFirstCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"XSFirstCell" owner:nil options:nil] firstObject];
        self.userAvatar.layer.cornerRadius  = 3.0f;
        self.userAvatar.layer.masksToBounds = YES;
    }
    return self;
}


@end
