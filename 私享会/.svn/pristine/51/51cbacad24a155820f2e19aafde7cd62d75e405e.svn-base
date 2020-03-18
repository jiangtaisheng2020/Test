//
//  TSSuggestionView.h
//  PrivateShare
//
//  Created by apple2015 on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TSSuggestionViewDelegate <NSObject>

- (void)setFormMessage:(NSString *)textstring;
- (void)keyboardHeight:(CGFloat)height;
@end
@interface TSSuggestionView : UIView
@property(nonatomic,assign) id  <TSSuggestionViewDelegate> delegate;
@property(nonatomic,copy)NSString * titleStr;
@property(nonatomic,copy)NSString * textStr;
@property(nonatomic,copy)NSString * text;

@end
