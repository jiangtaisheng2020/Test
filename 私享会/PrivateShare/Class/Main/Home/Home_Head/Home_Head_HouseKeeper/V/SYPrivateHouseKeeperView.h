//
//  SYPrivateHouseKeeperView.h
//  PrivateShare
//
//  Created by bean on 2017/3/1.
//  Copyright © 2017年 xunbao. All rights reserved.
//

@protocol SYPriVateHouseProtocol <NSObject>

-(void)clickPhone;
-(void)clickSignHouseKeeper;

@end

#import <UIKit/UIKit.h>


@interface SYPrivateHouseKeeperView : UIView

@property(nonatomic,weak)id<SYPriVateHouseProtocol>syPHDelegate;

@end
