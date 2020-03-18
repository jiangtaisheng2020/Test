//
//  H5LinksHandls.m
//  testH5Links
//
//  Created by bean on 16/4/6.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "H5LinksHandls.h"

@implementation H5LinksHandls

/**
 *  处理H5链接
 *
 *  @param dic 服务器获取的链接
 */
+(void)h5linksDic:(NSDictionary*)dic
{
    //    DLog(@"%@",dic);
    //我的关注
//    NSString * iosattention          = dic[@"iosattention"];
//    NSString * iosattentionParameter = dic[@"iosattentionParameter"];
//    [self h5UrlHandleStr:iosattention handelParameterStr:iosattentionParameter saveKey:kUDZhid];
//    //报名
//    NSString * iosbaoming = dic[@"iosbaoming"];
//    NSString * iosbaomingParameter = dic[@"iosbaomingParameter"];
//    [self h5UrlHandleStr:iosbaoming handelParameterStr:iosbaomingParameter saveKey:XLXUserH5LinkBaoMing];
//    //赛事
//    NSString * ioscontest = dic[@"ioscontest"];
//    NSString * ioscontestParameter = dic[@"ioscontestParameter"];
//    [self h5UrlHandleStr:ioscontest handelParameterStr:ioscontestParameter saveKey:XLXUserH5LinkContest];
//    //我的粉丝
//    NSString * iosfans               = dic[@"iosfans"];
//    NSString * iosfansParameter      = dic[@"iosfansParameter"];
//    [self h5UrlHandleStr:iosfans handelParameterStr:iosfansParameter saveKey:XLXUserH5LinkFans];
//    //约战
//    NSString * iosmatch = dic[@"iosmatch"];
//    NSString * iosmatchParameter = dic[@"iosmatchParameter"];
//    [self h5UrlHandleStr:iosmatch handelParameterStr:iosmatchParameter saveKey:XLXUserH5LinkMatch];
//    //消息通知
//    NSString * iosmsgnew             = dic[@"iosmsgnew"];
//    NSString * iosmsgnewParameter    = dic[@"iosmsgnewParameter"];
//    [self h5UrlHandleStr:iosmsgnew handelParameterStr:iosmsgnewParameter saveKey:XLXUserH5LinkMessageBox];
//    //我的俱乐部
//    NSString * iosmyclub             = dic[@"iosmyclub"];
//    NSString * iosmyclubParameter    = dic[@"iosmyclubParameter"];
//    [self h5UrlHandleStr:iosmyclub handelParameterStr:iosmyclubParameter saveKey:XLXUserH5LinkMyClub];
//    //我的帖子
//    NSString * iospost               = dic[@"iospost"];
//    NSString * iospostParameter      = dic[@"iospostParameter"];
//    [self h5UrlHandleStr:iospost handelParameterStr:iospostParameter saveKey:XLXUserH5LinkPost];
//    //打卡健身
//    NSString * iospunchcard = dic[@"iospunchcard"];
//    NSString * iospunchcardParameter = dic[@"iospunchcardParameter"];
//    [self h5UrlHandleStr:iospunchcard handelParameterStr:iospunchcardParameter saveKey:XLXUserH5LinkCard];
//    //羽球圈
//    NSString * iosyuqiuquan          = dic[@"iosyuqiuquan"];
//    NSString * iosyuqiuquanParameter = dic[@"iosyuqiuquanParameter"];
//    [self h5UrlHandleStr:iosyuqiuquan handelParameterStr:iosyuqiuquanParameter saveKey:XLXUserH5LinkYQQ];
//    //羽球商城
//    NSString * iosyuqiushop          = dic[@"iosyuqiushop"];
//    NSString * iosyuqiushopParameter = dic[@"iosyuqiushopParameter"];
//    [self h5UrlHandleStr:iosyuqiushop handelParameterStr:iosyuqiushopParameter saveKey:XLXUserH5LinkYQQShop];
//    //每日话题
//    NSString * iosdaytopic = dic[@"iosdaytopic"];
//    NSString * iosdaytopicParameter = dic[@"iosdaytopicParameter"];
//    [self h5UrlHandleStr:iosdaytopic handelParameterStr:iosdaytopicParameter saveKey:XLXUserH5LinkDayTopic];
//    //我的钱包
//    NSString * iospay = dic[@"iospay"];
//    NSString * iospayParameter = dic[@"iospayParameter"];
//    [self h5UrlHandleStr:iospay handelParameterStr:iospayParameter saveKey:XLXUserH5LinkMyWallet];
//    //约战记录
//    NSString * iosbattle = dic[@"iosbattle"];
//    NSString * iosbattleParameter = dic[@"iosbattleParameter"];
//    [self h5UrlHandleStr:iosbattle handelParameterStr:iosbattleParameter saveKey:XLXUserH5LinkBattle];
//    //优惠券
//    NSString * iosvipquan = dic[@"iosvipquan"];
//    NSString * iosvipquanParameter = dic[@"iosvipquanParameter"];
//    [self h5UrlHandleStr:iosvipquan handelParameterStr:iosvipquanParameter saveKey:XLXUserH5LinkYHQ];
//    //配置文件版本号
//    NSString * iosversion            = dic[@"iosversion"];
//    [[NSUserDefaults standardUserDefaults]setObject:iosversion forKey:XLXUserH5LinkVersion];
}

/**
 *  传递过来的后台配置存到本地
 *
 *  @param handleStr          前面的url
 *  @param handelParameterStr 需要拼接的参数
 */
+(void)h5UrlHandleStr:(NSString*)handleStr handelParameterStr:(NSString*)handelParameterStr saveKey:(NSString*)saveKey
{
    //先判断需不需要拼接token
    //再判断需不需要拼接token
    NSString * replaceStr2 = [self h5PatternStr:@"uid" handleStr:handleStr handelParameterStr:handelParameterStr];
    //存储相关链接
    [[NSUserDefaults standardUserDefaults]setObject:replaceStr2 forKey:saveKey];
}

/**
 *  用正则进行处理拼接
 *
 *  @param patternStr         正则判断的参数
 *  @param handleStr          后台的url
 *  @param handelParameterStr 需要拼接的参数
 *
 *  @return 返回最终可以访问的链接
 */
+(NSString*)h5PatternStr:(NSString*)patternStr handleStr:(NSString*)handleStr handelParameterStr:(NSString*)handelParameterStr
{
    if (handelParameterStr == nil)
    {
        return handleStr;
    }
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc] initWithPattern:patternStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *regularArr = [regularexpression matchesInString:handelParameterStr options:NSMatchingReportProgress range:NSMakeRange(0, handelParameterStr.length)];
    if (!(regularArr.count > 0))
    {
        return handleStr;
    }
    NSMutableString *returnStr = [NSMutableString stringWithString:handleStr];
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wunused-variable"
    for (NSTextCheckingResult *arr in regularArr)
    {
            if ([patternStr isEqualToString:@"uid"])
        {
            NSString * zhid = [[NSUserDefaults standardUserDefaults]objectForKey:kUDZhid];
            NSString * subStr = [NSString stringWithFormat:@"&uid=%@",zhid];
            [returnStr appendString:subStr];
        }
    }
    return returnStr;
#pragma clang diagnostic pop
}


@end
