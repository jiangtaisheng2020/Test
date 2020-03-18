//
//  DayTopicTableView.h
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DayTopicTableViewCell.h"
#import "DayTopicADView.h"
#import "DayTopicTBCContestView.h"

@protocol DayTopicTableViewTapDelegete <NSObject>
/**
 *  点击某一个cell
 *
 *  @param indexPath cell
 */
-(void)tapTableviewCellIndex:(NSIndexPath*)indexPath tid:(NSString*)tid;

/**
 *  点击某一个广告
 */
-(void)tapTableviewAD:(int)num;
/**
 *  点击cell上顶部自己头像
 */
-(void)tapTopUid:(NSString*)uid indexPath:(NSIndexPath*)indexPath;
/**
 *  点击cell上点赞打赏人头像
 */
-(void)tapDzdsUid:(NSString*)uid indexPath:(NSIndexPath*)indexPath;
/**
 *  点击评论人头像
 */
-(void)tapPinlunUid:(NSString*)uid indexPath:(NSIndexPath*)indexPath;
/**
 *  点击更多评论
 */
-(void)tapMoreIndexPath:(NSIndexPath*)indexPath tid:(NSString*)tid;
/**
 *  点击打赏
 */
-(void)tapDzds:(NSIndexPath *)indexPath tid:(NSString *)tid ava:(NSString *)ava nickName:(NSString *)nick forward:(NSString *)forward;
/**
 *  点击分段赛
 */
-(void)tapContest:(NSIndexPath *)indexPath tid:(NSString *)tid;
/**
 *  点击类别
 */
-(void)tapContestTop:(int)tapNum;

/**
 *  tableview不刷新
 */
-(void)tableViewNoRefresh;
/**
 *  点击图片放大
 */
-(void)tapImg:(NSArray*)imgArr tapNum:(NSInteger)tapNum;

@end

@interface DayTopicTableView : UITableView<UITableViewDataSource,UITableViewDelegate,DayTopicTableViewCellDelegete,DayTopicADTapDelegete,DayTopicTBCContestViewDelegate>

@property (assign, nonatomic)id<DayTopicTableViewTapDelegete>tapDelegate;

/**
 *  刷新数据
 *
 *  @param dataArr 数据源
 *  @param pageNum 刷新页数
 */
-(void)reloadData:(NSMutableArray*)dataArr pageNum:(int)pageNum contestArr:(NSMutableArray*)contestArr titleName:(NSString*)titleName;





@end
