//
//  SYProfileTableViewCell.m
//  PrivateShare
//
//  Created by bean on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYProfileTableViewCell.h"

@implementation SYProfileTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self creatUI];
        
    }
    
    return self;
}



-(void)creatUI
{
    
    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];
    topView.backgroundColor = kBackGroundColor;
    
    
    
    self.lfImg = [[UIImageView alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(topView.frame)+15, 15, 15)];
    
    
    self.midLB = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.lfImg.frame)+6, CGRectGetMaxY(topView.frame)+15.5, kScreenWidth-CGRectGetMaxX(self.lfImg.frame)-30-6, 14)];
    self.midLB.font = [UIFont systemFontOfSize:14];

    
    [self.contentView addSubview:topView];
    [self.contentView addSubview:self.lfImg];
    [self.contentView addSubview:self.midLB];
}

@end
