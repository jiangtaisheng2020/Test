//
//  SYAboutView.m
//  tttttttttttt
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 com.xile. All rights reserved.
//



#import "SYAboutView.h"

@interface SYAboutView ()


@property(nonatomic,weak)UIImageView * topImgV;
@property(nonatomic,weak)UILabel * appNameLable;
@property(nonatomic,weak)UIImageView * versionImgV;
@property(nonatomic,weak)UILabel * versionLable;
@property(nonatomic,weak)UILabel * introLable;
@property(nonatomic,weak)UILabel * midLable;
@property(nonatomic,weak)UILabel * companyLable;

@end

@implementation SYAboutView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self creatUI];
    }
    
    return self;
}

-(void)creatUI
{
    
    
    
    UIImageView * bgImgV = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    bgImgV.image = [UIImage imageNamed:@"aboutbg"];
    [self addSubview:bgImgV];
    
    
    
    float tImgW = 100;
    UIImageView * tImgV = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2-tImgW/2,  36, tImgW, tImgW)];
    tImgV.image = [UIImage imageNamed:@"logo"];
    tImgV.layer.cornerRadius = tImgW/2;
    tImgV.clipsToBounds = YES;
    self.topImgV = tImgV;
    [self addSubview:self.topImgV];
    
    float vImgW = 50;
    UIImageView * vImgV = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.topImgV.frame)+2,  36, vImgW+10, vImgW)];
    vImgV.image = [UIImage imageNamed:@"version"];
    self.versionImgV = vImgV;
    [self addSubview:self.versionImgV];
    
    float tLbW = 200;
    UILabel * tLable = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-tLbW/2, CGRectGetMaxY(tImgV.frame)+13, tLbW, 23)];
    tLable.textColor = kBlackFontColor;
    tLable.font = [UIFont systemFontOfSize:23];
    tLable.textAlignment = 1;
    tLable.text = @"思享会";
    self.appNameLable = tLable;
    [self addSubview:self.appNameLable];
    
    
    //显示当前版本号
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    NSString * vStr = [NSString stringWithFormat:@"V%@",currentVersion];
    float vLbW = 70;
    UILabel * vLable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.topImgV.frame)-5,  36+15, vLbW, 16)];
    vLable.textColor = kBlueFontColor;
    vLable.font = [UIFont systemFontOfSize:16];
    vLable.textAlignment = 1;
    vLable.text = vStr;
    self.versionLable = vLable;
    [self addSubview:self.versionLable];
    
    
    UILabel * introLable = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.appNameLable.frame)+63, kScreenWidth, 27*3)];
    introLable.textColor = kBlueFontColor;
    introLable.font = [UIFont systemFontOfSize:18];
    introLable.text = [NSString stringWithFormat:@"生活中善于“思”考的人，\n才会优先“享”受到高品质的生活！"];
    introLable.numberOfLines = 0;
    introLable.textAlignment = 1;
    self.introLable = introLable;
    [self addSubview:self.introLable];
    
    float mLbW = 200;
    UILabel * mLable = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-mLbW/2, CGRectGetMaxY(self.introLable.frame)+75, mLbW, (19+4)*2)];
    mLable.textColor = kBlackFontColor;
    mLable.font = [UIFont systemFontOfSize:18];
    mLable.textAlignment = 1;
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"思享会承诺\n\"拒绝平庸，有我不同\"。"];
    [str addAttribute:NSForegroundColorAttributeName value:kBlueFontColor range:NSMakeRange(0,3)];
    mLable.attributedText = str;
    mLable.numberOfLines = 0;
    self.midLable = mLable;
    [self addSubview:self.midLable];
    
    
    float cLbW = 300;
    UILabel * cLable = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-cLbW/2, CGRectGetMaxY(self.midLable.frame)+106, cLbW, 18)];
    cLable.textColor = [UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1];
    cLable.font = [UIFont systemFontOfSize:18];
    cLable.textAlignment = 1;
    cLable.text = @"北京浩云天瑞投资管理有限公司";
    self.companyLable = cLable;
    [self addSubview:self.companyLable];

}


@end
