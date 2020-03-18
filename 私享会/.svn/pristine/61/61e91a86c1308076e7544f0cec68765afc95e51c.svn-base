//
//  SYHotRecomendCollectionCell.m
//  PrivateShare
//
//  Created by bean on 16/9/21.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYHotRecomendCollectionCell.h"
#import "SYHotRecommentView.h"

@interface SYHotRecomendCollectionCell()

@property(nonatomic,weak)UIScrollView * scrView;

@end

@implementation SYHotRecomendCollectionCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self creatUI];
    }
    
    return self;
}

-(void)creatUI
{
    UIScrollView * scr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    scr.contentSize = CGSizeMake(self.frame.size.width * 2-24, self.frame.size.height);
    scr.showsVerticalScrollIndicator = NO;
    scr.showsHorizontalScrollIndicator = NO;
    scr.contentOffset = CGPointZero;
    self.scrView = scr;
    [self addSubview:self.scrView];
    
}

-(void)configurationCell:(id)object
{
    NSArray * someArr = @[@[@"hotrecommendbanner1",@"新西兰"],@[@"hotrecommendbanner2",@"高档会所"],@[@"hotrecommendbanner3",@"奉献爱心"],@[@"hotrecommendbanner1",@"新西兰"],@[@"hotrecommendbanner2",@"高档会所"],@[@"hotrecommendbanner3",@"奉献爱心"]];
    
    for (int i = 0 ; i<someArr.count; i++)
    {
        SYHotRecommentView * hotView = [[SYHotRecommentView alloc]initWithFrame:CGRectMake(12+(kScreenWidth-24)/3*i, 10, (kScreenWidth-10-24)/3, 87)];
        [hotView configSome:someArr[i]];
        hotView.tag = 60+i;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSome:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [hotView addGestureRecognizer:tap];
        [self.scrView addSubview:hotView];
    }
}


-(void)tapSome:(UITapGestureRecognizer*)tap
{
    [_hotDel tapHotNum:(int)tap.view.tag];
}

@end
