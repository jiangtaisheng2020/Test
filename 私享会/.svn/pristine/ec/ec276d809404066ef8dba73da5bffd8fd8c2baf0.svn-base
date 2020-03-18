//
//  LXTabBarController.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXTabBarController.h"
#import "LXFindController.h"
#import "LXCustomController.h"
#import "LXHomeController.h"
#import "LXProfileController.h"
#import "LXNavigationController.h"

#import "SYH5ViewController.h"

@interface LXTabBarController ()

@end

@implementation LXTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LXHomeController *homeVC = [[LXHomeController alloc] init];
    [self addOneChlildVc:homeVC title:@"首页" navigationTitle:@"首页" imageName:@"home1" selectedImageName:@"home2"];
    
    LXFindController *findVC = [[LXFindController alloc] init];
    [self addOneChlildVc:findVC title:@"发现" navigationTitle:@"发现" imageName:@"find1" selectedImageName:@"find2"];
    /*
    LXCustomController *customVC = [[LXCustomController alloc] init];
    [self addOneChlildVc:customVC title:@"定制" navigationTitle:@"定制" imageName:@"custom1" selectedImageName:@"custom2"];
    */
    SYH5ViewController * h5 = [[SYH5ViewController alloc] init];
    h5.urlSting = @"https://www.baidu.com";
    [self addOneChlildVc:h5 title:@"定制" navigationTitle:@"定制" imageName:@"custom1" selectedImageName:@"custom2"];
    
    LXProfileController *profileVC = [[LXProfileController alloc] init];
    [self addOneChlildVc:profileVC title:@"我的" navigationTitle:@"我的" imageName:@"USER" selectedImageName:@"USER2"];
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"bg_tab"];
    self.tabBar.translucent = NO;
}

- (void)addOneChlildVc:(LXNavBarController *)childVc title:(NSString *)title navigationTitle:(NSString *)navTitle imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVc.title = title;
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = kBlueFontColor;
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    childVc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    LXNavigationController *nav = [[LXNavigationController alloc] initWithRootViewController:childVc];
    nav.navigationBarHidden = YES;
    childVc.titleStr = navTitle;
    [self addChildViewController:nav];
}

@end
