//
//  DayTopicADView.h
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DayTopicADTapDelegete <NSObject>

@optional

-(void)tapAD:(int)adNum;

@end

@interface DayTopicADView : UIView<UIScrollViewDelegate>

@property (assign, nonatomic)id<DayTopicADTapDelegete>delegate;

-(instancetype)initWithFrame:(CGRect)frame;


- (void)getImgArr:(NSArray *)arr;


@end
