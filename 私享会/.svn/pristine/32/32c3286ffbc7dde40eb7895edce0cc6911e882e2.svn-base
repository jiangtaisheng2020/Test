//
//  SYSettinggTableViewCell.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYSettinggTableViewCell.h"

@implementation SYSettinggTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatUI];
    }
    
    return self;
}

-(void)creatUI
{
    self.leftLB = [[UILabel alloc]initWithFrame:CGRectMake(12, 13, 100,18)];
    self.leftLB.font = [UIFont systemFontOfSize:18];
    self.leftLB.textColor = kBlackFontColor;
    [self.contentView addSubview:self.leftLB];
    
    
    self.rightLB = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-12-70, 14, 50, 16)];
    self.rightLB.font = [UIFont systemFontOfSize:16];
    self.rightLB.textAlignment = 2;
    self.rightLB.textColor = Color(102, 102, 102);
    [self.contentView addSubview:self.rightLB];
    
    
    UIView * lineV = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-0.5, kScreenWidth, 0.5)];
    lineV.backgroundColor = kLineColor;
    [self.contentView addSubview:lineV];
    
    
}

@end
