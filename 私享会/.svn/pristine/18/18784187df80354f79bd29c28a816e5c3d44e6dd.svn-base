//
//  TSPhoneView.h
//  PrivateShare
//
//  Created by apple2015 on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TSPhoneViewDelegate <NSObject>

- (void)setFormPhone:(NSString *)text;
- (void)keyboardHeight:(CGFloat)height;
@end

@interface TSPhoneView : UIView
@property(nonatomic,copy)NSString * titleStr;
@property(nonatomic,copy)NSString * textStr;
@property(nonatomic,assign) id  <TSPhoneViewDelegate> delegate;

@end
