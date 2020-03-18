//
//  UserGuideViewController.h
//  PrivateShare
//
//  Created by apple2015 on 16/9/26.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserGuideViewControllerDelegate <NSObject>

- (void)replaceSetRootViewController;

@end
@interface UserGuideViewController : UIViewController
@property(nonatomic,assign)id <UserGuideViewControllerDelegate>  delgate;
@end
