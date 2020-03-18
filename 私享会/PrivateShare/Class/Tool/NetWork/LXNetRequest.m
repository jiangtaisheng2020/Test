//
//  JTSNetRequest.m
//  XLXBadmintoon
//
//  Created by apple2015 on 16/3/18.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "LXNetRequest.h"
#import "LXHelpClass.h"
#import "AppDelegate+SYLogin.h"

static BOOL loadingToken = NO;
static NSMutableArray *blocks;

@interface LXNetRequest ()

@end

@implementation LXNetRequest

DEFINE_SINGLETON_FOR_CLASS(LXNetRequest);

- (instancetype)init
{
    self = [super init];
    if (self) {
        //默认为Wi-Fi状态
        self.wifiType = AFNetworkReachabilityStatusReachableViaWiFi;
    }
    return self;
}

+ (void)getWithUrlString:(NSString *)urlStr withParam:(NSDictionary *)param success:(void (^)(NSDictionary * responseDic))success failure:(void (^)(NSError *error))failure
{
    [self getShortToken:^(){
        
        AFHTTPSessionManager *  manager= [self afmanager];
        
        
        [manager GET:urlStr parameters:param progress:^(NSProgress * _Nonnull downloadProgress)
        {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
        {
            NSNumber * state;
            if (responseObject[@"status"]) {
                
                state=responseObject[@"status"];
                if ([state longValue]==4032||[state longValue]==4031)
                {
                    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"登录失败，请重新登录" delegate:[self sharedLXNetRequest]  cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                    [alert show];
                    
                }
                
            }
            
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
        
        
    }];
    

}

+ (void)postWithUrlString:(NSString *)urlStr withParam:(NSDictionary *)param success:(void (^)(NSDictionary * responseDic))success failure:(void (^)(NSError *error))failure
{
    [LXNetRequest getShortToken:^{
        
//        NSUserDefaults * defaults=[NSUserDefaults standardUserDefaults];
        
//        NSString * token=[defaults objectForKey:XLXUserToken];
        //
        AFHTTPSessionManager *  manager=[AFHTTPSessionManager manager];
        manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];

//        [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
//        [manager.requestSerializer setValue:XLYQQAPP forHTTPHeaderField:@"website"];
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html",@"application/json",@"text/json",nil];
        
        [manager POST:urlStr parameters:param progress:^(NSProgress * _Nonnull uploadProgress) { } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSNumber * state;
            if (responseObject[@"status"]) {
                
                state=responseObject[@"status"];
                if ([state longValue]==4032||[state longValue]==4031)
                {
                    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"登录失败，请重新登录" delegate:[self sharedLXNetRequest]  cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                    [alert show];
                    
                }
                
            }
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
             
             failure(error);
         }];
        
        
        
        
    }];
    
    
}




+ (void)putWithUrlString:(NSString *)urlStr withParam:(NSDictionary *)param success:(void (^)(NSDictionary * responseDic))success failure:(void (^)(NSError *error))failure
{
    [LXNetRequest getShortToken:^{
        
        AFHTTPSessionManager *  manager= [self afmanager];
        
        [manager PUT:urlStr parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
        {
            NSNumber * state;
            if (responseObject[@"status"]) {
                
                state=responseObject[@"status"];
                if ([state longValue]==4032||[state longValue]==4031)
                {
                    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"登录失败，请重新登录" delegate:[self sharedLXNetRequest]  cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                    [alert show];
                    
                }
                
            }
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
        {
            failure(error);
        }];
        
    }];
    

}

+ (void)deleteWithUrlString:(NSString *)urlStr withParam:(NSDictionary *)param success:(void (^)(NSDictionary * responseDic))success failure:(void (^)(NSError *error))failure
{
    [LXNetRequest getShortToken:^{
        AFHTTPSessionManager *  manager= [self afmanager];
        [manager DELETE:urlStr parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
        {
            NSNumber * state;
            if (responseObject[@"status"]) {
                
                state=responseObject[@"status"];
                if ([state longValue]==4032||[state longValue]==4031)
                {
                    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"登录失败，请重新登录" delegate:[self sharedLXNetRequest]  cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                    [alert show];
                    
                }
                
            }
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
        
        
    }];
    

}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if (buttonIndex==0)
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:kUDLoginSuccess];

        [[LXHelpClass appDelegate] setRootwithLogin];
        
    }

}





+(void)getShortToken:(void (^)())success
{
    long long tokenTime = [[[NSUserDefaults standardUserDefaults]objectForKey:kUDExpireTimeInSecond]longLongValue];//服务器给的过期时间
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%f", a];//今日时间
    NSString * longtoken = [[NSUserDefaults standardUserDefaults]objectForKey:kUDLongTimeToken];//长token
    
    
    if (blocks == nil) {
        blocks = [NSMutableArray array];
    }
    
    if (tokenTime == 0||tokenTime<[timeString longLongValue])
    {
        if (loadingToken == NO && blocks.count > 0) {
            [blocks removeAllObjects];
        }
        [blocks addObject:success];
        
        if (!loadingToken)
        {
            loadingToken = YES;
            
            AFHTTPSessionManager *  manager= [self afmanager];

            NSString * path = [NSString stringWithFormat:@"%@%@%@/%@",kSXHXLSPath,kSXHGetShortToken,longtoken,kAPPName];
            [manager GET:path parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                //1.如果长token也失效了跳回登录界面
                NSNumber * state=responseObject[@"status"];
                
                if ([state longValue]==4032||[state longValue]==4031)
                {
                    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"验证失败" delegate:[self sharedLXNetRequest]  cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                    [alert show];
                    
                }
                
                //2.如果长token没失效需要将返回的短token和失效时间存起来
                
                if ([state longValue]==2000)
                {
                    
                    NSDictionary * dic = responseObject[@"result"];
                    
                    if ([dic[@"resultCode"]intValue]==1)
                    {
                        NSDictionary * obj = dic[@"obj"];
                        
                        [[NSUserDefaults standardUserDefaults]setObject:obj[@"token"] forKey:kUDToken];
                        [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithLongLong:[obj[@"expireTimeInSecond"]longLongValue]] forKey:kUDExpireTimeInSecond];
                        
                    }
                    
                    
                    for (int i = 0; i < blocks.count; i++) {
                        void (^block)() = blocks[i];
                        block();
                    }
                    
                }
                
                loadingToken = NO;
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DeLog(@"%@",error.description);
                DeLog(@"get Token!???????????");
                loadingToken = NO;
            }];
            
            
            
        }
    } else
    {
        
        success();
    }
}


+(AFHTTPSessionManager*)afmanager
{
    //读取token值
    NSUserDefaults * defaults=[NSUserDefaults standardUserDefaults];
    NSString * token=[defaults objectForKey:kUDToken];
    
    AFHTTPSessionManager *  manager=[AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    [manager.requestSerializer setValue:kAPPName forHTTPHeaderField:@"website"];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html",@"application/json",@"text/json",nil];
    
    
    return manager;
}

+ (void)getCurrentNet
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        [LXNetRequest sharedLXNetRequest].wifiType = status;
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:            //未知网络
                break;
            case AFNetworkReachabilityStatusNotReachable:       //没有网络
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:   //手机自带网络
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:   //WIFI
                break;
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AFNetworkReachabilityStatus" object:[NSString stringWithFormat:@"%d", (int)status]];
    }];
    [manager startMonitoring];
}

@end
