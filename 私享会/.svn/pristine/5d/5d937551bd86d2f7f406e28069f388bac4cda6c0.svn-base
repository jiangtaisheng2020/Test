//
//  SYUpdateImg.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYUpdateImg.h"

@implementation SYUpdateImg




//num:图片最多选择个数 obj:0代表显示选择，1代表显示完成
+(void)setNav:(ZYQAssetPickerController*)picker Num:(NSInteger)num setObj:(NSString*)obj
{
    picker.maximumNumberOfSelection = num;
    picker.assetsFilter = [ALAssetsFilter allPhotos];
    picker.showEmptyGroups=NO;
    picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return YES;
    }];
    
}



+(void)postImgArr:(NSMutableArray*)imgArr postUrl:(NSString*)postUrl notification:(NSString*)notification
{
    #warning 需要修改请求
    NSString * zhid = [[NSUserDefaults standardUserDefaults]objectForKey:kUDZhid];
    NSString * urlStr = [NSString stringWithFormat:postUrl,zhid];
    NSMutableDictionary * urlDic = [[NSMutableDictionary alloc]init];
    for (int i = 0; i<imgArr.count; i++)
    {
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html",@"application/json",@"text/plain", nil];
        
        [manager POST:urlStr parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
         {
             [formData appendPartWithFileData:UIImageJPEGRepresentation(imgArr[i], 0.8) name:@"attach" fileName:@"image11.jpg" mimeType:@"image/png/JPG"];
             
         } progress:^(NSProgress * _Nonnull uploadProgress)
         {
             
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             NSDictionary * infoDic = responseObject[@"info"];
             
             [urlDic setValue:infoDic[@"tinyImage"] forKey:[NSString stringWithFormat:@"%d",i]];
             
             NSString * result = responseObject[@"result"];
             
             if (imgArr.count == urlDic.count)
             {
                 NSDictionary * dic = @{@"result":result,@"imgArr":urlDic,@"selectImg":imgArr};
                 
                 [[NSNotificationCenter defaultCenter]postNotificationName:notification object:dic];
             }
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
             [[NSNotificationCenter defaultCenter]postNotificationName:notification object:error];
         }];
        
    }
    
    
}

@end
