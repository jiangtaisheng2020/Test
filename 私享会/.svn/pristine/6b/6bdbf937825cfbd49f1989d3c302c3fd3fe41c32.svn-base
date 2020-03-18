//
//  SYSettingTableView.h
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SYSettingDelegate <NSObject>

-(void)didSeleceCell:(NSIndexPath*)indexPath;

-(void)logOut;

@end

@interface SYSettingTableView : UITableView

-(void)loadData:(NSMutableArray*)dataArr;

@property(nonatomic,weak)id <SYSettingDelegate> setDel;

@end
