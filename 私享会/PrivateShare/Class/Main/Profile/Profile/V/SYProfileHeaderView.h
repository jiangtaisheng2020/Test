//
//  SYProfileHeaderView.h
//  PrivateShare
//
//  Created by bean on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//
@protocol SYProfileHeaderDelegate <NSObject>

-(void)didSelectAva;

@end

#import <UIKit/UIKit.h>

@interface SYProfileHeaderView : UIView

@property(nonatomic,weak)id<SYProfileHeaderDelegate>proHeaderDel;

-(void)loadData:(UIImageView*)avaImgV;


@end
