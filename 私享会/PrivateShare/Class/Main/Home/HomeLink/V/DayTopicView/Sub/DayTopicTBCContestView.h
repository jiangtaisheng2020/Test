//
//  DayTopicTBCContestView.h
//  XLXBadmintoon
//
//  Created by bean on 16/6/27.
//  Copyright © 2016年 com.xile. All rights reserved.
//

@protocol DayTopicTBCContestViewDelegate <NSObject>

/**
 *  点击cell
 *
 */
-(void)contestTap:(NSString*)tid indexPath:(NSIndexPath*)indexPath;

-(void)contestTopTap:(int)tapNum;

@end

#import <UIKit/UIKit.h>

@interface DayTopicTBCContestView : UITableView


-(void)reloadData:(NSMutableArray*)dataArr;

@property(nonatomic,weak)id<DayTopicTBCContestViewDelegate>contestDel;


@end
