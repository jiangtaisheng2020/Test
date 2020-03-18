//
//  SYCleanView.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYCleanView.h"

@interface SYCleanView()

@property(nonatomic,weak)UIView * bgView;

@property(nonatomic,weak)UIView * showView;

@property(nonatomic,weak)UIButton * sureBtn;

@property(nonatomic,weak)UIButton * cancelBtn;

@property(nonatomic,weak)UILabel * contentLable;



@end

@implementation SYCleanView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self creatUI];
    }
    
    return self;
}

-(void)creatUI
{
    
    UIView * bgV = [[UIView alloc]initWithFrame:self.frame];
    bgV.alpha = 0.5;
    bgV.backgroundColor = [UIColor blackColor];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancle)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [bgV addGestureRecognizer:tap];
    self.bgView = bgV;
    [self addSubview:self.bgView];
    
    
    UIView * sView = [[UIView alloc]initWithFrame:CGRectMake(50, 200, kScreenWidth-100, 135)];
    sView.backgroundColor = [UIColor whiteColor];
    self.showView = sView;
    [self addSubview:self.showView];
    
    
    UILabel * cLB = [[UILabel alloc]initWithFrame:CGRectMake(0, (135-44)/2-18/2, sView.frame.size.width, 18)];
    cLB.textColor = kBlackFontColor;
    cLB.font = [UIFont systemFontOfSize:18];
    cLB.textAlignment = 1;
    cLB.text = @"是否清除缓存";
    self.contentLable = cLB;
    [sView addSubview:self.contentLable];
    
    
    UIButton * cBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cBtn.frame = CGRectMake(0, 135-44, sView.frame.size.width/2, 44);
    [cBtn addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
    [cBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cBtn setBackgroundColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1]];
//    cBtn.titleLabel.text = @"取消";
    cBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    cBtn.titleLabel.textColor = [UIColor whiteColor];
    self.cancelBtn = cBtn;
    [sView addSubview:self.cancelBtn];
    
    
    
    UIButton * sBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sBtn.frame = CGRectMake(sView.frame.size.width/2, 135-44, sView.frame.size.width/2, 44);
    [sBtn addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    [sBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sBtn setBackgroundColor:kBlueFontColor];
//    sBtn.titleLabel.text = @"确定";
    sBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    sBtn.titleLabel.textColor = [UIColor whiteColor];
    self.sureBtn = sBtn;
    [sView addSubview:self.sureBtn];
}




#pragma mark - Private methods

-(void)sure
{
    [_cleanDel sureClean];
}

-(void)cancle
{
    [_cleanDel cancelClean];
}



@end
