//
//  DayTopicTBCMoreView.m
//  DayTopic
//
//  Created by bean on 16/5/23.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "DayTopicTBCMoreView.h"

@implementation DayTopicTBCMoreView
{
    UIButton * _moreBtn;
    CGFloat viewW;
    CGFloat footH;
    NSIndexPath * _indexPath;
    NSString * _tid;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self creatUI];
    }
    return self;
}

-(void)creatUI
{
    footH = 36;
    _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _moreBtn.frame = CGRectMake(0, 0, self.frame.size.width, footH);
    [_moreBtn setTitle:@"查看所有回复" forState:UIControlStateNormal];
    [_moreBtn setTitleColor:Color(103, 118, 137) forState:UIControlStateNormal];
    _moreBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    _moreBtn.backgroundColor = Color(227, 227, 227);
    [_moreBtn addTarget:self action:@selector(tapMore:) forControlEvents:UIControlEventTouchUpInside];
//    _moreBtn.hidden = YES;
    [self addSubview:_moreBtn];
}


-(void)getmodel:(DayTopicFramModel*)model indexPath:(NSIndexPath *)indexPath
{
    _moreBtn.frame = CGRectMake(0, 0, self.frame.size.width, footH);
    _indexPath = indexPath;
    _tid = model.showModel.tid;
    if ([model.showModel.replyNum intValue]>=3)
    {
        _moreBtn.hidden = NO;
    }
    else
    {
        _moreBtn.hidden = YES;
    }
}


-(void)tapMore:(UIButton*)btn
{
    DeLog(@"点击更多%ld",(long)_indexPath.row);
    [_delegate moreTapIndexPath:_indexPath tid:_tid];
}


@end
