//
//  SYPrivateHouseKeeperViewController.m
//  PrivateShare
//
//  Created by bean on 2017/3/1.
//  Copyright © 2017年 xunbao. All rights reserved.
//

#import "SYPrivateHouseKeeperViewController.h"
#import "SYPrivateHouseKeeperView.h"

@interface SYPrivateHouseKeeperViewController ()<SYPriVateHouseProtocol>

@end

@implementation SYPrivateHouseKeeperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleStr = self.titleName;
    [self leftImageNormalStr:@"go_back_on" withAction:@selector(back)];
    self.view.backgroundColor = [UIColor whiteColor];
    SYPrivateHouseKeeperView * phView = [[SYPrivateHouseKeeperView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
    phView.syPHDelegate = self;
    [self.view addSubview:phView];
}

-(void)clickSignHouseKeeper
{
    NSLog(@"点击签约管家");
}

-(void)clickPhone
{
    NSLog(@"点击在线咨询");
}


@end
