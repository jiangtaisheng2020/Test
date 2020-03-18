//
//  SYMySignView.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYMySignView.h"

#import "UIView+B_Animation.h"

@interface SYMySignView()<UITextViewDelegate>

@property (nonatomic,weak) UILabel * noticeLable;
@property (nonatomic,weak) UILabel * countLable;
@end

@implementation SYMySignView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self creatUI];
    }
    
    return self;
}


-(void)creatUI
{
    UITextView * signTextView = [[UITextView alloc]initWithFrame:CGRectMake(15, 15, kScreenWidth-30, 100)];
    signTextView.font = [UIFont systemFontOfSize:15];
    //设置textView 是否自动滚动 默认为YES
    //    textView2.scrollEnabled = NO;
    //设置字体颜色
    signTextView.textColor = [UIColor blackColor];
    //设置一个文本
    signTextView.delegate = self;
    signTextView.layer.borderColor = [[UIColor grayColor]CGColor];
    signTextView.layer.borderWidth = 0.1;
    signTextView.layer.cornerRadius = 3;
    [signTextView.layer setMasksToBounds:YES];
    self.mySignTextView = signTextView;
    [self.mySignTextView becomeFirstResponder];
    [self addSubview:self.mySignTextView];
    
    
    UILabel * countLB = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-100, CGRectGetMaxY(signTextView.frame)+5, 80, 20)];
    countLB.textColor = Color(53, 53, 53);
    countLB.font = [UIFont systemFontOfSize:16];
    countLB.textAlignment = 2;
    countLB.numberOfLines = 0;
    countLB.text = @"140字以内";
    self.countLable = countLB;
    [self addSubview:self.countLable];
    
    
    UILabel * noticLB = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(countLB.frame)+15, kScreenWidth-30, 40)];
    noticLB.textColor = Color(53, 53, 53);
    noticLB.font = [UIFont systemFontOfSize:16];
    noticLB.textAlignment = 1;
    noticLB.numberOfLines = 0;
    noticLB.alpha = 0;
    self.noticeLable = noticLB;
    [self addSubview:self.noticeLable];
    
    
    
}



-(void)textViewDidBeginEditing:(UITextView *)textView
{
    //在将要开始编辑的时候清空！！！
    if ([self.mySignTextView.text isEqualToString:@""])
    {
        self.mySignTextView.text = @"140字以内";
    }
    else if ([self.mySignTextView.text isEqualToString:@"140字以内"])
    {
        self.mySignTextView.text = @"";
    }
    
    
}

-(void)textViewDidChange:(UITextView *)textView
{
    NSInteger len = 140-[textView.text length];
    if (len<0)
    {
        self.countLable.textColor = Color(239, 68, 84);
        self.countLable.text = [NSString stringWithFormat:@"%li字",(long)len];
    }
    else
    {
        self.countLable.textColor = Color(53, 53, 53);
        self.countLable.text = [NSString stringWithFormat:@"%li字",(long)len];
    }
    
}

//上传
-(void)updata
{
    [self.mySignTextView resignFirstResponder];
    if ([self canUpdate])
    {
        [_mySignDel mySignUpdata:self.mySignTextView.text];
    }
}

//返回上一届面
-(void)backLast
{
    [self.mySignTextView resignFirstResponder];
    [_mySignDel mySignBackLast:self.mySignTextView.text];
}


-(BOOL)canUpdate
{
    //需要保存
    if (self.mySignTextView.text.length>140)
    {
        //        [AlertShowModel alertTitle:XLXTipSaveMySignFail1 alertCancelStr:XLXTipNetSure otherStr:XLXTipCancel];
        
        [self showNotice:@"您输入的字数超过140字无法保存,请重新编辑"];
        
        return NO;
    }
    else if(self.mySignTextView.text.length==0)
    {
        //        [AlertShowModel alertTitle:XLXTipSaveMySignFail2 alertCancelStr:XLXTipNetSure otherStr:XLXTipCancel];
        
        [self showNotice:@"输入的字数不能少于1个哦。"];
        return NO;
        
    }
    else
    {
        return YES;
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.mySignTextView resignFirstResponder];
}

//提醒文字
-(void)showNotice:(NSString*)notice
{
    [self.mySignTextView b_Viewshark];
    
    self.noticeLable.text = notice;
    
    [UIView animateWithDuration:2.0 animations:^{
        
        self.noticeLable.alpha = 1.0;
        
    } completion:^(BOOL finished)
     {
         [UIView animateWithDuration:1.0 animations:^{
             self.noticeLable.alpha = 0.0;
         }];
     }];
}



@end
