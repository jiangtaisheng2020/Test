//
//  SYChooseHomeView.m
//  PrivateShare
//
//  Created by bean on 16/9/21.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYChooseHomeView.h"

@interface SYChooseHomeView()

@property(nonatomic,weak)UIImageView * iconImgV;
@property(nonatomic,weak)UILabel * titleLable;

@end

@implementation SYChooseHomeView



-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self creatUI];
    }
    
    return self;
}

-(void)creatUI
{
    UIImageView * iconView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 15, 50, 50)];
    self.iconImgV = iconView;
    [self addSubview:self.iconImgV];
    
    
    UILabel * titleLable = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(iconView.frame)+10, 70, 15)];
    titleLable.font = [UIFont systemFontOfSize:15];
    titleLable.textAlignment = 1;
    titleLable.textColor = kBlackFontColor;
    self.titleLable = titleLable;
    [self addSubview:self.titleLable];
}



#pragma mark - Interface
-(void)loadDate:(NSString*)titleText icon:(NSString*)icon
{
    self.iconImgV.image = [UIImage imageNamed:icon];
    
    self.titleLable.text = titleText;
}

@end
