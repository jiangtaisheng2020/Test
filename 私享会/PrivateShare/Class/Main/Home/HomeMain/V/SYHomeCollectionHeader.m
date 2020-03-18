//
//  SYHomeCollectionHeader.m
//  PrivateShare
//
//  Created by bean on 16/9/21.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYHomeCollectionHeader.h"

@implementation SYHomeCollectionHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kCellBackGroundColor;
        
        UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - 44, 5, 44)];
        colorView.backgroundColor = kBlueFontColor;
        [self addSubview:colorView];
        
        self.headerBottomLB = [[UILabel alloc] initWithFrame:CGRectMake(12, colorView.y, kScreenWidth, colorView.height)];
        self.headerBottomLB.font = [UIFont systemFontOfSize:18];
        self.headerBottomLB.textColor = kBlackFontColor;
        [self addSubview:self.headerBottomLB];
        
        UIView *hline = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height, frame.size.width, 0.5)];
        hline.backgroundColor = kLineColor;
        [self addSubview:hline];
    }
    
    return self;
}

@end
