//
//  SYFindCodeViewController.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYFindCodeViewController.h"
#import "SYFindCodeView.h"
#import "SYTimeLose.h"
#import "isPhoneNumber.h"
#import "SYUserDefaultMyInfo.h"
#import "AppDelegate+SYLogin.h"

@interface SYFindCodeViewController ()<SYFindCodeDelegate>
{
    NSMutableArray * contentArray;
    NSString * phoneNum;
    NSString * testCode;
    NSString * newCode;
    
    NSString * netTestCode;
}

@end

@implementation SYFindCodeViewController



#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //测试用
    self.titleStr = @"找回密码";
    [self leftImageNormalStr:@"go_back_on" withAction:@selector(back)];
    
    
    contentArray = [NSMutableArray array];
    
    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 10)];
    topView.backgroundColor = kLineColor;
    [self.view addSubview:topView];
    
    
    SYFindCodeView * findCodeV = [[SYFindCodeView alloc]initWithFrame:CGRectMake(0, 64+10, kScreenWidth, 44*3)];
    findCodeV.findCodeDel = self;
    [self.view addSubview:findCodeV];
    
    
    
    UIButton * codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString * codeStr = @"获取验证码";
    codeBtn.frame = CGRectMake(kScreenWidth-12-90, 64+10+44+11, 90, 22);
    codeBtn.backgroundColor = Color(166, 208, 76);
    [codeBtn setTitle:codeStr forState:UIControlStateNormal];
    codeBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [codeBtn addTarget:self action:@selector(getCode:) forControlEvents:UIControlEventTouchUpInside];
    codeBtn.layer.cornerRadius = 3;
    [self.view addSubview:codeBtn];
    
    
    
    UIButton * loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString * loginStr = @"登录";
    loginBtn.frame = CGRectMake(12, CGRectGetMaxY(findCodeV.frame)+16, kScreenWidth-24, 44);
    loginBtn.backgroundColor = kBlueFontColor;
    [loginBtn setTitle:loginStr forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.layer.cornerRadius = 3;
    [self.view addSubview:loginBtn];
    
    self.HUD.label.text = @"登录中";
    [findCodeV addSubview:self.HUD];


}
//测试用
#pragma mark - CustomDelegate
-(void)didReturnTexttextArray:(NSMutableArray *)textArray
{
    [contentArray setArray:textArray];
}


#pragma mark - Private methods

-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)getCode:(UIButton*)btn
{
    [self resignFirstResponder];
    
    if (contentArray.count < 1||[contentArray[0] isEqualToString:@""]||contentArray[0]==nil)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"手机号不能为空" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        return;
    }
    else
    {
        phoneNum = contentArray[0];
    }
    
    
    if ([isPhoneNumber isPobileNumEmpty:phoneNum]||![isPhoneNumber isPhoneNumAvailability:phoneNum])
    {
        
    }
    else
    {
        [SYTimeLose testCodeTimeChange:btn];
        
        [self getTestCode];
    }
    
    
}


-(void)getTestCode
{
    
#warning 需要修改请求
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString * allpath = [NSString stringWithFormat:@"%@%@",kSXHHttpPath,kSXHFindCodeGetCodePath];
    NSString * final = [NSString stringWithFormat:allpath,phoneNum];
    [manager GET:final parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
    {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         NSString * string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
         NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
#pragma mark 返回的是刘峰。。。。。
         if ([string intValue]==-18201||[string intValue]==-18102)
         {
             UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"用户不存在" message:@""delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
             [alert show];
         }
         else if ([string intValue]==-18203)
         {
             UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@""delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
             [alert show];
             
         }
         else if (dic!=nil||dic.count!=0)
         {
             
             if ([dic[@"succ"]intValue]==0)
             {
                 netTestCode = dic[@"code"];
                 DeLog(@"找回密码的验证码！！！%@",netTestCode);
             }
             else if ([dic[@"succ"]intValue]==1007)
             {
                 UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"验证码发送次数达到每日上限,请24小时后再试。" message:@""delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                 [alert show];
             }
             else
             {
                 UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@""delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                 [alert show];
             }
             
         }
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"获取失败，请检查网络" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
         [alert show];
     }];
    
    
}


-(void)login
{
    [self resignFirstResponder];
    if (contentArray.count!=3)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"输入框不能为空" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
    else
    {
        phoneNum = contentArray[0];
        testCode = contentArray[1];
        newCode = contentArray[2];
        
        
#warning 需要修改请求
        NSString * allpath = [NSString stringWithFormat:@"%@%@%@",kSXHHttpPath,kSXHLoginServelet,kSXHForgetCodeLoginPath];
        
        NSString * url = [NSString stringWithFormat:allpath,phoneNum,testCode,kSXHWebSite];
        
        [self.HUD showAnimated:YES];
        //
//        NSString * passwordStr = dic[@"password"];
//        NSString * phoneStr = dic[@"phone"];
//        NSString * enPassword = [RSA encryptString:passwordStr publicKey:kSibenPublicKey];
        AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
         {
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             
             int loginCode = [responseObject[@"Code"] intValue];
             if (2020 == loginCode)
             {
                 [self hudHideTextStr:@"登录成功" delayTime:2.0];
                 NSDictionary * loginDic = responseObject[@"msg"];
                 [self resignFirstResponder];
                 [self checkVersion];//检测版本
                 [SYUserDefaultMyInfo userdefaultSaveInfo:loginDic];
                 [[LXHelpClass appDelegate] setRootwithTabBar];
             }
             else
             {
                 [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:kUDLoginSuccess];
                 [self hudHideTextStr:@"登录失败" delayTime:3.0];
             }
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
             [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:kUDLoginSuccess];
             [self hudHideTextStr:@"登录失败,请检查网络" delayTime:3.0];
             
         }];
        
        
        
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
