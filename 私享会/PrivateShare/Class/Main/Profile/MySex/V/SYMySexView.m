//
//  SYMySexView.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYMySexView.h"

@implementation SYMySexView

{
    UIImageView * sexImg;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self creatUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

-(void)creatUI
{
    UILabel * sexLable = [[UILabel alloc]initWithFrame:CGRectMake(15, 12, 20, 20)];
    sexLable.textColor = [UIColor blackColor];
    sexLable.font = [UIFont systemFontOfSize:16];
    self.sexLb = sexLable;
    [self addSubview:self.sexLb];
    
    sexImg = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth-30-20, 12, 20, 20)];
    sexImg.image = [UIImage imageNamed:@"sex_select"];
    [self addSubview:sexImg];
    
}

-(void)setHiddenImg:(BOOL)hiddenImg
{
    sexImg.hidden = hiddenImg;
}


@end
