//
//  SYUserDefaultMyInfo.m
//  PrivateShare
//
//  Created by bean on 16/9/23.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYUserDefaultMyInfo.h"

@implementation SYUserDefaultMyInfo
+(void)userdefaultSaveInfo:(NSDictionary*)dic
{
    [[NSUserDefaults standardUserDefaults]setObject:dic[kUDAvatar] forKey:kUDAvatar];
    [[NSUserDefaults standardUserDefaults]setObject:dic[kUDCity] forKey:kUDCity];
    long long expireTimeInSecond = [dic[kUDExpireTimeInSecond]longLongValue];
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithLongLong:expireTimeInSecond] forKey:kUDExpireTimeInSecond];
    [[NSUserDefaults standardUserDefaults]setObject:dic[kUDLongTimeToken] forKey:kUDLongTimeToken];
    [[NSUserDefaults standardUserDefaults]setObject:dic[kUDNation] forKey:kUDNation];
    [[NSUserDefaults standardUserDefaults]setObject:dic[kUDNickname] forKey:kUDNickname];
    [[NSUserDefaults standardUserDefaults]setObject:dic[kUDProvince] forKey:kUDProvince];
    [[NSUserDefaults standardUserDefaults]setObject:dic[kUDQQ] forKey:kUDQQ];
    [[NSUserDefaults standardUserDefaults]setObject:dic[kUDSex] forKey:kUDSex];
    [[NSUserDefaults standardUserDefaults]setObject:dic[kUDSignature] forKey:kUDSignature];
    [[NSUserDefaults standardUserDefaults]setObject:dic[kUDToken] forKey:kUDToken];
    [[NSUserDefaults standardUserDefaults]setObject:dic[kUDZhName] forKey:kUDZhName];
    [[NSUserDefaults standardUserDefaults]setObject:dic[kUDZhPhone] forKey:kUDZhPhone];
    [[NSUserDefaults standardUserDefaults]setObject:dic[kUDZhid] forKey:kUDZhid];
    [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:kUDLoginSuccess];
    
    
    [self saveAvatar:dic[kUDAvatar]];
}

+(void)saveAvatar:(NSString*)avatarPath
{
    NSURL * url = [NSURL URLWithString:avatarPath];
    NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"GET"];
    NSOperationQueue *queue=[[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if ([data length]>0&&error==nil)
        {
#pragma mark 存储头像
            [[NSUserDefaults standardUserDefaults]setValue:data forKey:kUDAvatarImgData];
        }else
        {
            [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:kUDLoginSuccess];
        }}];
}


@end
