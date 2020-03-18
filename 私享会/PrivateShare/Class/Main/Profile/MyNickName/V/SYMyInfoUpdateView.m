//
//  SYMyInfoUpdateView.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYMyInfoUpdateView.h"

#import "UIView+B_Animation.h"
#import "NSString+B_ForbiddenStr.h"
@interface SYMyInfoUpdateView()
{
    NSString * numberStr;
    NSString * titleNameStr;
}
@property (nonatomic,weak) UILabel * noticeLable;
@end


@implementation SYMyInfoUpdateView

-(instancetype)initWithFrame:(CGRect)frame titleName:(NSString*)titleName number:(NSString*)number
{
    if (self = [super initWithFrame:frame])
    {
        numberStr = number;
        titleNameStr = titleName;
        [self creatUI];
    }
    
    return self;
}

-(void)creatUI
{
    
    UITextField * emailField = [[UITextField alloc]initWithFrame:CGRectMake(15, 15, kScreenWidth-30, 44)];
    //    DLog(@"%@",self.titleName);
    //    if (![self.titleName isEqualToString:@"QQ号"]) {
    //    }
    if (!(numberStr == nil && [numberStr isEqualToString:@""])) {
        emailField.text = numberStr;
    }
    emailField.placeholder = [NSString stringWithFormat:@"请输入绑定的%@",titleNameStr];
    emailField.font = [UIFont systemFontOfSize:16];
    emailField.clearButtonMode = UITextFieldViewModeAlways;
    [emailField becomeFirstResponder];
    self.emailTextField = emailField;
    [self addSubview:self.emailTextField];
    
    
    UIView * lineview = [[UIView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(self.emailTextField.frame), kScreenWidth-30, 0.5)];
    lineview.backgroundColor = kLineColor;
    [self addSubview:lineview];
    
    
    UILabel * noticLB = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(lineview.frame)+15, kScreenWidth-30, 40)];
    noticLB.textColor = Color(53, 53, 53);
    noticLB.font = [UIFont systemFontOfSize:16];
    noticLB.textAlignment = 1;
    noticLB.numberOfLines = 0;
    noticLB.alpha = 0;
    self.noticeLable = noticLB;
    [self addSubview:self.noticeLable];
    
}



-(void)update
{
    
    [self.emailTextField resignFirstResponder];
    //    if ([self.titleName isEqualToString:@"邮箱地址"])
    //    {
    //
    //        NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    //        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    //
    //        if ([emailTest evaluateWithObject:email.text]) {
    //            //        NSString * detail = [NSString stringWithFormat:DetailPath,BDQQ];
    //    NSString *urlAsString=[NSString stringWithFormat:detail,email.text];
    //    NSString * token = [[NSUserDefaults standardUserDefaults]objectForKey:XLXUserToken];
    //    [ShowActivity showActivityTips:@"正在修改.." superView:self.view];
    //    [PostRequestModel httpMethodStr:@"PUT" UrlStr:urlAsString HttpBodyDic:@{@"":@""} HttpHeaderStr:token notificationName:Notification];
    //
    //
    //        }
    //        else
    //        {
    //            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"输入邮箱不正确,请重新输入。" message:nil delegate:nil cancelButtonTitle:XLXTipNetSure otherButtonTitles:nil];
    //            [alert show];
    //        }
    //    }
    //    else if ([self.titleName isEqualToString:@"QQ号"])
    if ([titleNameStr isEqualToString:@"QQ号"])
    {
        if (self.emailTextField.text.length == 0)
        {
            //            [AlertShowModel alertTitle:XLXTipBDQQFail1 alertCancelStr:XLXTipNetSure otherStr:nil];
            [self showNotice:@"请输入QQ号"];
        }
        else
        {
            [_updateDelegate bdQQ:self.emailTextField.text];
        }
        
    }
    //#warning 上传微信号
    //#pragma mark 绑定微信号
    //    else if ([self.titleName isEqualToString:@"微信号"])
    //    {
    //        NSString * detail = [NSString stringWithFormat:DetailPath,BDQQ];
    //    NSString *urlAsString=[NSString stringWithFormat:detail,email.text];
    //    NSString * token = [[NSUserDefaults standardUserDefaults]objectForKey:XLXUserToken];
    //    [ShowActivity showActivityTips:@"正在修改.." superView:self.view];
    //    [PostRequestModel httpMethodStr:@"PUT" UrlStr:urlAsString HttpBodyDic:@{@"":@""} HttpHeaderStr:token notificationName:Notification];
    //    }
    //#pragma mark 绑定手机号
    //#warning 上传手机号
    //    else if ([self.titleName isEqualToString:@"手机号"])
    //    {
    //        //        NSString * detail = [NSString stringWithFormat:DetailPath,BDQQ];
    //    NSString *urlAsString=[NSString stringWithFormat:detail,email.text];
    //    NSString * token = [[NSUserDefaults standardUserDefaults]objectForKey:XLXUserToken];
    //    [ShowActivity showActivityTips:@"正在修改.." superView:self.view];
    //    [PostRequestModel httpMethodStr:@"PUT" UrlStr:urlAsString HttpBodyDic:@{@"":@""} HttpHeaderStr:token notificationName:Notification];
    //    }
    
    else//上传昵称
    {
        [self isUpdateNickName];
    }
}

//判断是否需要上传昵称
-(void)isUpdateNickName
{
    //如果长度为0
    if ([self.emailTextField.text length] == 0)
    {
        //        [AlertShowModel alertTitle:XLXTipUpdateMyNameFail3 alertCancelStr:XLXTipNetSure otherStr:nil];
        
        [self showNotice:@"昵称不能为空"];
    }
    //判断是否超出长度
    else if (self.emailTextField.text.length >16)
    {
        
        //        [AlertShowModel alertTitle:XLXTipUpdateMyNameFail2 alertCancelStr:XLXTipNetSure otherStr:nil];
        
        [self showNotice:@"昵称超过长度,请重新设置。"];
    }
    //判断是否有非法字符,判断是否有emoj表情
    else if([self.emailTextField.text isForbidenString]==NO)
    {
        [self showNotice:@"昵称中有非法字符,请修改。"];
        //        [AlertShowModel alertTitle:XLXTipUpdateMyNameFail1 alertCancelStr:XLXTipNetSure otherStr:nil];
        
    }
    else
    {
        //上传昵称
        [_updateDelegate bdNickName:self.emailTextField.text];
    }
    
    [self.emailTextField resignFirstResponder];
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.emailTextField resignFirstResponder];
}

//点击返回上一个界面
-(void)backLast
{
    [self.emailTextField resignFirstResponder];
    [_updateDelegate bdBackLast:self.emailTextField.text];
}

//提醒文字
-(void)showNotice:(NSString*)notice
{
    [self.emailTextField b_Viewshark];
    
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
