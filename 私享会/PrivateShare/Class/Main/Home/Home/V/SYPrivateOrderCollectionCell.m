//
//  SYPrivateOrderCollectionCell.m
//  PrivateShare
//
//  Created by bean on 16/9/21.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYPrivateOrderCollectionCell.h"

@interface SYPrivateOrderCollectionCell()



@end

@implementation SYPrivateOrderCollectionCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = kBackGroundColor;
        [self creatUI];
    }
    
    return self;
}

-(void)creatUI
{
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 100)];
//    self.imageView.image = [UIImage imageNamed:@"sitianxia_"];
    [self addSubview:self.imageView];
    
    
    UIView * baseView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame), self.frame.size.width, 23)];
    baseView.backgroundColor = [UIColor whiteColor];
    [self addSubview:baseView];
    
    
    self.titleLable = [[UILabel alloc]initWithFrame:CGRectMake(3, 4.5, self.frame.size.width/2, 14)];
    self.titleLable.textColor = kBlackFontColor;
    self.titleLable.font = [UIFont systemFontOfSize:14];
//    self.titleLable.text = @"私天下";
    [baseView addSubview:self.titleLable];
    
}







@end
