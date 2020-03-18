//
//  SYHomeCollectionTitleHeader.m
//  PrivateShare
//
//  Created by bean on 16/9/21.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYHomeCollectionTitleHeader.h"

@implementation SYHomeCollectionTitleHeader
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIView * headerBottomV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 46)];
        headerBottomV.backgroundColor = kBackGroundColor;
        [self addSubview:headerBottomV];
        
        
        
        self.headerBottomLB = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-18*10/2, 15, 18*10, 16)];
        self.headerBottomLB.textAlignment = 1;
        [headerBottomV addSubview:self.headerBottomLB];
        
        
        UIView * leftLine = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.headerBottomLB.frame)-69, headerBottomV.frame.size.height/2-0.5, 59, 0.5)];
        leftLine.backgroundColor = Color(204, 204, 204);
        [headerBottomV addSubview:leftLine];
        
        
        UIView * rightLine = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.headerBottomLB.frame)+10, headerBottomV.frame.size.height/2-0.5, 59, 0.5)];
        rightLine.backgroundColor = Color(204, 204, 204);
        [headerBottomV addSubview:rightLine];
    }
    
    return self;
}
@end
