//
//  DayTopicTBCTopView.h
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayTopicFramModel.h"
@protocol DayTopicTBCTapAvaDelegete <NSObject>
/**
 *  点击个人头像
 *
 *  @param avaUrlStr 个人主页链接
 */
-(void)topTap:(NSString*)avaUrlStr indexPath:(NSIndexPath*)indexPath;


@end

@interface DayTopicTBCTopView : UIView

@property (assign, nonatomic)id<DayTopicTBCTapAvaDelegete>delegate;

-(void)getmodel:(DayTopicFramModel*)model indexPath:(NSIndexPath*)indexPath;

@end
