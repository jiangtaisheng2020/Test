//
//  TSPhoneView.m
//  PrivateShare
//
//  Created by apple2015 on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "TSPhoneView.h"
@interface TSPhoneView ()<UITextFieldDelegate>
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UITextField * textFiled;
@property (nonatomic, assign) CGFloat keyboardHeight;

@end
@implementation TSPhoneView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
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
    titleLabel.textColor= [UIColor blackColor];
    self.titleLabel=titleLabel;
    [topView  addSubview:titleLabel];
    
    UITextField * textFiled =[[UITextField alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame), kScreenWidth, 44)];
    textFiled.delegate=self;
    textFiled.returnKeyType=UIReturnKeyDone;
    textFiled.layer.borderWidth=0.5;
    textFiled.layer.borderColor= [UIColor colorWithRed:0/255.0 green:129/255.0 blue:204/255.0 alpha:1].CGColor;
    textFiled.layer.borderColor= [UIColor lightGrayColor].CGColor;
    self.textFiled=textFiled;
    [self addSubview:textFiled];

}


- (void)textChangephone:(NSNotification *)notic
{
    if (_delegate &&[_delegate respondsToSelector:@selector(setFormPhone:)]) {
        
        [_delegate setFormPhone:self.textFiled.text];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
- (void)setTitleStr:(NSString *)titleStr
{
    _textStr=titleStr;
    self.titleLabel.text =titleStr;
}

- (void)setTextStr:(NSString *)textStr
{
    _textStr=textStr;
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc]initWithString:textStr];
    [placeholder addAttribute:NSForegroundColorAttributeName
                       value:[UIColor lightGrayColor]
                       range:NSMakeRange(0, textStr.length)];
    [placeholder addAttribute:NSFontAttributeName
                       value:[UIFont systemFontOfSize:14]
                       range:NSMakeRange(0, textStr.length)];
    self.textFiled.attributedPlaceholder = placeholder;
    
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

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification  object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChangephone:) name:UITextFieldTextDidChangeNotification object:nil];

    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]) {
        
        [textField resignFirstResponder];
        
        if ([self.delegate respondsToSelector:@selector(keyboardHeight:)]) {
            [self.delegate keyboardHeight:0 ];
        }
        
        return NO;
    }
 
    return YES;
}

@end
