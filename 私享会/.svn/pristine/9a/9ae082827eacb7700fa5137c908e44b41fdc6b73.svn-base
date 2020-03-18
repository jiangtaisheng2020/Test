//
//  NSObject+AutoSize.m
//  DayTopic
//
//  Created by bean on 16/5/19.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "NSObject+AutoSize.h"

@implementation NSObject (AutoSize)

- (CGSize)calculateLabelighWithText:(NSString *)textStr withMaxSize:(CGSize)maxSize withFont:(CGFloat)font
{
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font], NSFontAttributeName, nil];
    CGSize actualSize = [textStr boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
    return actualSize;
}
@end
