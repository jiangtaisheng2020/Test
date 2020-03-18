//
//  LXProfileController.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXProfileController.h"
#import "SYProfileTableView.h"

#import "SYSettingViewController.h"//设置界面
#import "SYMyInfoViewController.h"//编辑个人信息


@interface LXProfileController()<SYProfileDelegate>
{
    NSMutableArray * data;
    SYProfileTableView * profilView;
}


@end

@implementation LXProfileController


#pragma mark - Life cycle
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (data!=nil) {
        [profilView loadData:data];
    }
}
#pragma mark - Create view
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    data = [[NSMutableArray alloc]init];
    
    NSDictionary * dic1 = @{@"title":@"我的订单",@"img":@"Clipboard"};
    
    [data addObject:dic1];
    
    
    NSDictionary * dic2 = @{@"title":@"设置",@"img":@"film-reel"};
    [data addObject:dic2];
    
    
    profilView = [[SYProfileTableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    profilView.backgroundColor = kBackGroundColor;
    profilView.profileDel = self;
    profilView.scrollEnabled = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [profilView loadData:data];
    [self.view addSubview:profilView];
    
}


#pragma mark - CustomDelegate
-(void)didSeleceCell:(NSIndexPath*)indexPath
{
    
    switch (indexPath.row) {
        case 0:
        {
            //我的账单
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"您没有订单" message:@"" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            [alert show];
        }
            break;
        case 1:
        {
            //设置
            SYSettingViewController * setting = [[SYSettingViewController alloc]init];
            [self.navigationController pushViewController:setting animated:YES];
        }
            
            break;
        default:
            break;
    }
}

-(void)didTapEdit
{
    SYMyInfoViewController * myinfo = [[SYMyInfoViewController alloc]init];
    [self.navigationController pushViewController:myinfo animated:YES];
}

#pragma mark - Observer

#pragma mark - Event response

#pragma mark - Private methods

#pragma mark - Setter and getter
@end
