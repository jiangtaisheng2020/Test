//
//  SYUpdateImg.h
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYUpdateImg : NSObject

+(void)setNav:(ZYQAssetPickerController*)picker Num:(NSInteger)num setObj:(NSString*)obj;


+(void)postImgArr:(NSMutableArray*)imgArr postUrl:(NSString*)postUrl notification:(NSString*)notification;
@end
