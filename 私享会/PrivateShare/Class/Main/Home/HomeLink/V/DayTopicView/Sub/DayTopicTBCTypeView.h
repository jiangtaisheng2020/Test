//
//  DayTopicTBCTypeView.h
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayTopicFramModel.h"
@protocol DayTopicTBCTypeViewDelegete <NSObject>

/**
 *  点击类型
 */
//-(void)typeTapTypeView;
/**
 *  点击打赏
 */
-(void)typeTapDSView:(NSIndexPath*)indexPath tid:(NSString*)tid ava:(NSString*)ava nickName:(NSString*)nick forward:(NSString*)forward;
/**
 *  点击流量
 */
//-(void)tapSeeView;
/**
 *  点击点赞
 */
//-(void)typeTapDZView:(NSIndexPath*)indexPath uid:(NSString*)uid;
/**
 *  点击评论
 */
-(void)typeTapPLView:(NSIndexPath*)indexPath uid:(NSString*)uid;


@end

@interface DayTopicTBCTypeView : UIView

-(void)getmodel:(DayTopicFramModel*)model indexPath:(NSIndexPath*)indexPath;

@property (assign, nonatomic)id<DayTopicTBCTypeViewDelegete>delegate;

@end
