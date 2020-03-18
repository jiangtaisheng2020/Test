//
//  SYPrivateHouseKeeperView.m
//  PrivateShare
//
//  Created by bean on 2017/3/1.
//  Copyright © 2017年 xunbao. All rights reserved.
//

#import "SYPrivateHouseKeeperView.h"

@interface SYPrivateHouseKeeperView()
@property(nonatomic,weak)UIImageView * bannerImgView;
@property(nonatomic,weak)UILabel * contentLable;
@property(nonatomic,weak)UIButton * phoneButton;
@property(nonatomic,weak)UIButton * signButton;
@end
@implementation SYPrivateHouseKeeperView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //需要修改
        UIImageView * topImgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 120)];
        topImgV.image = [UIImage imageNamed:@"private_house_banner"];
        self.bannerImgView = topImgV;
        [self addSubview:self.bannerImgView];
        
        
        UILabel *contentLB = [[UILabel alloc] initWithFrame:CGRectMake(18, CGRectGetMaxY(self.bannerImgView.frame)+27, frame.size.width-36,0)];
        contentLB.text = @"        私人管家一对一专属服务，是高大上生活不可或缺的一个重要部分。是否还在自己设计旅游路线？是否还在为下班后想去哪里放松一下工作的疲惫发愁？想给家人和朋友一个惊喜，所需的策划和人手，各种形式的聚会还用亲自提前到现场布置吗？出席一些特殊的场合，如果有一位专职司机为您提供服务呢？有可能就像电影里演的一样，一个管家特绅士的那种，一口地道的英国腔“May I help you,sir?”以上的问题都“倍儿有面子”了呢。\n        私人管家为您生活提供便利与服务，尽我们所能让您享受高品质的生活！";
        contentLB.font = [UIFont systemFontOfSize:15];
        contentLB.numberOfLines = 0;
        CGFloat height = [self getHeightByWidth:contentLB.frame.size.width title:contentLB.text font:contentLB.font];
        contentLB.frame = CGRectMake(18, CGRectGetMaxY(self.bannerImgView.frame)+27, frame.size.width-36, height);
        self.contentLable = contentLB;
        [self addSubview:self.contentLable];
        
        
        UIButton * phButton = [UIButton buttonWithType:UIButtonTypeCustom];
        phButton.frame = CGRectMake(0, frame.size.height-38, frame.size.width/2, 38);
        [phButton setBackgroundImage:[UIImage imageNamed:@"private_house_question"] forState:UIControlStateNormal];
        [phButton setTitle:@"常见问题" forState:UIControlStateNormal];
        phButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [phButton addTarget:self action:@selector(phoneClick) forControlEvents:UIControlEventTouchUpInside];
        self.phoneButton = phButton;
        [self addSubview:self.phoneButton];
        
        
        UIButton * signButton = [UIButton buttonWithType:UIButtonTypeCustom];
        signButton.frame = CGRectMake(frame.size.width/2, frame.size.height-38, frame.size.width/2, 38);
        [signButton setBackgroundImage:[UIImage imageNamed:@"private_house_order"] forState:UIControlStateNormal];
        [signButton setTitle:@"预约管家" forState:UIControlStateNormal];
        signButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [signButton addTarget:self action:@selector(signClick) forControlEvents:UIControlEventTouchUpInside];
        self.signButton = signButton;
        [self addSubview:self.signButton];
        
    }
    return self;
}

-(CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}


-(void)phoneClick
{
    [_syPHDelegate clickPhone];
}

-(void)signClick
{
    [_syPHDelegate clickSignHouseKeeper];
}

@end
