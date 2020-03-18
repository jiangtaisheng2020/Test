//
//  LoginView.m
//  PrivateShare
//
//  Created by apple2015 on 16/9/21.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LoginView.h"
@interface LoginView ()<UITextFieldDelegate>
@property(nonatomic,strong)NSMutableArray * textFiledArr;
@property (nonatomic, assign) CGFloat keyboardHeight;

@end
@implementation LoginView


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
    
    NSArray * iconArr =@[@"user",@"password"];
    NSArray * titleArr =@[@"输入注册的手机号",@"输入密码"];
    
    UILabel *titleLabel =[[UILabel alloc]init];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=[UIFont systemFontOfSize:17];
    titleLabel.backgroundColor=kBackGroundColor;
    titleLabel.text=@"登录";
    [self addSubview:titleLabel];
    
    
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.height.equalTo(@(50));
        
    }];
    
    for (int i=0; i<2; i++) {
        
        UIImageView * imageV=[[UIImageView alloc]init];
        [imageV setImage:[UIImage imageNamed:iconArr[i]]];
        [self addSubview:imageV];
        
        UITextField * textFiled=[[UITextField alloc]init];
        textFiled.placeholder=titleArr[i];
        textFiled.delegate=self;
        textFiled.returnKeyType =UIReturnKeyDone;
        textFiled.clearButtonMode = UITextFieldViewModeAlways;
        [self addSubview:textFiled];
        
        if (i==1) {
            textFiled.secureTextEntry = YES;
        }
        
        UIView * lineV =[[UIView alloc]init];
        lineV.backgroundColor=[UIColor lightGrayColor];
        [self addSubview:lineV];
        
        
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLabel.mas_bottom).offset(20 + i*62);
            make.left.equalTo(self).offset(25);
            make.width.and.height.equalTo(@(30));
        }];

        [textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLabel.mas_bottom).offset(20 + i*62);
            make.left.equalTo(imageV.mas_right).offset(12);
            make.right.equalTo(self).offset(0);
            make.height.equalTo(@(30));
        }];
        
        [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(imageV.mas_bottom).offset(12);
            make.left.equalTo(self).offset(12);
            make.right.equalTo(self).offset(0);
            make.height.equalTo(@(1));
        }];
        
        [_textFiledArr addObject:textFiled];
    }
    
    UIButton * loginBtn=[[UIButton alloc]init];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginAccount:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setBackgroundColor:[UIColor colorWithRed:27/255.0 green:178/255.0 blue:233/255.0 alpha:1]];
    [loginBtn setTitleColor:kCellBackGroundColor forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius=5.0;
    loginBtn.layer.masksToBounds=YES;
    loginBtn.titleLabel.font =[UIFont systemFontOfSize:18];
    loginBtn.tag=2;
    [self addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-60);
        make.left.equalTo(self).offset(12);
        make.right.equalTo(self).offset(-12);
        make.height.equalTo(@(44));
    }];
    
    
    CustomBtn * forgetBtn =[[CustomBtn alloc]init];
    [forgetBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(forget:) forControlEvents:UIControlEventTouchUpInside];
    forgetBtn.tag=3;
    [forgetBtn setBackgroundColor:[UIColor clearColor]];
    [forgetBtn setTitleColor:[UIColor colorWithRed:139/255.0 green:139/255.0 blue:139/255.0 alpha:1] forState:UIControlStateNormal];
    forgetBtn.titleLabel.font=[UIFont boldSystemFontOfSize:15];
    forgetBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
    [self addSubview:forgetBtn];
    
    UIView * lineV =[[UIView alloc]init];
    lineV.backgroundColor=[UIColor colorWithRed:139/255.0 green:139/255.0 blue:139/255.0 alpha:1];
    [self addSubview:lineV];
    
    [forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom).offset(-35);
        make.width.equalTo(@(80));
        make.height.equalTo(@(18));
        make.left.equalTo(self).offset(104);
    }];
    
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(forgetBtn.mas_bottom).offset(2);
        make.width.equalTo(@(80));
        make.height.equalTo(@(1));
        make.left.equalTo(self).offset(104);
    }];

    
}



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if ([self.delegate respondsToSelector:@selector(loginViewKeyboardHeight:)]) {
        [self.delegate loginViewKeyboardHeight:200 ];
    }
    
    return YES;
    
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        if ([self.delegate respondsToSelector:@selector(loginViewKeyboardHeight:)]) {
            [self.delegate loginViewKeyboardHeight:0 ];
        }
        
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        return NO;
    }
    
    
    return YES;
    
    
    
}


- (void)loginAccount:(UIButton *)btn
{
    if (((UITextField*)(_textFiledArr[0])).text.length>0 &&((UITextField*)(_textFiledArr[1])).text.length>0 ) {
        
        if(_delegate &&[_delegate respondsToSelector:@selector(setFormRegisterOrLoginMessage:)])
        {
            NSDictionary * dic =@{@"phone":((UITextField*)(_textFiledArr[0])).text,@"password":((UITextField*)(_textFiledArr[1])).text};
            [_delegate setFormRegisterOrLoginMessage:dic];
            
        }
        
    }else{
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"请输入账号/密码" message:@""delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
}

- (void)forget:(UIButton *)btn
{

    if ([self.delegate respondsToSelector:@selector(forgetPassword)]) {
        [self.delegate forgetPassword ];
    }

}
@end
