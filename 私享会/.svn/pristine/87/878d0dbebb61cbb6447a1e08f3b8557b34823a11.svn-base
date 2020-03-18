//
//  TSSuggestionView.m
//  PrivateShare
//
//  Created by apple2015 on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "TSSuggestionView.h"
#import "BattleTextView.h"
@interface TSSuggestionView ()<UITextViewDelegate>
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)BattleTextView * textView;
@property (nonatomic, assign) CGFloat keyboardHeight;

@end

@implementation TSSuggestionView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
        
    }
    return self;
    
}

- (void)createUI
{
    
    UIView * topView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    topView.backgroundColor=[UIColor whiteColor];
    [self addSubview:topView];
    
    UILabel * titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(12, 14, 200, 16)];
    titleLabel.textAlignment=NSTextAlignmentLeft;
    titleLabel.font=[UIFont systemFontOfSize:16];
    //    titleLabel.textColor=[UIColor colorWithRed:0/255.0 green:129/255.0 blue:204/255.0 alpha:1];
    titleLabel.textColor= [UIColor blackColor];
    self.titleLabel=titleLabel;
    [topView  addSubview:titleLabel];
    
    //创建textView
    BattleTextView * textView =[[BattleTextView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame), kScreenWidth, self.frame.size.height-44)];
    textView.font = [UIFont systemFontOfSize:14];
//    textView.placehoder = @"说出你的需求，给我们的客服留言，私人管家将尽快为你定制属于您的专属旅游计划 。（如旅游时间，出发地，目的地,人数等。）";
    textView.placehoderColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    textView.font=[UIFont systemFontOfSize:14];
    textView.delegate = self;
    textView.returnKeyType = UIReturnKeyDone;
    textView.layer.borderWidth=0.5;
    textView.layer.borderColor= [UIColor colorWithRed:0/255.0 green:129/255.0 blue:204/255.0 alpha:1].CGColor;
     textView.layer.borderColor= [UIColor lightGrayColor].CGColor;
    textView.layer.cornerRadius =0;
    textView.layer.masksToBounds=YES;
    [self addSubview:textView];
    self.textView = textView;
    
}

- (void)textChangeSugessoin:(NSNotification *)notic
{
    if (_delegate &&[_delegate respondsToSelector:@selector(setFormMessage:)]) {
        
        [_delegate setFormMessage:self.textView.text];
    }
   
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification  object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChangeSugessoin:) name:UITextViewTextDidChangeNotification object:nil];

    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        if ([self.delegate respondsToSelector:@selector(keyboardHeight:)]) {
            [self.delegate keyboardHeight:0 ];
        }
        
        return NO;
    }
    return YES;
}

- (void)keyboardWillChange:(NSNotification *)noti
{
    NSDictionary *dict  = noti.userInfo;
    CGRect keyboardFrame = [dict[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if (keyboardFrame.size.height > 0) {
        self.keyboardHeight = keyboardFrame.size.height;
        
        if ([self.delegate respondsToSelector:@selector(keyboardHeight:)]) {
            [self.delegate keyboardHeight:keyboardFrame.size.height ];
        }
    }
}

- (void)setTitleStr:(NSString *)titleStr
{
    _textStr=titleStr;
    self.titleLabel.text =titleStr;
}

- (void)setTextStr:(NSString *)textStr
{
    _textStr=textStr;
    self.textView.placehoder=textStr;

}
@end
