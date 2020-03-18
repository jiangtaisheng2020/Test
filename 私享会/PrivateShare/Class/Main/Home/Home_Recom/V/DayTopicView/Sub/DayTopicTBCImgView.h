//
//  DayTopicTBCImgView.h
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayTopicFramModel.h"

@protocol DayTopicTBCImgViewDelegate <NSObject>

/**
 *  点击cell
 *
 */
-(void)imgTap:(NSArray*)imgArray indexPath:(NSIndexPath*)indexPath tapNum:(NSInteger)tapNum;

@end

@interface DayTopicTBCImgView : UIView


-(void)getmodel:(DayTopicFramModel*)model indexPath:(NSIndexPath *)indexPath;


@property(nonatomic,weak)id<DayTopicTBCImgViewDelegate>imgDel;

@end
