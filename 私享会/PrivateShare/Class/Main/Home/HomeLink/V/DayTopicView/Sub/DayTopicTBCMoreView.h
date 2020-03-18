//
//  DayTopicTBCMoreView.h
//  DayTopic
//
//  Created by bean on 16/5/23.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayTopicFramModel.h"

@protocol DayTopicTBCTapMoreDelegete <NSObject>
/**
 *  点击更多评论
 *
 */
-(void)moreTapIndexPath:(NSIndexPath*)indexPath tid:(NSString*)tid;

@end

@interface DayTopicTBCMoreView : UIView


-(void)getmodel:(DayTopicFramModel*)model indexPath:(NSIndexPath *)indexPath;


@property (assign, nonatomic)id<DayTopicTBCTapMoreDelegete>delegate;
@end
