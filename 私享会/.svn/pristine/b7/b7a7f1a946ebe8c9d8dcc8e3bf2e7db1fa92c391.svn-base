//
//  SYProfileHeaderView.m
//  PrivateShare
//
//  Created by bean on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYProfileHeaderView.h"

@interface SYProfileHeaderView()

@property(nonatomic,weak)UIImageView * backgroundImgV;

@property(nonatomic,weak)UILabel * infoLable;

@property(nonatomic,weak)UIImageView * avatarImgV;

@end

@implementation SYProfileHeaderView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
        [self creatView];
        
    }
    
    return self;
}



-(void)creatView
{
    UIImageView * topBackImgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 132)];
    topBackImgV.image = [UIImage imageNamed:@"profilebg"];
    self.backgroundImgV = topBackImgV;
    [self addSubview:self.backgroundImgV];
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapEdit)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    
    
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapEdit)];
    tap1.numberOfTapsRequired = 1;
    tap1.numberOfTouchesRequired = 1;
    
    
    
    float imgW = 186/2;
    UIImageView * avatarImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2-imgW/2, 67, imgW, imgW)];
    NSData * avatar = [[NSUserDefaults standardUserDefaults]objectForKey:kUDAvatarImgData];
    if (avatar == nil) {
        avatar = UIImagePNGRepresentation([UIImage imageNamed:@"head"]);
    }
    UIImage * image = [UIImage imageWithData:avatar];
    avatarImgView.image = image;
    avatarImgView.layer.borderWidth = 2;
    avatarImgView.layer.borderColor = [UIColor whiteColor].CGColor;
    avatarImgView.clipsToBounds = YES;
    avatarImgView.layer.cornerRadius = imgW/2;
    avatarImgView.userInteractionEnabled = YES;
    [avatarImgView addGestureRecognizer:tap1];
    self.avatarImgV = avatarImgView;
    [self addSubview:self.avatarImgV];
    
    
    float lableW = 200;
    UILabel * editLable = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-lableW/2, CGRectGetMaxY(self.avatarImgV.frame)+7, lableW, 15)];
    editLable.textAlignment = 1;
    editLable.textColor = kBlueFontColor;
    editLable.font = [UIFont systemFontOfSize:15];
    editLable.text = @"编辑个人信息";
    editLable.userInteractionEnabled = YES;
    [editLable addGestureRecognizer:tap];
    self.infoLable = editLable;
    [self addSubview:self.infoLable];
    
    
}


#pragma mark - Interface
-(void)loadData:(UIImageView*)avaImgV
{
    self.avatarImgV = avaImgV;
}

-(void)tapEdit
{
    [_proHeaderDel didSelectAva];
}



@end
