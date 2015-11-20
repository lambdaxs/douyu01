//
//  HomeHeadView.m
//  douyu01
//
//  Created by xiaos on 15/11/19.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "HomeHeadView.h"

@interface HomeHeadView ()

@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation HomeHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews
{
    self.titleLabel = [UILabel new];
    self.titleLabel.textColor = [UIColor blackColor];
    [self.titleLabel sizeToFit];
    [self addSubview:self.titleLabel];
}

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    self.titleLabel.text = title;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(5, 0, 80, 29);

}


@end
