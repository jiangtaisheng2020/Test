//
//  SYRecentActivityCollectionCell.m
//  PrivateShare
//
//  Created by bean on 16/9/21.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYRecentActivityCollectionCell.h"

@interface SYRecentActivityCollectionCell()




@end

@implementation SYRecentActivityCollectionCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = kBlackFontColor;
        [self creatUI];
    }
    
    return self;
}

-(void)creatUI
{
    self.imgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 120)];
//    self.imgV.image = [UIImage imageNamed:@"jinqihuodong_"];
    [self addSubview:self.imgV];
    
    
    UIView * baseView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imgV.frame), self.frame.size.width, 23)];
    baseView.backgroundColor = [UIColor whiteColor];
    [self addSubview:baseView];
    
    
    self.baseLable = [[UILabel alloc]initWithFrame:CGRectMake(3, 4.5, self.frame.size.width/2, 14)];
    self.baseLable.textColor = kBlackFontColor;
    self.baseLable.font = [UIFont systemFontOfSize:14];
//    self.baseLable.text = @"活动名称";
    [baseView addSubview:self.baseLable];
}



@end
