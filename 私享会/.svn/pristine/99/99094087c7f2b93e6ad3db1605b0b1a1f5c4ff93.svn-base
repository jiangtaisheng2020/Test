//
//  SYProfileTableView.h
//  PrivateShare
//
//  Created by bean on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

@protocol SYProfileDelegate <NSObject>

-(void)didSeleceCell:(NSIndexPath*)indexPath;

-(void)didTapEdit;

@end

#import <UIKit/UIKit.h>

@interface SYProfileTableView : UITableView

@property(nonatomic,weak)id <SYProfileDelegate> profileDel;


-(void)loadData:(NSMutableArray*)dataArr;


@end
