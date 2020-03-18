//
//  JTSNetRequest.h
//  XLXBadmintoon
//
//  Created by apple2015 on 16/3/18.
//  Copyright © 2016年 com.xile. All rights reserved.
//


@interface LXNetRequest : NSObject<UIAlertViewDelegate>

@property (nonatomic, assign) AFNetworkReachabilityStatus wifiType;

+ (instancetype)sharedLXNetRequest;

+ (void)getWithUrlString:(NSString *)urlStr withParam:(NSDictionary *)param success:(void (^)(NSDictionary * responseDic))success failure:(void (^)(NSError *error))failure;
+ (void)postWithUrlString:(NSString *)urlStr withParam:(NSDictionary *)param success:(void (^)(NSDictionary * responseDic))success failure:(void (^)(NSError *error))failure;
+ (void)putWithUrlString:(NSString *)urlStr withParam:(NSDictionary *)param success:(void (^)(NSDictionary * responseDic))success failure:(void (^)(NSError *error))failure;
+ (void)deleteWithUrlString:(NSString *)urlStr withParam:(NSDictionary *)param success:(void (^)(NSDictionary * responseDic))success failure:(void (^)(NSError *error))failure;
+ (void)getShortToken:(void (^)())success;

@end
