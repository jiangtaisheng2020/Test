//
//  CustomView.m
//  PrivateShare
//
//  Created by apple2015 on 16/9/21.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "CustomView.h"
@interface CustomView ()

@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIImageView * iconView;
@end

@implementation CustomView
- (instancetype)init
{
    if (self=[super init]) {
        self.backgroundColor=[UIColor clearColor];
        [self  creatUI];
        UITapGestureRecognizer * tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapLogin:)];
        [self addGestureRecognizer:tap];
    }
    return self;
    
}

- (void)creatUI{
    
    
    UIImageView * iconView =[[UIImageView alloc]init];
    self.iconView =iconView;
    [self addSubview:iconView];
    
    UILabel *titleLabel =[[UILabel alloc]init];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=[UIFont systemFontOfSize:14];
    titleLabel.textColor=kCellBackGroundColor;
    titleLabel.backgroundColor=[UIColor clearColor];
    self.titleLabel =titleLabel;
    [self addSubview:titleLabel];

    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left).offset(16);
//        make.right.equalTo(self.mas_right).offset(0);
        make.height.equalTo(@(35));
        make.width.equalTo(@(40));

        
    }];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.iconView.mas_bottom).offset(5);
        make.left.equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.height.equalTo(@(20));
        
    }];
}
- (void)setTitleStr:(NSString *)titleStr
{
    _titleStr=titleStr;

    _titleLabel.text=titleStr;

}

- (void)setIconStr:(NSString *)iconStr
{
    _iconStr =iconStr;
    [_iconView setImage:[UIImage imageNamed:iconStr]];

}


- (void)handleTapLogin:(UITapGestureRecognizer *)tap
{

    
    if ([self.delegate respondsToSelector:@selector(customViewHandleTap)]) {
        [self.delegate customViewHandleTap ];
    }
    

}

@end
