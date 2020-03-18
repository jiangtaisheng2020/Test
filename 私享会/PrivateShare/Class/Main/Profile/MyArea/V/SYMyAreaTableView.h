//
//  SYMyAreaTableView.h
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//
typedef NS_ENUM(NSUInteger, CityChooseType)
{
    Provience = 0,//判断省份界面
    City,//判断城市界面
    County//判断县级界面
    
} ;

@protocol CityChooseDelegate <NSObject>


@optional

-(void)cityChooseNext:(NSArray*)nextArray chooseStr:(NSString*)chooseStr;

@end

#import <UIKit/UIKit.h>


@interface SYMyAreaTableView : UITableView


@property (nonatomic,weak  ) id<CityChooseDelegate> cityDelegate;

@property (nonatomic,assign) CityChooseType     chooseType;


-(void)loadDataArray:(NSArray*)dataArray;


@end
