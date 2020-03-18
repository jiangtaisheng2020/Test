//
//  NSString+B_ForbiddenStr.h
//  XLXBadmintoon
//
//  Created by bean on 16/5/30.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (B_ForbiddenStr)
-(BOOL)isForbidenString;
/**
 *  时间
 *
 *  @param timeType 时间格式
 *
 *  @return 返回时间
 */
+(NSString*)timeString:(NSString*)timeType;

@end
