//
//  SYSettingViewController.m
//  PrivateShare
//
//  Created by bean on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYSettingViewController.h"
#import "SYSettingTableView.h"
#import "ProposedViewController.h"
#import "SYAboutViewController.h"//关于我们

#import "WdCleanCaches.h"
#import "SYCleanView.h"
#import "LXHelpClass.h"
#import "AppDelegate+SYLogin.h"
@interface SYSettingViewController ()<SYSettingDelegate,SYCleanDelegate>
{
    NSString * cachePath;
    SYSettingTableView * settingView;
    NSMutableArray * data;
    SYCleanView * cleanV;
}

@end

@implementation SYSettingViewController

#pragma mark - Life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titleStr = @"设置";

    [self leftImageNormalStr:@"go_back_on" withAction:@selector(back)];
    
    data = [[NSMutableArray alloc]init];
    
    NSDictionary * dic1 = @{@"title":@"关于我们"};
    [data addObject:dic1];
    
    
    NSDictionary * dic2 = @{@"title":@"意见反馈"};
    [data addObject:dic2];
    
    
    double cache = [self countCache];
    
    NSString * cacheStr;
    if (cache == 0)
    {
        cacheStr = @"";
    }
    else
    {
        cacheStr = [NSString stringWithFormat:@"%.1fM",cache];
    }
    
    NSDictionary * dic3 = @{@"title":@"清除缓存",@"cache":cacheStr};
    [data addObject:dic3];
    
    
    settingView = [[SYSettingTableView alloc]initWithFrame:CGRectMake(0, 10+64, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    settingView.backgroundColor = kBackGroundColor;
    settingView.setDel = self;
    settingView.scrollEnabled = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [settingView loadData:data];
    [self.view addSubview:settingView];
    
    
    [settingView addSubview:self.HUD];
    
}


#pragma mark - CustomDelegate
-(void)didSeleceCell:(NSIndexPath *)indexPath
{
    
    
    switch (indexPath.row) {
        case 0:
        {
            //关于我们
            SYAboutViewController * about = [[SYAboutViewController alloc]init];
            [self.navigationController pushViewController:about animated:YES];

        }
            break;
        case 1:
        {
            //意见反馈
            ProposedViewController * vc=[[ProposedViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            //清除缓存
            [self wannaClean];
        }
            break;
            
        default:
            break;
    }
}




#pragma mark - Private methods
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)wannaClean
{
    cleanV = [[SYCleanView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    cleanV.cleanDel = self;
    [self.view addSubview:cleanV];
}

-(double)countCache
{
    //获取缓存沙盒路径
    NSString * zhid = [[NSUserDefaults standardUserDefaults]objectForKey:kUDZhid];
    cachePath = [NSString stringWithFormat:@"%@/Library/appdata/%@",NSHomeDirectory(),zhid];
//    cachePath =  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//    NSString * cookiePath =[NSString stringWithFormat:@"%@/Library/Cookies",NSHomeDirectory()];
    return [WdCleanCaches sizeWithFilePaht:cachePath];
}

-(void)removeView
{
    [UIView animateWithDuration:1 animations:^{
        [cleanV removeFromSuperview];
    }];
}

#pragma mark - CustomDelegate

-(void)sureClean
{
    [WdCleanCaches clearCachesWithFilePath:cachePath];
    [data replaceObjectAtIndex:2 withObject:@{@"title":@"清除缓存",@"cache":@""}];
    [settingView loadData:data];
    [self removeView];
    
    
}

-(void)cancelClean
{
    [self removeView];
}

-(void)logOut
{
    DeLog(@"退出登录");
    self.HUD.label.text = @"正在退出";
    [self.HUD showAnimated:YES];
    
    NSString * url = [NSString stringWithFormat:@"%@%@%@",kSXHHttpPath,kSXHLoginOutServerlet,@"zhid=%@&website=%@"];
    NSString * zhid = [[NSUserDefaults standardUserDefaults]objectForKey:kUDZhid];
    NSString * urlPath = [NSString stringWithFormat:url,zhid,kSXHWebSite];
    [LXNetRequest getWithUrlString:urlPath withParam:nil success:^(NSDictionary *responseDic) {
//        DeLog(@"%@",responseDic);
        int code = [responseDic[@"Code"]intValue];
        if (code == 2008)
        {
            [self hudHideTextStr:@"失败,请检查网络" delayTime:2.0];
            [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:kUDLoginSuccess];
            [[LXHelpClass appDelegate] setRootwithLogin];

        }
        else
        {
            [self hudHideTextStr:[NSString stringWithFormat:@"退出失败,%@",responseDic[@"msg"]] delayTime:2.0];

        }
    } failure:^(NSError *error) {
//        DeLog(@"%@",error.description);
        [self hudHideTextStr:@"失败,请检查网络" delayTime:2.0];
    }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
