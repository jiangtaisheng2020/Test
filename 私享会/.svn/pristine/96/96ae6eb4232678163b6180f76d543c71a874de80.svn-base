//
//  RegisterView.m
//  PrivateShare
//
//  Created by apple2015 on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "RegisterView.h"
#import "isPhoneNumber.h"
#import "SYTimeLose.h"
@interface RegisterView ()<UITextFieldDelegate>
@property(nonatomic,strong)NSMutableArray * textFiledArr;
@property (nonatomic, assign) CGFloat keyboardHeight;

@end

@implementation RegisterView

- (instancetype)init
{
    if (self=[super init]) {
        self.backgroundColor=[UIColor whiteColor];
        self.alpha = 0.9;
        self.layer.cornerRadius=10.0;
        self.layer.masksToBounds=YES;
        _textFiledArr=[NSMutableArray arrayWithCapacity:0];
        [self  creatUI];
    }
    return self;

}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if (self=[super initWithFrame:frame]) {
//        self.backgroundColor=[UIColor whiteColor];
//        self.alpha = 0.9;
//        self.layer.cornerRadius=10.0;
//        self.layer.masksToBounds=YES;
//        _textFiledArr=[NSMutableArray arrayWithCapacity:0];
//
//        [self  creatUI];
//    }
//    return self;
//}

- (void)creatUI
{

    NSArray * iconArr =@[@"user",@"auth code",@"password"];
    NSArray * titleArr =@[@"输入注册的手机号",@"输入验证码",@"输入密码"];

    UILabel *titleLabel =[[UILabel alloc]init];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=[UIFont systemFontOfSize:17];
    titleLabel.backgroundColor=kBackGroundColor;
    titleLabel.text=@"注册";
    [self addSubview:titleLabel];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.height.equalTo(@(50));
        
    }];
    UIButton * button;
    
    for (int i=0; i<3; i++) {
        
        UIImageView * imageV=[[UIImageView alloc]init];
        [imageV setImage:[UIImage imageNamed:iconArr[i]]];
        [self addSubview:imageV];
        
        UITextField * textFiled=[[UITextField alloc]init];
        textFiled.placeholder=titleArr[i];
        textFiled.delegate=self;
        textFiled.tag = 10+i;
        textFiled.returnKeyType =UIReturnKeyDone;
        textFiled.clearButtonMode = UITextFieldViewModeAlways;
        [self addSubview:textFiled];
        
        UIView * lineV =[[UIView alloc]init];
        lineV.backgroundColor=[UIColor lightGrayColor];
        [self addSubview:lineV];
        
        if (i==1) {
            button=[[UIButton alloc]init];
            [button setTitle:@"获取验证码" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(getcode:) forControlEvents:UIControlEventTouchUpInside];
            [button setBackgroundColor:[UIColor colorWithRed:156/255.0 green:203/255.0 blue:56/255.0 alpha:1]];
            [button setTitleColor:kCellBackGroundColor forState:UIControlStateNormal];
            button.layer.cornerRadius=2.0;
            button.layer.masksToBounds=YES;
            button.titleLabel.font =[UIFont systemFontOfSize:12.5];
            button.tag=1;
            [self addSubview:button];
        }
        else if (i==2)
        {
            textFiled.secureTextEntry = YES;
        }
        
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLabel.mas_bottom).offset(20 + i*62);
            make.left.equalTo(self.mas_left).offset(25);
            make.width.equalTo(@(30));
            make.height.equalTo(@(30));
        }];
        
        if (i==1) {
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(titleLabel.mas_bottom).offset(20 + i*62);
                make.right.equalTo(self.mas_right).offset(-12);
                make.height.equalTo(@(30));
                make.width.equalTo(@(80));
            }];
            
            [textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(imageV.mas_top);
                make.left.equalTo(imageV.mas_right).offset(12);
                make.right.equalTo(button.mas_left).offset(-10);
                make.height.equalTo(@(30));

            }];
            
        }else{
        
            [textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(titleLabel.mas_bottom).offset(20 + i*62);
                make.left.equalTo(imageV.mas_right).offset(12);
                make.right.equalTo(self.mas_right).offset(0);
                make.height.equalTo(@(30));
            }];
        
        }
        
        [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(imageV.mas_bottom).offset(12);
            make.left.equalTo(self.mas_left).offset(12);
            make.right.equalTo(self.mas_right).offset(0);
            make.height.equalTo(@(1));
        }];
        
        [_textFiledArr addObject:textFiled];
    }
    
   UIButton * registerBtn=[[UIButton alloc]init];
    [registerBtn setTitle:@"注册并登录" forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerAccount:) forControlEvents:UIControlEventTouchUpInside];
    [registerBtn setBackgroundColor:[UIColor colorWithRed:27/255.0 green:178/255.0 blue:233/255.0 alpha:1]];
    [registerBtn setTitleColor:kCellBackGroundColor forState:UIControlStateNormal];
    registerBtn.layer.cornerRadius=5.0;
    registerBtn.layer.masksToBounds=YES;
    registerBtn.titleLabel.font =[UIFont systemFontOfSize:18];
    registerBtn.tag=2;
    [self addSubview:registerBtn];
    
    
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-12);
        make.left.equalTo(self.mas_left).offset(12);
        make.right.equalTo(self.mas_right).offset(-12);
        make.height.equalTo(@(40));
    }];
    

}



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{

//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldkeyboardWillChange:) name:UIKeyboardWillChangeFrameNotification  object:nil];

    if ([self.delegate respondsToSelector:@selector(registerViewKeyboardHeight:)])
    {
        [self.delegate registerViewKeyboardHeight:200 ];
    }
    
    return YES;

}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        if ([self.delegate respondsToSelector:@selector(registerViewKeyboardHeight:)]) {
            [self.delegate registerViewKeyboardHeight:0 ];
        }
        
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        return NO;
    }
    
    
    return YES;



}
- (void)getcode:(UIButton *)btn
{
    NSString * phoneNum;
    UITextField * phoneTextField = [self viewWithTag:10];
    [self resignFirstResponder];
    if ([phoneTextField.text isEqualToString:@""]||phoneTextField.text==nil)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"手机号不能为空" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        return;
    }
    else
    {
        phoneNum = phoneTextField.text;
    }
    
    if ([isPhoneNumber isPobileNumEmpty:phoneNum]||![isPhoneNumber isPhoneNumAvailability:phoneNum])
    {
        
    }
    else
    {
        [SYTimeLose testCodeTimeChange:btn];
        
        if(_delegate &&[_delegate respondsToSelector:@selector(getVerificationCode:)])
        {
            [_delegate getVerificationCode:phoneNum];
            
        }
    }
}

- (void)registerAccount:(UIButton *)btn
{
    if (((UITextField*)(_textFiledArr[0])).text.length>0 &&((UITextField*)(_textFiledArr[1])).text.length>0 && ((UITextField*)(_textFiledArr[2])).text.length>0) {
        
        if(_delegate &&[_delegate respondsToSelector:@selector(setFormRegisterOrLoginMessage:)])
        {
            NSDictionary * dic =@{@"phone":((UITextField*)(_textFiledArr[0])).text,@"code":((UITextField*)(_textFiledArr[1])).text,@"password":((UITextField*)(_textFiledArr[2])).text};
            [_delegate setFormRegisterOrLoginMessage:dic];
            
        }
        
    }
    else
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"请输入账号/验证码/密码" message:@""delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
