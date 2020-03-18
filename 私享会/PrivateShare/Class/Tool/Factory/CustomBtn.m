//
//  CustomBtn.m
//  Button点击区域放大
//
//  Created by apple2015 on 16/1/13.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import "CustomBtn.h"

@implementation CustomBtn

-(id)initWithFrame:(CGRect)frame
{

    if (self=[super initWithFrame:frame]) {

        
    }

    
    return self;
}

//官方在视频中给出的示例源码
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    CGRect bounds = self.bounds;
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    BOOL is= CGRectContainsPoint(bounds, point);
    return  is;
}

@end
