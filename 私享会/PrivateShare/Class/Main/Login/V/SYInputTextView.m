//
//  SYInputTextView.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYInputTextView.h"

@interface SYInputTextView()<UITextFieldDelegate>


@property(nonatomic,weak)UITextField * textField;

@property(nonatomic,weak)UIImageView * leftImgView;


@end


@implementation SYInputTextView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self creatUI];
    }
    
    return self;
}

-(void)creatUI
{
    
    UIImageView * leftImgV = [[UIImageView alloc]initWithFrame:CGRectMake(12, 11, 22, 22)];
    self.leftImgView = leftImgV;
    [self addSubview:self.leftImgView];
    
    UITextField * textF = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.leftImgView.frame)+14, 11, kScreenWidth-CGRectGetMaxX(self.leftImgView.frame)-14, 22)];
    [textF addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventAllEditingEvents];
    self.textField = textF;
    textF.delegate = self;
    [self addSubview:self.textField];
    
    UIView * lineV = [[UIView alloc]initWithFrame:CGRectMake(0, 44-0.5, kScreenWidth, 0.5)];
    lineV.backgroundColor = kLineColor;
    [self addSubview:lineV];
    
}

-(void)inputViewPlaceHolder:(NSString*)placeHolder img:(UIImage*)img
{
    if (self.tag == 12) {
        self.textField.secureTextEntry = YES;
    }
    self.textField.placeholder = placeHolder;
    
    self.leftImgView.image = img;
}



#pragma mark - SystemDelegate
-(void)textFieldChange:(UITextField *)textField
{
    if (self.tag != 11)
    {
        self.textField.clearButtonMode = UITextFieldViewModeAlways;
    }
    
    [_inputDel didReturnText:textField.text textTag:self.tag];
}




@end
