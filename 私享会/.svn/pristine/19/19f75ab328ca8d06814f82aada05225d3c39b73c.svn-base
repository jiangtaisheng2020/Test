//
//  SYMySignView.h
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//
@protocol SYMySignDelegate <NSObject>

-(void)mySignUpdata:(NSString*)mySign;

-(void)mySignBackLast:(NSString*)mySign;
@end


#import <UIKit/UIKit.h>

@interface SYMySignView : UIView

@property(nonatomic,weak)UITextView * mySignTextView;
@property(nonatomic,weak)id<SYMySignDelegate>mySignDel;
-(void)updata;

-(void)backLast;

@end
