//
//  isPhoneNumber.m
//  XLX
//
//  Created by bean on 15/10/10.
//  Copyright (c) 2015年 com.xile. All rights reserved.
//

#import "isPhoneNumber.h"

@implementation isPhoneNumber

/**
 *  验证手机号是否为空
 */
+ (BOOL)isPobileNumEmpty:(NSString *)mobileNum {
    if(mobileNum.length) return NO;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"手机号不能为空！" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
    return YES;
}

/**
 *  验证手机号合法性
 */
+ (BOOL)isPhoneNumAvailability:(NSString *)mobileNum {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186,170-179
     17         */
//    NSString * CU = @"^1(3[0-2]|5[256]|8[56]|7[0-9])\\d{8}$";
    NSString * CU = @"^1(3[0-9]|5[0-9]|8[0-9]|7[0-9]|4[0-9])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    
//    + (BOOL)validateMobile:(NSString *)mobileNum
//    {
//        NSString *strExpression = @"(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", strExpression];
//        return [predicate evaluateWithObject:mobileNum];
//    }
//    //    语法与释义：
//    　　基础语法 "^([]{})([]{})([]{})$"
//    　　正则字符串 = "开始（[包含内容]{长度}）（[包含内容]{长度}）（[包含内容]{长度}）结束"
//    实例：
//    　　字符串；tel:086-0666-88810009999
//    　　原始正则："^tel:[0-9]{1,3}-[0][0-9]{2,3}-[0-9]{8,11}$"
//    　　速记理解：开始 "tel:普通文本"[0-9数字]{1至3位}"-普通文本"[0数字][0-9数字]{2至3位}"-普通文本"[0-9数字]{8至11位} 结束"
//    　　等价简写后正则写法："^tel:\d{1,3}-[0]\d{2,3}-\d{8,11}$"
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入正确的手机号码。" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
        return NO;
    }
}

/**
 *  校验密码位数
 */
+ (BOOL)checkLengthOfPassword:(NSString *)password {
    if(password.length >= 6 && password.length <= 12) return YES;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"密码" message:@"密码长度在6-12位之间" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
    
    return NO;
}

/**
 *  校验确认密码和密码是否相同
 */
+ (BOOL)checkVerifyPassword:(NSString *)verifyPassword password:(NSString *)password {
    
    if([verifyPassword isEqualToString:password]) return YES;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"两次输入密码不一致,请重新设置。" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
    
    return NO;
}

/**
 *  校验验证码位数
 */
+ (BOOL)checkVerificationCodeLength:(NSString *)verificationCode {
    if(verificationCode.length == 4) return YES;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"验证码" message:@"验证码长度为4位" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
    return NO;
}


@end
