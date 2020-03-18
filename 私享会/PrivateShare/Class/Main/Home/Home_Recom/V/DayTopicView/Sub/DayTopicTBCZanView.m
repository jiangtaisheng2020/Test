//
//  DayTopicTBCZanView.m
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "DayTopicTBCZanView.h"

@implementation DayTopicTBCZanView
{
    UIImageView * _arrow;
    UIImageView * _typeImg;
    CGFloat _viewW;
    
    UIButton * _btnV1;
    UIButton * _imgV2;
    UIButton * _imgV3;
    UIButton * _imgV4;
    UIButton * _imgV5;
    UIButton * _imgV6;
    
    NSIndexPath * _indexPath;
    NSString * _uid;
    DayTopicFramModel * _model;
    
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
    _viewW = self.frame.size.width;
    CGFloat arrowSize = 19;
    _arrow = [[UIImageView alloc]initWithFrame:CGRectMake(_viewW-8-arrowSize, 10, arrowSize, arrowSize)];
    _arrow.image = [UIImage imageNamed:@"more"];
    [self addSubview:_arrow];
    
    
    
    
    
    
    CGFloat typeSize = 15;
    _typeImg = [[UIImageView alloc]initWithFrame:CGRectMake(8, 12, typeSize, typeSize)];
    [self addSubview:_typeImg];
    
    
    CGFloat picjianju = 11;
    CGFloat picSize = 21;
    CGFloat shangxiajianxi = 9;
    
    self.backgroundColor = kBackGroundColor;
    
    
    _btnV1 = [self avaBtn:CGRectMake(CGRectGetMaxX(_typeImg.frame)+5, shangxiajianxi, picSize,picSize) tag:30001];
    _imgV2 = [self avaBtn:CGRectMake(CGRectGetMaxX(_btnV1.frame)+picjianju, shangxiajianxi, picSize,picSize) tag:30002];
    _imgV3 = [self avaBtn:CGRectMake(CGRectGetMaxX(_imgV2.frame)+picjianju, shangxiajianxi, picSize,picSize) tag:30003];
    _imgV4 = [self avaBtn:CGRectMake(CGRectGetMaxX(_imgV3.frame)+picjianju, shangxiajianxi, picSize,picSize) tag:30004];
    _imgV5 = [self avaBtn:CGRectMake(CGRectGetMaxX(_imgV4.frame)+picjianju, shangxiajianxi, picSize,picSize) tag:30005];
    _imgV6 = [self avaBtn:CGRectMake(CGRectGetMaxX(_imgV5.frame)+picjianju, shangxiajianxi, picSize,picSize) tag:30006];
    
    
    
}


-(void)getmodel:(DayTopicFramModel*)model indexPath:(NSIndexPath *)indexPath
{
    
    _indexPath = indexPath;
    _model = model;
    
    NSInteger count = 6;
    
    //点赞图【是否有点赞】 如果有打赏就用打赏的fram
    if (model.showModel.shangJSON.count!=0)
    {
        
        
        _typeImg.image = [UIImage imageNamed:@"reward_big"];
        
        count = model.showModel.shangJSON.count;
        [self hiddenCount:count imgArr:model.showModel.shangJSON];
    }
    else
    {
        if (model.showModel.favJSON.count==0)
        {
            _typeImg.image = nil;
            _arrow.image = nil;
            count = model.showModel.favJSON.count;
            
            [self hiddenCount:count imgArr:model.showModel.favJSON];
        }
        else
        {
            _typeImg.image = [UIImage imageNamed:@"like"];
            count = model.showModel.favJSON.count;
            [self hiddenCount:count imgArr:model.showModel.favJSON];
        }
    }
}


-(void)tapAva:(UIButton*)btn
{
    
    NSInteger btnTag = btn.tag - 30000;
    DayTopicDSModel * dsModel;
    DayTopicDZModel * dzModel;
    if (_model.showModel.shangJSON.count!=0)
    {
        dsModel = _model.showModel.shangJSON[btnTag-1];
        _uid = dsModel.uid;
    }
    else
    {
        dzModel = _model.showModel.favJSON[btnTag-1];
        _uid = dzModel.uid;
    }
    
    switch (btnTag)
    {
        case 1:
        {
            
            [_delegate zanTapUid:_uid indexPath:_indexPath];
        }
            break;
        case 2:
        {
            [_delegate zanTapUid:_uid indexPath:_indexPath];
        }
            break;
        case 3:
        {
            [_delegate zanTapUid:_uid indexPath:_indexPath];
        }
            break;
        case 4:
        {
            [_delegate zanTapUid:_uid indexPath:_indexPath];
        }
            break;
        case 5:
        {
            [_delegate zanTapUid:_uid indexPath:_indexPath];
        }
            break;
        case 6:
        {
            [_delegate zanTapUid:_uid indexPath:_indexPath];
        }
            break;
            
        default:
            break;
    }
}


-(UIButton*)avaBtn:(CGRect)fram tag:(NSInteger)tag
{
    UIButton * btn = [[UIButton alloc]initWithFrame:fram];
    
    btn.hidden = YES;
    
    [btn addTarget:self action:@selector(tapAva:) forControlEvents:UIControlEventTouchUpInside];
    
    btn.tag = tag;
    
    btn.layer.cornerRadius = fram.size.width/2;
    btn.clipsToBounds = YES;
    [self addSubview:btn];
    
    return btn;
}

-(void)hiddenCount:(NSInteger)count imgArr:(NSArray*)imgArr
{
    
    for (int i = 1; i<=6; i++)
    {
        
        UIButton * btnV = (UIButton*)[self viewWithTag:30000+i];
        if (i <= count)
        {
            if ([imgArr[i-1] isKindOfClass:[DayTopicDSModel class]])
            {
                DayTopicDSModel * model = imgArr[i-1];
                btnV.hidden = NO;
                
                [btnV sd_setImageWithURL:[NSURL URLWithString:model.avatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"AppIcon"]];
            }
            else
            {
                DayTopicDZModel * model = imgArr[i-1];
                
                btnV.hidden = NO;
                [btnV sd_setImageWithURL:[NSURL URLWithString:model.avatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"AppIcon"]];
            }
            
            
        }
        else
        {
            btnV.hidden = YES;
        }
    }
}


@end
