//
//  DayTopicTBCTypeView.m
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "DayTopicTBCTypeView.h"
#import "NSObject+AutoSize.h"
#define DayTopicTypeDSColor Color(177, 180, 242)

@implementation DayTopicTBCTypeView
{
    UIView * _typeView;//类型View
    UIImageView * _typeImg;//类型icon
    UILabel * _typeLB;//类型
    
    UIView * _dsView;//打赏View
    UIImageView * _dsImg;//打赏icon
    UILabel * _dsLB;//打赏数
    
    UIView * _seeView;//浏览View
    UIImageView * _seeImg;//浏览icon
    UILabel * _seeLB;//浏览数
    
    UIView * _dzView;//点赞View
    UIImageView * _dzImg;//点赞icon
    UILabel * _dzLB;//点赞数
    
    UIView * _plView;//评论View
    UIImageView * _plImg;//评论icon
    UILabel * _plLB;//评论数
    
    
    CGFloat _fontSize;
    NSIndexPath * _indexPath;
    NSString * _uid;
    DayTopicFramModel*_model;
    
    
    NSString * _shangTid;
    NSString * _shangAva;
    NSString * _shangNick;
    NSString * _shangForward;
    
    
    UIImageView * _trAngelImg;
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
        _trAngelImg = [[UIImageView alloc]initWithFrame:CGRectMake(-30, self.frame.size.height+16, 16, 16)];
        _trAngelImg.image = [UIImage imageNamed:@"delta"];
        [self addSubview:_trAngelImg];
        
        
        
        
        
        _fontSize = 12;
        //类型
        _typeView = [[UIView alloc]init];
        _typeImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 15, 15)];
        _typeImg.image = [UIImage imageNamed:@"2_5"];
        _typeImg.userInteractionEnabled = YES;
        
        _typeLB = [[UILabel alloc]init];
        _typeLB.font = [UIFont systemFontOfSize:_fontSize];
        _typeLB.textColor = Color(103, 118, 137);
        _typeLB.userInteractionEnabled = YES;
        [_typeView addSubview:_typeImg];
        [_typeView addSubview:_typeLB];
        
        //打赏
        _dsView = [[UIView alloc]init];
        _dsImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 12, 12)];
        _dsImg.image = [UIImage imageNamed:@"reward_big"];
        _dsImg.userInteractionEnabled = YES;
        
        _dsLB = [[UILabel alloc]init];
        _dsLB.font = [UIFont systemFontOfSize:_fontSize];
        _dsLB.textColor = Color(177, 180, 179);
        _dsLB.userInteractionEnabled = YES;
        [_dsView addSubview:_dsImg];
        [_dsView addSubview:_dsLB];
        
        //浏览
        _seeView = [[UIView alloc]init];
        _seeImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 12, 12)];
        _seeImg.image = [UIImage imageNamed:@"eye"];
        _seeImg.userInteractionEnabled = YES;
        
        _seeLB = [[UILabel alloc]init];
        _seeLB.font = [UIFont systemFontOfSize:_fontSize];
        _seeLB.textColor = DayTopicTypeDSColor;
        _seeLB.userInteractionEnabled = YES;
        [_seeView addSubview:_seeImg];
        [_seeView addSubview:_seeLB];
        
        //点赞
        _dzView = [[UIView alloc]init];
        _dzImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 12, 12)];
        _dzImg.image = [UIImage imageNamed:@"like"];
        _dzImg.userInteractionEnabled = YES;
        
        _dzLB = [[UILabel alloc]init];
        _dzLB.font = [UIFont systemFontOfSize:_fontSize];
        _dzLB.textColor = DayTopicTypeDSColor;
        _dzLB.userInteractionEnabled = YES;
        [_dzView addSubview:_dzImg];
        [_dzView addSubview:_dzLB];
        
        //评论
        _plView = [[UIView alloc]init];
        _plImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 12, 12)];
        _plImg.image = [UIImage imageNamed:@"comment_big"];
        _plImg.userInteractionEnabled = YES;
        _plLB = [[UILabel alloc]init];
        _plLB.font = [UIFont systemFontOfSize:_fontSize];
        _plLB.textColor = DayTopicTypeDSColor;
        _plLB.userInteractionEnabled = YES;
        [_plView addSubview:_plImg];
        [_plView addSubview:_plLB];
        
        
        [self addSubview:_typeView];
        [self addSubview:_dsView];
        [self addSubview:_seeView];
        [self addSubview:_dzView];
        [self addSubview:_plView];
        
        
        _typeView.tag = 20001;
        _dsView.tag = 20002;
        _seeView.tag = 20003;
        _dzView.tag = 20004;
        _plView.tag = 20005;
        _plLB.tag = 20006;
        _plImg.tag = 20007;
        
        _typeView.userInteractionEnabled = YES;
        _dsView.userInteractionEnabled = YES;
        _seeView.userInteractionEnabled = YES;
        _dzView.userInteractionEnabled = YES;
        _plView.userInteractionEnabled = YES;
        self.userInteractionEnabled = YES;
        
        
        UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView:)];
        tap1.numberOfTapsRequired = 1;
        tap1.numberOfTouchesRequired = 1;
        [_typeView addGestureRecognizer:tap1];
        
        UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView:)];
        tap2.numberOfTapsRequired = 1;
        tap2.numberOfTouchesRequired = 1;
        [_dsView addGestureRecognizer:tap2];
        
        UITapGestureRecognizer * tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView:)];
        tap3.numberOfTapsRequired = 1;
        tap3.numberOfTouchesRequired = 1;
        [_seeView addGestureRecognizer:tap3];
        
        UITapGestureRecognizer * tap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView:)];
        tap4.numberOfTapsRequired = 1;
        tap4.numberOfTouchesRequired = 1;
        [_dzView addGestureRecognizer:tap4];
        
        UITapGestureRecognizer * tap5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView:)];
        tap5.numberOfTapsRequired = 1;
        tap5.numberOfTouchesRequired = 1;
        [_plView addGestureRecognizer:tap5];
        
        UITapGestureRecognizer * tap6 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView:)];
        tap6.numberOfTapsRequired = 1;
        tap6.numberOfTouchesRequired = 1;
        [_plImg addGestureRecognizer:tap6];
        
        UITapGestureRecognizer * tap7 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView:)];
        tap7.numberOfTapsRequired = 1;
        tap7.numberOfTouchesRequired = 1;
        [_plLB addGestureRecognizer:tap7];
        
        
//        _typeView.backgroundColor = [UIColor yellowColor];
//        _dsView.backgroundColor = [UIColor yellowColor];
//        _seeView.backgroundColor = [UIColor yellowColor];
//        _dzView.backgroundColor = [UIColor yellowColor];
//        _plView.backgroundColor = [UIColor yellowColor];
        
        
    }
    return self;
}

-(void)getmodel:(DayTopicFramModel*)model indexPath:(NSIndexPath*)indexPath
{
    _model = model;
    _indexPath = indexPath;
    _uid = model.showModel.uid;
    
    _shangTid = model.showModel.tid;
    _shangAva = model.showModel.avatar;
    _shangNick = model.showModel.author;
    _shangForward = @"list";
    
    
    
    
    CGFloat typeW = model.showModel.tagname.length*(_fontSize+1);
    _typeView.frame = CGRectMake(0, 0, 15+5+typeW, 15);
    _typeLB.frame = CGRectMake(CGRectGetMaxX(_typeImg.frame)+5, 0, typeW, 12);
    _typeLB.text = model.showModel.tagname;
    
    
    CGFloat dsW = [self calculateLabelighWithText:model.showModel.presentCount withMaxSize:CGSizeMake(MAXFLOAT, 15) withFont:_fontSize].width;
    CGFloat seeW = [self calculateLabelighWithText:model.showModel.viewNum withMaxSize:CGSizeMake(MAXFLOAT, 15) withFont:_fontSize].width;
    CGFloat dzW = [self calculateLabelighWithText:model.showModel.favNum withMaxSize:CGSizeMake(MAXFLOAT, 15) withFont:_fontSize].width;
    CGFloat plW = [self calculateLabelighWithText:model.showModel.replyNum withMaxSize:CGSizeMake(MAXFLOAT, 15) withFont:_fontSize].width;
    CGFloat jianju = 15;
    CGFloat width = (12+5)*4+jianju*3+dsW+seeW+dzW+plW;
    
    
    _dsView.frame = CGRectMake(self.frame.size.width-width, 0, 12+5+dsW, 12);
    _dsLB.frame = CGRectMake(CGRectGetMaxX(_dsImg.frame)+5, 0, dsW, 12);
    _dsLB.text = model.showModel.presentCount;
    
    
    
    _seeView.frame = CGRectMake(CGRectGetMaxX(_dsView.frame)+jianju, 0, 12+5+seeW, 12);
    _seeLB.frame = CGRectMake(CGRectGetMaxX(_seeImg.frame)+5, 0, seeW, 12);
    _seeLB.text = model.showModel.viewNum;
    
    
    
    _dzView.frame = CGRectMake(CGRectGetMaxX(_seeView.frame)+jianju, 0, 12+5+dzW, 12);
    _dzLB.frame = CGRectMake(CGRectGetMaxX(_dzImg.frame)+5, 0, dzW, 12);
    _dzLB.text = model.showModel.favNum;
    
    
    
    _plView.frame = CGRectMake(CGRectGetMaxX(_dzView.frame)+jianju, 0, 12+5+plW, 12);
    _plLB.frame = CGRectMake(CGRectGetMaxX(_plImg.frame)+5, 0, plW, 12);
    _plLB.text = model.showModel.replyNum;
    
    
    
    if ([model.showModel.replyNum intValue]==0&&[model.showModel.presentCount intValue]==0&&[model.showModel.favNum intValue]==0)
    {
        _trAngelImg.frame = CGRectMake(-30, 16, 16, 16);
        _trAngelImg.image = nil;
    }
    else if([model.showModel.presentCount intValue]==0&&[model.showModel.favNum intValue]==0)
    {
        _trAngelImg.frame = CGRectMake(-30, 8, 16, 16);
        
        _trAngelImg.image = [UIImage imageNamed:@"delta"];
    }
    else
    {
        _trAngelImg.frame = CGRectMake(-30, 16, 16, 16);
        _trAngelImg.image = [UIImage imageNamed:@"delta"];
    }
//    DLog(@"%@",[NSValue valueWithCGRect:_trAngelImg.frame]);
}


/**
 *  点击View的响应
 *
 *  @param tap 点击的View
 */
-(void)tapView:(UITapGestureRecognizer*)tap
{
    switch (tap.view.tag-20000)
    {
        case 1:
        {
            //点击帖子类型
        }
            break;
        case 2:
        {
            //点击打赏
            [_delegate typeTapDSView:_indexPath tid:_shangTid ava:_shangAva nickName:_shangNick forward:_shangForward];
        }
            break;
        case 3:
        {
            //点击浏览
        }
            break;
        case 4:
        {
            //点击点赞
//            [_delegate typeTapDZView:_indexPath uid:_uid];
        }
            break;
        case 5:
        {
            //点击评论
            _model.isShowKeyBoard = YES;
            _model.isTapTypePL = YES;
            [_delegate typeTapPLView:_indexPath uid:_uid];
        }
            break;
        case 6:
        {
            //点击评论
            _model.isShowKeyBoard = YES;
            _model.isTapTypePL = YES;
            [_delegate typeTapPLView:_indexPath uid:_uid];
        }
            break;
        case 7:
        {
            //点击评论
            _model.isShowKeyBoard = YES;
            _model.isTapTypePL = YES;
            [_delegate typeTapPLView:_indexPath uid:_uid];
        }
            break;
            
        default:
            break;
    }
}




@end
