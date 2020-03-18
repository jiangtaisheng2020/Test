//
//  LXBaseCell.h
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXBaseTableViewCell : UITableViewCell

- (void)configurationCell:(id)object;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
