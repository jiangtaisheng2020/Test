//
//  DayTopicTableViewCell.h
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayTopicFramModel.h"
#import "DayTopicTBCTopView.h"//顶部显示头像昵称的View
#import "DayTopicTBCImgView.h"//显示图片的View
#import "DayTopicTBCTypeView.h"//4个按钮和帖子类型的View
#import "DayTopicTBCZanView.h"//点赞的View
#import "DayTopicTBCPinLunView.h"//评论的View
#import "DayTopicTBCMoreView.h"//更多评论
#import "DayTopicTBCBaseView.h"//底部占位
@protocol DayTopicTableViewCellDelegete <NSObject>

/**
 *  cell刷新
 *
 *
 */
-(void)refreshCell:(NSIndexPath*)indexPath;
/**
 *  点击头像
 */
-(void)topTapUid:(NSString*)uid indexPath:(NSIndexPath*)indexPath;
/**
 *  点击点赞者或者打赏者头像
 */
-(void)dzdsTapUid:(NSString*)uid indexPath:(NSIndexPath*)indexPath;
/**
 *  点击评论者头像
 */
-(void)pinlunTapUid:(NSString*)uid indexPath:(NSIndexPath*)indexPath;
/**
 *  点击更多评论
 */
-(void)moreTapIndexPath:(NSIndexPath*)indexPath tid:(NSString*)tid;
/**
 *  点击打赏
 */
-(void)dzdsTapShang:(NSIndexPath *)indexPath tid:(NSString *)tid ava:(NSString *)ava nickName:(NSString *)nick forward:(NSString *)forward;
/**
 *  打开图片浏览
 */
-(void)imgTap:(NSArray*)imgArray indexPath:(NSIndexPath*)indexPath tapNum:(NSInteger)tapNum;


@end

@interface DayTopicTableViewCell : UITableViewCell<DayTopicTBCTapAvaDelegete,DayTopicTBCTypeViewDelegete,DayTopicTBCTapZanAvaDelegete,DayTopicTBCTapPLDelegete,DayTopicTBCTapMoreDelegete,DayTopicTBCImgViewDelegate>






-(void)configCellWithModel:(DayTopicFramModel*)model indexPath:(NSIndexPath*)indexPath;

@property (assign, nonatomic)id<DayTopicTableViewCellDelegete>delegate;

@property (strong, nonatomic)DayTopicTBCPinLunView * pinlunView;

@end
