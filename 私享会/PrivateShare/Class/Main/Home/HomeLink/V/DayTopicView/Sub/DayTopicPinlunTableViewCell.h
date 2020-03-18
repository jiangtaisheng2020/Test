//
//  DayTopicPinlunTableViewCell.h
//  DayTopic
//
//  Created by bean on 16/5/19.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayTopicPLModel.h"
@protocol DayTopicTBCTapPinLunAvaDelegete <NSObject>
/**
 *  评论头像
 *
 *  @param avaUrlStr 返回链接地址
 */
-(void)pinlunAvaTap:(NSInteger)row;

@end

@interface DayTopicPinlunTableViewCell : UITableViewCell

-(void)configCellWithModel:(DayTopicPLModel*)model indexPath:(NSIndexPath*)indexPath;

@property (assign, nonatomic)id<DayTopicTBCTapPinLunAvaDelegete>delegate;
@property (assign, nonatomic)NSInteger row;

@end
