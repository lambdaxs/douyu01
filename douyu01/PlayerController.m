//
//  PlayerController.m
//  douyu01
//
//  Created by xiaos on 15/11/19.
//  Copyright © 2015年 com.xsdota. All rights reserved.
//

#import "PlayerController.h"

#import "FMGVideoPlayView.h"
#import "YFViewPager.h"

@interface PlayerController ()<FMGVideoPlayViewDelegate>


@end

@implementation PlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initPlayerView];
    [self initPageView];
}

- (void)initPlayerView
{
    FMGVideoPlayView *playerView = [FMGVideoPlayView videoPlayView];
    playerView.delegate = self;
    playerView.urlString = self.hls_url;
    playerView.contrainerViewController = self;
    playerView.frame = CGRectMake(0, 20, self.view.frame.size.width, 200);
    [self.view addSubview:playerView];
}

- (void)initPageView
{
    NSArray *titles = @[@"聊天",@"主播",@"排行"];
    NSArray *views = @[[UIView new],[UIView new],[UIView new]];
    
    YFViewPager *pageView = [[YFViewPager alloc]
                             initWithFrame:CGRectMake(0, 220, self.view.frame.size.width, self.view.frame.size.height - 220)
                             titles:titles
                             icons:nil
                             selectedIcons:nil
                             views:views];
    
    [pageView didSelectedBlock:^(id viewPager, NSInteger index) {
        NSLog(@"%ld",(long)index);
    }];
    
    [self.view addSubview:pageView];
}

#pragma mark - 实现代理方法
-(void)backAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)shareAction
{
    NSLog(@"share!!!!");
}


@end

