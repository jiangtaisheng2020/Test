//
//  LeavingMessageView.h
//  PrivateShare
//
//  Created by apple2015 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeavingMessageViewDelegate <NSObject>

- (void)setFormMessage:(NSString *)textString;
- (void)keyboardHeight:(CGFloat)height;
@end
@interface LeavingMessageView : UIView
@property(nonatomic,assign) id  <LeavingMessageViewDelegate> delegate;
@end
