//
//  AppDelegate+SYLogin.m
//  PrivateShare
//
//  Created by bean on 16/9/22.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "AppDelegate+SYLogin.h"
#import "WXApi.h"
#import "TSLoginViewController.h"
#import "LXTabBarController.h"
#import "LXNavigationController.h"
@implementation AppDelegate (SYLogin)

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WXApi handleOpenURL:url delegate:self];
}

- (void) SuccCode:(NSString *)succOrerr WithOnresp:(BaseResp *)resp
{
    if (self.paysuccBlock)
    {
        self.paysuccBlock(succOrerr);
        self.paysuccBlock=nil;
    }else
    {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"AllPostViewController" object:resp];
    }
}

//#pragma mark 微信授权回调
-(void)onResp:(BaseResp *)resp
{
    //测试微信支付
    if ([resp isKindOfClass:[PayResp class]])
    {
        PayResp*response=(PayResp*)resp;
        switch(response.errCode)
        {
            case WXSuccess://服务器端查询支付通知或查询API返回的结果再提示成功
            {
                [self SuccCode:@"succ" WithOnresp:resp];
            }
                break;
            default:
            {
                [self SuccCode:@"err" WithOnresp:resp];
            }
                
                break;
        }
    }
    else if ([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        //分享链接
        //errCode:::0 分享成功
    }
    else
    {
        [loginVC getCode:resp];
    }
    
}

- (void)setRootwithTabBar
{
    [self removeRootController];
    LXTabBarController * tab = [[LXTabBarController alloc]init];
    self.window.rootViewController = tab;
    
}

- (void)removeRootController
{
    if (self.window.rootViewController)
    {
        [self.window.rootViewController removeFromParentViewController];
        self.window.rootViewController = nil;
    }
}


- (void)setRootwithLogin
{
    [self removeRootController];
    loginVC = [[TSLoginViewController alloc]init];
    LXNavigationController * nav = [[LXNavigationController alloc]initWithRootViewController:loginVC];
    nav.navigationBarHidden = YES;
    self.window.rootViewController = nav;
}



@end
