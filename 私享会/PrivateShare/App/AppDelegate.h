//
//  AppDelegate.h
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//
 
#import <UIKit/UIKit.h>

#import "LXTabBarController.h"
#import "RegisterViewController.h"
#import "TSLoginViewController.h"

typedef void (^PaySuccBlock)(NSString *);

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    TSLoginViewController * loginVC;
    LXTabBarController * tabBarVC;
}

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,copy) PaySuccBlock  paysuccBlock;


@end

