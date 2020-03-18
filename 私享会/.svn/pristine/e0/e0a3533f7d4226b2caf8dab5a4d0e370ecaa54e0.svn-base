//
//  NSString+B_ForbiddenStr.m
//  XLXBadmintoon
//
//  Created by bean on 16/5/30.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "NSString+B_ForbiddenStr.h"

@implementation NSString (B_ForbiddenStr)
-(BOOL)isForbidenString
{
    BOOL isOK = NO;
    //判断是否有emoji
    if ([self emoji]==YES)
    {
        return isOK;
    }
    else
    {
        for (int i = 0; i<[self length]; i++)
        {
            //截取字符串中的每一个字符
            NSString *s = [self substringWithRange:NSMakeRange(i, 1)];
            
#pragma mark 昵称不能为空
            if ([s isEqualToString:@""])
            {
                isOK = NO;
                break;
                
            }
#pragma mark 昵称不能有","
            else if ([s isEqualToString:@","]||[s isEqualToString:@"，"])
            {
                isOK = NO;
                break;
            }
            else
            {
                isOK = YES;
                
            }
            
        }
        
    }
    
    return isOK;
}


-(BOOL)emoji
{
    __block BOOL returnValue = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
     {
         const unichar hs = [substring characterAtIndex:0];
         if (0xd800 <= hs && hs <= 0xdbff)
         {
             if (substring.length > 1)
             {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f)
                 {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1)
         {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3)
             {
                 returnValue = YES;
             }
         } else
         {
             if (0x2100 <= hs && hs <= 0x27ff)
             {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07)
             {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935)
             {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299)
             {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    return returnValue;
}


+(NSString*)timeString:(NSString*)timeType
{
    NSDate * nowDate = [NSDate dateWithTimeIntervalSinceNow:3600*24*7];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = timeType;
    
    NSString * time = [formatter stringFromDate:nowDate];
  
    return time;
}

@end
