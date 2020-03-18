//
//  SYMyInfoUpdateView.h
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SYUpdateDelegate <NSObject>

//绑定QQ
@optional

-(void)bdQQ:(NSString*)qq;

//修改昵称
-(void)bdNickName:(NSString*)nickName;

-(void)bdBackLast:(NSString*)nickName;




@end

@interface SYMyInfoUpdateView : UIView


@property(nonatomic,weak)UITextField * emailTextField;
@property(nonatomic,weak)id<SYUpdateDelegate>updateDelegate;


//返回[修改昵称所需]
-(void)backLast;
//上传
-(void)update;
/**
 *  传递过来的一些参数
 *
 *  @param frame     fram
 *  @param titleName 占位使用,除了绑定之外，不需要传
 *  @param number    需要绑定的号码,或是传递过来显示用的东西
 *
 *  @return self
 */
-(instancetype)initWithFrame:(CGRect)frame titleName:(NSString*)titleName number:(NSString*)number;


@end
