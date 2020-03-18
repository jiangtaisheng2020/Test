//
//  SYHomeSearchHeaderView.h
//  Search
//
//  Created by bean on 2016/10/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//
@protocol SYHomeSearchDel <NSObject>

-(void)homeSearch:(NSString*)searchText searchCity:(NSString*)searchCity;
-(void)homePhone:(NSString*)phoneNum;

@end
#import <UIKit/UIKit.h>

@interface SYHomeSearchHeaderView : UIView

@property(nonatomic,weak)id<SYHomeSearchDel>homeSearchDel;

@end
