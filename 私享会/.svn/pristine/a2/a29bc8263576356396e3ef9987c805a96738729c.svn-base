//
//  SYMyInfoTableView.h
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

@protocol SYMyInfoDelegate <NSObject>

-(void)didSelectIndexPath:(NSIndexPath*)indexPath;

@end

#import <UIKit/UIKit.h>

@interface SYMyInfoTableView : UITableView

@property(nonatomic,weak)id<SYMyInfoDelegate>myInfoDel;

-(void)loadData:(NSMutableArray*)dataArr;

@end
