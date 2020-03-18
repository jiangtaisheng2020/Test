//
//  LoginView.h
//  PrivateShare
//
//  Created by apple2015 on 16/9/21.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LoginViewDelegate <NSObject>

- (void)setFormRegisterOrLoginMessage:(NSDictionary *)dic;
- (void)loginViewKeyboardHeight:(CGFloat)height;
- (void)forgetPassword;
@end
@interface LoginView : UIView
@property(nonatomic,assign) id  <LoginViewDelegate> delegate;

@end
