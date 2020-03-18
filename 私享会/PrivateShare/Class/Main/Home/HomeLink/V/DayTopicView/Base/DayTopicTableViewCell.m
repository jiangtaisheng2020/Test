//
//  DayTopicTableViewCell.m
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "DayTopicTableViewCell.h"


@implementation DayTopicTableViewCell
{
    DayTopicTBCTopView * _topView;
    DayTopicTBCImgView * _imgView;
    DayTopicTBCTypeView * _typeView;
    DayTopicTBCZanView * _zanView;
    DayTopicTBCMoreView * _moreView;
    DayTopicTBCBaseView * _baseView;
    
    DayTopicFramModel * _frameModel;
    
    NSIndexPath * _indexPath;
    
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self creatCell];
    }
    return self;
}

- (void)creatCell
{
    
    CGFloat pmW = [UIScreen mainScreen].bounds.size.width;
    
    _topView = [[DayTopicTBCTopView alloc]initWithFrame:CGRectZero];
    _topView.delegate = self;
    
    _imgView = [[DayTopicTBCImgView alloc]initWithFrame:CGRectMake(0, 0, pmW-50-25, 0)];
    _imgView.imgDel = self;
    
    
    _typeView = [[DayTopicTBCTypeView alloc]initWithFrame:CGRectMake(0, 0, pmW-50-10, 0)];
    _typeView.delegate = self;
    
    
    _zanView = [[DayTopicTBCZanView alloc]initWithFrame:CGRectMake(0, 0, pmW-20, 0)];
    _zanView.delegate = self;
    
    
    _pinlunView = [[DayTopicTBCPinLunView alloc]initWithFrame:CGRectMake(0, 0, pmW-20, 0) style:UITableViewStylePlain];
    _pinlunView.plDelegate = self;
    
    
    _moreView = [[DayTopicTBCMoreView alloc]initWithFrame:CGRectMake(0, 0, pmW-20, 0)];
    
    
    _baseView = [[DayTopicTBCBaseView alloc]initWithFrame:CGRectMake(0, 0, pmW, 25)];
    
    [self.contentView addSubview:_topView];
    [self.contentView addSubview:_imgView];
    [self.contentView addSubview:_typeView];
    [self.contentView addSubview:_zanView];
    [self.contentView addSubview:_pinlunView];
    [self.contentView addSubview:_moreView];
    [self.contentView addSubview:_baseView];
    
    
    
}


-(void)configCellWithModel:(DayTopicFramModel*)model indexPath:(NSIndexPath*)indexPath
{
    _frameModel = model;
    _indexPath = indexPath;
    
    CGFloat pmW = [UIScreen mainScreen].bounds.size.width;
    CGFloat jianju = 12;
    CGFloat shangxia = 10;
    _topView.frame = CGRectMake(jianju, 15, pmW-jianju*2, CGRectGetMaxY(model.topViewDesFram));
    [_topView getmodel:model indexPath:indexPath];
    
    if (model.showModel.imgList.count == 0)
    {
        _imgView.frame = CGRectMake(50, CGRectGetMaxY(_topView.frame), pmW-50-25, model.imgViewFrame.size.height);
    }
    else
    {
        _imgView.frame = CGRectMake(50, CGRectGetMaxY(_topView.frame)+shangxia, pmW-50-25, model.imgViewFrame.size.height);
    }
    [_imgView getmodel:model indexPath:indexPath];
    
    
    _typeView.frame = CGRectMake(CGRectGetMinX(_imgView.frame), CGRectGetMaxY(_imgView.frame)+shangxia, pmW-50-10, model.typeViewFrameH);
    [_typeView getmodel:model indexPath:indexPath];
    
    
    if ([model.showModel.presentCount intValue]==0&&[model.showModel.favNum intValue]==0)
    {
        
        _zanView.frame = CGRectMake(jianju, CGRectGetMaxY(_typeView.frame), pmW-jianju*2, 0);
    }
    else
    {
        _zanView.frame = CGRectMake(jianju, CGRectGetMaxY(_typeView.frame)+shangxia, pmW-jianju*2, model.zanViewFrame.size.height);
    }
    [_zanView getmodel:model indexPath:indexPath];
    
    
    
    _pinlunView.frame = CGRectMake(jianju, CGRectGetMaxY(_zanView.frame)+1, pmW-jianju*2, model.pinlunViewFrame.size.height+(_frameModel.isShowKeyBoard*70));
    [_pinlunView getmodel:model indexPath:indexPath];
    [_pinlunView reloadData];
    
    
    if ([model.showModel.replyNum intValue]>=3)
    {
        _moreView.frame = CGRectMake(jianju, CGRectGetMaxY(_pinlunView.frame)+8, pmW-jianju*2, model.moreViewFrame.size.height);
    }
    else
    {
        _moreView.frame = CGRectMake(jianju, CGRectGetMaxY(_pinlunView.frame), pmW-jianju*2, 0);
    }
    
    _moreView.delegate = self;
    [_moreView getmodel:model indexPath:indexPath];
    
    
    
    
    if ([model.showModel.replyNum intValue]==0)
    {
        _baseView.frame = CGRectMake(0, CGRectGetMaxY(_moreView.frame)+5, pmW, model.baseViewFrame.size.height);
    }
    else
    {
        _baseView.frame = CGRectMake(0, CGRectGetMaxY(_moreView.frame)+15, pmW, model.baseViewFrame.size.height);
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}




#pragma 代理方法

/**
 *  头像昵称帖子内容点击的代理
 *
 */
-(void)topTap:(NSString *)uid indexPath:(NSIndexPath *)indexPath
{
    [_delegate topTapUid:uid indexPath:indexPath];
    
    DeLog(@"作者的头像cell%ld uid%@",(long)indexPath.row,uid);
    
}
/**
 *  点击打赏
 */
-(void)typeTapDSView:(NSIndexPath *)indexPath tid:(NSString *)tid ava:(NSString *)ava nickName:(NSString *)nick forward:(NSString *)forward
{
    [_delegate dzdsTapShang:indexPath tid:tid ava:ava nickName:nick forward:forward];
    
    
    DeLog(@"打赏的cell%ld uid%@",(long)indexPath.row,tid);
    
}
///**
// *  点击点赞
// */
//-(void)typeTapDZView:(NSIndexPath *)indexPath uid:(NSString *)uid
//{
//    
//    DLog(@"点赞的cell%ld uid%@",(long)indexPath.row,uid);
//    
//}
/**
 *  点击评论
 */
-(void)typeTapPLView:(NSIndexPath *)indexPath uid:(NSString *)uid
{
    DeLog(@"评论的cell%ld uid%@",(long)indexPath.row,uid);
    
    
    [_delegate refreshCell:_indexPath];
}

/**
 *  点击赞的头像
 *
 *  @param avaUrlStr 赞的人链接
 */
-(void)zanTapUid:(NSString *)uid indexPath:(NSIndexPath *)indexPath
{
    
    [_delegate dzdsTapUid:uid indexPath:indexPath];
    DeLog(@"赞的头像%@  cell%ld",uid,(long)indexPath.row);
}
/**
 *  点击评论
 *
 *  @param indexPath
 */
-(void)pinlunTap:(NSIndexPath *)indexPath
{
    DeLog(@"打开评论 cell%ld",(long)indexPath.row);
    [_delegate refreshCell:_indexPath];
}
/**
 *  评论完成或取消
 */
-(void)pinlunAreadyTap:(NSIndexPath *)indexPath
{
    DeLog(@"完成/取消评论 cell%ld",(long)indexPath.row);
    _frameModel.isShowKeyBoard = NO;
    [_delegate refreshCell:_indexPath];
}
/**
 *  点击评论者头像
 */
-(void)pinlunAvaTap:(NSIndexPath *)indexPath smllRow:(NSInteger)row uid:(NSString *)uid
{
    
    DeLog(@"点击评论者头像大的tbcell%ld 小的tbcell的row%ld uid:%@",(long)indexPath,(long)row,uid);
    [_delegate pinlunTapUid:uid indexPath:indexPath];
}
/**
 *  点击更多评论
 */
-(void)moreTapIndexPath:(NSIndexPath *)indexPath tid:(NSString *)tid
{
    [_delegate moreTapIndexPath:indexPath tid:tid];
    DeLog(@"点击更多评论的cell %ld +++tid%@",(long)indexPath.row,tid);
}

/**
 *  点击图片放大
 */
-(void)imgTap:(NSArray *)imgArray indexPath:(NSIndexPath *)indexPath tapNum:(NSInteger)tapNum
{
    [_delegate imgTap:imgArray indexPath:indexPath tapNum:tapNum];
}

@end
