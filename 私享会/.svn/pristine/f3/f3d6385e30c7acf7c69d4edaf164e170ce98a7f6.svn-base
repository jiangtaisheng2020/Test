//
//  RegisterView.h
//  PrivateShare
//
//  Created by apple2015 on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RegisterViewDelegate <NSObject>

- (void)setFormRegisterOrLoginMessage:(NSDictionary *)dic;
- (void)registerViewKeyboardHeight:(CGFloat)height;
- (void)getVerificationCode:(NSString*)phoneNum;

@end

@interface RegisterView : UIView
@property(nonatomic,assign) id  <RegisterViewDelegate> delegate;

@end
