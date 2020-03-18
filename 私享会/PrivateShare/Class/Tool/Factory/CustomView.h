//
//  CustomView.h
//  PrivateShare
//
//  Created by apple2015 on 16/9/21.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomViewDelegate <NSObject>

- (void)customViewHandleTap;

@end
@interface CustomView : UIView

@property(nonatomic,copy)NSString *titleStr;
@property(nonatomic,copy)NSString * iconStr;
@property(nonatomic,assign) id  <CustomViewDelegate> delegate;

@end
