//
//  DayTopicTBCContestCellTableViewCell.h
//  XLXBadmintoon
//
//  Created by bean on 16/6/27.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayTopicFramModel.h"
@interface DayTopicTBCContestCellTableViewCell : UITableViewCell


-(void)configCellWithModel:(DayTopicFramModel*)model indexPath:(NSIndexPath*)indexPath;

@end
