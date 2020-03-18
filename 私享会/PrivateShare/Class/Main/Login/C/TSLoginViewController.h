//
//  TSLoginViewController.h
//  PrivateShare
//
//  Created by apple2015 on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"
#import "LXNavBarController.h"

@interface TSLoginViewController : LXNavBarController

-(void)getCode:(BaseResp *)resp;

@end
