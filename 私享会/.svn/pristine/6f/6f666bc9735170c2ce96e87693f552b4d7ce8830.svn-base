//
//  DayTopicTBCZanView.h
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayTopicFramModel.h"
@protocol DayTopicTBCTapZanAvaDelegete <NSObject>
/**
 *  点赞头像
 *
 *  @param avaUrlStr 返回链接地址
 */
-(void)zanTapUid:(NSString*)uid indexPath:(NSIndexPath*)indexPath;

@end


@interface DayTopicTBCZanView : UIView



-(void)getmodel:(DayTopicFramModel*)model indexPath:(NSIndexPath *)indexPath;

@property (assign, nonatomic)id<DayTopicTBCTapZanAvaDelegete>delegate;
@end
