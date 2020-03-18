//
//  SYMyInfoTableViewCell.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYMyInfoTableViewCell.h"

@implementation SYMyInfoTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self creatUI];
    }
    
    return self;
}


-(void)creatUI
{
    
    self.avatar = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth-12-30-15, 7, 30, 30)];
    
//    self.QRcode = [[UIImageView alloc]init];
    
    [self.contentView addSubview:self.avatar];
//    [self.contentView addSubview:self.QRcode];
    
    
    self.titleLable = [[UILabel alloc]initWithFrame:CGRectMake(12, 13, 100, 18)];
    self.titleLable.font = [UIFont systemFontOfSize:18];
    self.titleLable.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.titleLable];
    
    UIView * lineV = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-0.5, kScreenWidth, 0.5)];
    lineV.backgroundColor = kLineColor;
    [self.contentView addSubview:lineV];

    
}

@end
