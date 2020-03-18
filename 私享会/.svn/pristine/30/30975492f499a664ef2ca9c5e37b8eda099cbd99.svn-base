//
//  SYInputTextView.h
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

@protocol SYInputDelegate <NSObject>

-(void)didReturnText:(NSString*)text textTag:(NSInteger)tag;

@end


#import <UIKit/UIKit.h>

@interface SYInputTextView : UIView

-(void)inputViewPlaceHolder:(NSString*)placeHolder img:(UIImage*)img;//__OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_NA, __IPHONE_2_0, __IPHONE_6_0)

@property(nonatomic,weak)id<SYInputDelegate>inputDel;


@end
