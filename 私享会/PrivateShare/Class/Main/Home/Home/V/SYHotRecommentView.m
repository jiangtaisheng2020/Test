//
//  SYHotRecommentView.m
//  PrivateShare
//
//  Created by bean on 2016/10/17.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYHotRecommentView.h"

@interface SYHotRecommentView()

@property(nonatomic,weak)UIImageView * imgView;
@property(nonatomic,weak)UILabel * baseLable;

@end

@implementation SYHotRecommentView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self creatUI];
    }
    
    return self;
}

-(void)creatUI
{
    UIImageView * imgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width,67)];
    self.imgView = imgV;
    [self addSubview:self.imgView];
    
    
    UILabel * baseLb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imgV.frame)-0.5, self.frame.size.width, 20)];
    baseLb.font = [UIFont systemFontOfSize:12];
    baseLb.backgroundColor = [UIColor whiteColor];
    baseLb.userInteractionEnabled = YES;
    baseLb.textColor = kBlackFontColor;
    baseLb.layer.borderWidth = 0.5;
    baseLb.layer.borderColor = kLineColor.CGColor;
    self.baseLable = baseLb;
    [self addSubview:self.baseLable];
    
}


-(void)configSome:(id)object
{
    NSArray * someArr = object;
    self.imgView.image = [UIImage imageNamed:someArr[0]];
    self.baseLable.text = someArr[1];
}

@end
