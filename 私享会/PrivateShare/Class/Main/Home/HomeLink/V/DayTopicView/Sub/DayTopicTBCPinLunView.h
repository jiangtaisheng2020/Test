//
//  DayTopicTBCPinLunView.h
//  DayTopic
//
//  Created by bean on 16/5/19.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import "DayTopicFramModel.h"
#import "DayTopicPinlunTableViewCell.h"
@protocol DayTopicTBCTapPLDelegete <NSObject>
/**
 *  点击评论
 *
 *  @param avaUrlStr 返回链接地址
 */
-(void)pinlunTap:(NSIndexPath*)indexPath;
/**
 *  评论完或取消
 *
 *  @param avaUrlStr 返回链接地址
 */
-(void)pinlunAreadyTap:(NSIndexPath*)indexPath;
/**
 *  点击评论头像
 */
-(void)pinlunAvaTap:(NSIndexPath*)indexPath smllRow:(NSInteger)row uid:(NSString*)uid;



@end

@interface DayTopicTBCPinLunView : UITableView<UITableViewDelegate,UITableViewDataSource,DayTopicTBCTapPinLunAvaDelegete>

-(void)getmodel:(DayTopicFramModel*)model indexPath:(NSIndexPath*)indexPath;

@property (assign, nonatomic)id<DayTopicTBCTapPLDelegete>plDelegate;


@end
