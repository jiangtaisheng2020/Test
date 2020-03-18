//
//  AppDelegate.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//
 
#import "AppDelegate.h"
#import <MLTransition.h>
#import "LXNavigationController.h"
#import "H5LinksHandls.h"
#import "AppDelegate+SYLogin.h"
#import "UserGuideViewController.h"
@interface AppDelegate ()<UserGuideViewControllerDelegate>
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [MLTransition validatePanBackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypePan];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self startPicture];
    //获取H5链接
    [self performSelectorOnMainThread:@selector(getH5Links) withObject:nil waitUntilDone:NO];
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)loadRootViewController{

    NSString * isLogin = [[NSUserDefaults standardUserDefaults]objectForKey:kUDLoginSuccess];
    
    if ([isLogin isEqualToString:@"1"])
    {
        tabBarVC = [[LXTabBarController alloc] init];
        self.window.rootViewController = tabBarVC;
    }
    else
    {
        loginVC = [[TSLoginViewController alloc] init];
        LXNavigationController *nav = [[LXNavigationController alloc] initWithRootViewController:loginVC];
        nav.navigationBarHidden = YES;
        self.window.rootViewController = nav;
    }
}
-(void)startPicture
{
    //引导页 ，程序第一次进入有 ，以后进入没有
    
    NSUserDefaults * user=[NSUserDefaults standardUserDefaults];
    NSString * appfirst=[user objectForKey:@"appfirst"];
    if (appfirst) {
        //不是第一次进入
        [self loadRootViewController];
    }
    else {
        //    第一次
        UserGuideViewController *userGuideViewController = [[UserGuideViewController alloc] init];
        userGuideViewController.delgate=self;
        self.window.rootViewController = userGuideViewController;
        
    }
}

- (void)replaceSetRootViewController
{

    [self loadRootViewController];

}

/**
 *  请求配置文件
 *
 *  @param application
 */
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    //每次打开app请求一次请求H5链接
    [self getH5Links];

}


-(void)getH5Links
{

    NSString * h5Version = [[NSUserDefaults standardUserDefaults]objectForKey:@"h5Version"];
    if (h5Version == nil)
    {
        h5Version = @"0.00";
    }

    NSDictionary * dic = @{@"platform":@"1",@"versionId":h5Version};

    NSString * path = [NSString stringWithFormat:@"%@%@",kSXHXLSPath,kSXHH5LinksPath];
    //最终需要修改成这个,暂时用下面的本地
    [LXNetRequest postWithUrlString:path withParam:[NSMutableDictionary dictionaryWithDictionary:dic] success:^(NSDictionary *responseDic)
     {
         if ([responseDic[@"isNewest"]boolValue]==NO)
         {

#warning 需压迫修改
             [H5LinksHandls h5linksDic:responseDic];

         }

     } failure:^(NSError *error)
     {
         UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"失败,请检查网络" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
         [alert show];
     }];

}


@end
