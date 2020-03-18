//
//  DayTopicPinlunTableViewCell.m
//  DayTopic
//
//  Created by bean on 16/5/19.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "DayTopicPinlunTableViewCell.h"
#import "NSObject+AutoSize.h"
@implementation DayTopicPinlunTableViewCell
{
    UIImageView * _typeImgView;
    UIButton * _avaImgBtn;
    UILabel * _nickLB;
    UILabel * _commentLB;
    
    
    CGFloat _nickFont;
    CGFloat _commentFont;
    CGFloat _timeFont;
    
}

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
    
    _nickFont = 12;
    _commentFont = 12;
    _timeFont = 12;
    
    
    _typeImgView = [[UIImageView alloc]initWithFrame:CGRectMake(8, 10, 16, 16)];
    _typeImgView.image = [UIImage imageNamed:@"comment_big"];
    _typeImgView.hidden = YES;
    
    _avaImgBtn = [[UIButton alloc]init];
    [_avaImgBtn addTarget:self action:@selector(tapAva:) forControlEvents:UIControlEventTouchUpInside];
    
    _nickLB = [[UILabel alloc]init];
    _commentLB = [[UILabel alloc]init];
    
    
   
    
    _nickLB.font = [UIFont systemFontOfSize:_nickFont];
    _commentLB.font = [UIFont systemFontOfSize:_commentFont];
    
    
    _nickLB.textColor = Color(103, 118, 137);
    _commentLB.textColor = kBlackFontColor;
    
    
    [self.contentView addSubview:_typeImgView];
    [self.contentView addSubview:_avaImgBtn];
    [self.contentView addSubview:_nickLB];
    [self.contentView addSubview:_commentLB];
    
    
}

-(void)configCellWithModel:(DayTopicPLModel*)model indexPath:(NSIndexPath*)indexPath
{
    if (indexPath.row == 0)
    {
        _typeImgView.hidden = NO;
    }
    
    
    
    
    CGFloat jianju = 5;
    CGFloat avaAndLBJianju = 8;
    CGFloat lastJianju = 8;
    CGFloat avaImgBtnW = 21;
    CGFloat avaImgBtnH = 21;
    CGFloat lbAndlbJianju = 5;
    CGFloat viewW = self.frame.size.width;
//    CGFloat pmW = [UIScreen mainScreen].bounds.size.width;
    
    _avaImgBtn.frame = CGRectMake(CGRectGetMaxX(_typeImgView.frame)+jianju, 14, avaImgBtnW, avaImgBtnH);
    _avaImgBtn.layer.cornerRadius = avaImgBtnH/2;
    _avaImgBtn.clipsToBounds = YES;
    [_avaImgBtn sd_setImageWithURL:[NSURL URLWithString:model.avatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"AppIcon"]];
    
    
    
    
    CGFloat nickLBW;
    NSString * nickStr;
    if (model.refusername.length != 0)
    {
        nickStr = [NSString stringWithFormat:@"%@ 回复 %@",model.username,model.refusername];
        nickLBW = [self calculateLabelighWithText:nickStr withMaxSize:CGSizeMake(viewW-CGRectGetMaxX(_avaImgBtn.frame)-avaAndLBJianju-lastJianju, 12) withFont:_nickFont].width;
    }
    else
    {
        nickStr = model.username;
        nickLBW = [self calculateLabelighWithText:model.username withMaxSize:CGSizeMake(viewW-CGRectGetMaxX(_avaImgBtn.frame)-avaAndLBJianju-lastJianju, 12) withFont:_nickFont].width;
    }
    
    
    _nickLB.frame = CGRectMake(CGRectGetMaxX(_avaImgBtn.frame)+avaAndLBJianju, 10, nickLBW, 12);
    _nickLB.text = nickStr;
    
    
    
    
    
    CGFloat commentLBW = [self calculateLabelighWithText:model.content withMaxSize:CGSizeMake(viewW-CGRectGetMaxX(_avaImgBtn.frame)-avaAndLBJianju, 12) withFont:_commentFont].width;
    _commentLB.frame = CGRectMake(CGRectGetMaxX(_avaImgBtn.frame)+avaAndLBJianju, CGRectGetMaxY(_nickLB.frame)+lbAndlbJianju, commentLBW, 12);
    _commentLB.text = model.content;
    
    
}

-(void)tapAva:(UIButton*)btn
{
    [_delegate pinlunAvaTap:self.row];
}

-(void)setRoll:(NSInteger)row
{
    _row = row;
}

@end
