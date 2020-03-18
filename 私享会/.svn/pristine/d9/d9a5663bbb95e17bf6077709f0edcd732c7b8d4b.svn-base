//
//  RegisterViewController.m
//  PrivateShare
//
//  Created by apple2015 on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "SYUserDefaultMyInfo.h"
#import "AppDelegate+SYLogin.h"

#define TOPH    (kScreenHeight-424)*(4/7.0)

@interface RegisterViewController ()<RegisterViewDelegate>
{
    NSString * phoneNumber;
    NSString * testCodeNum;
    NSString * passwordNum;
    
    NSString * netTestCode;
}
@property(nonatomic,strong)RegisterView  * registerView;
@property(nonatomic,strong)MASConstraint *  constraint;
@end
@implementation RegisterViewController

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createUI];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [self updateConstraints:0];

    [super viewWillDisappear:animated];
}


- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    
    [super viewDidDisappear:animated];
}


#pragma mark - Interface

#pragma mark - Loading data

#pragma mark - Create view



- (void)createUI{
    
    NSString *  virsion ;
    if (kScreenWidth==320) {
        virsion=@"ipone5";
    }else if (kScreenWidth==375){
        virsion=@"ipone6";
    }else if (kScreenWidth==414){
        virsion=@"iponeplus";
    }

    [self.view  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:virsion]]];
//    RegisterView * registerView =[[RegisterView alloc]initWithFrame:CGRectMake((kScreenWidth-280)/2, (kScreenHeight-320)/2, 280, 310)];
//        [self.view addSubview:registerView];

    RegisterView * registerView =[[RegisterView alloc]init];
    registerView.delegate =self;
    self.registerView=registerView;
    [self.view addSubview:registerView];
    
    [registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(TOPH);
        make.width.equalTo(@(280));
        make.height.equalTo(@(310));
        make.left.equalTo(self.view.mas_left).offset(((kScreenWidth-280)/2));
//        make.left.equalTo(self.view.mas_left).offset(42);
//         make.right.equalTo(self.view.mas_right).offset(-42);

    }];
    

    CustomBtn * loginBtn =[[CustomBtn alloc]init];
    [loginBtn setTitle:@"已有账号,点击登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.tag=2;
    [loginBtn setBackgroundColor:[UIColor clearColor]];
    loginBtn.titleLabel.font=[UIFont boldSystemFontOfSize:16];
    loginBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:loginBtn];
    
    UIView * lineV =[[UIView alloc]init];
    lineV.backgroundColor=kCellBackGroundColor;
    [self.view addSubview:lineV];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(registerView.mas_bottom).offset(27);
        make.width.equalTo(@(140));
        make.height.equalTo(@(18));
        make.left.equalTo(self.view.mas_left).offset(((kScreenWidth-140)/2));
    }];
    
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBtn.mas_bottom).offset(2);
        make.width.equalTo(@(150));
        make.height.equalTo(@(1));
        make.left.equalTo(self.view.mas_left).offset(((kScreenWidth-150)/2));
    }];
    
    [self.view addSubview:self.HUD];

}
#pragma mark - UITableViewDelegate

#pragma mark - SystemDelegate

#pragma mark - CustomDelegate
- (void)setFormRegisterOrLoginMessage:(NSDictionary *)dic
{
    
    testCodeNum = dic[@"code"];
    passwordNum = dic[@"password"];
    phoneNumber = dic[@"phone"];
    
    if ([netTestCode isEqualToString:testCodeNum])
    {
        [self registerZhName];
    }
    else
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"验证码不正确" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
}

- (void)registerViewKeyboardHeight:(CGFloat)height
{
    [self updateConstraints:height];
}

- (void)getVerificationCode:(NSString*)phoneNum
{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    NSString * allpath = [NSString stringWithFormat:@"%@%@%@",kSXHHttpPath,kSXHRegisetServerlet,kSXHRegisterGetCodePath];
    phoneNumber = phoneNum;
    [manager GET:[NSString stringWithFormat:allpath,phoneNum] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
    {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         int registerCode = [responseObject[@"Code"] intValue];
         if (1002 == registerCode)
         {
             NSDictionary * regDic = responseObject[@"msg"];
             netTestCode = regDic[@"getcode"];
             DeLog(@"验证码：%@",netTestCode);
         }
         else if (1007 == registerCode)
         {
             UIAlertView * alert = [[UIAlertView alloc]initWithTitle:responseObject[@"msg"] message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
             [alert show];
         }
         else
         {
             UIAlertView * alert = [[UIAlertView alloc]initWithTitle:responseObject[@"msg"] message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
             [alert show];
         }
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"失败，请检查网络" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
         [alert show];
     }];

}

- (void)updateConstraints:(CGFloat)height{


    if (height>0) {
        [self.registerView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.view.mas_top).offset(40);
            
        }];
    }else{
        [self.registerView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.view.mas_top).offset(TOPH);
            
        }];
        
       
    }
}


-(void)registerZhName
{
    self.HUD.label.text = @"注册中";
    [self.HUD showAnimated:YES];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSString * allpath = [NSString stringWithFormat:@"%@%@%@%@",kSXHHttpPath,kSXHRegisetServerlet,kSXHRegistPath,@"&encodePass=true"];
    NSString * enPassword = [RSA encryptString:passwordNum publicKey:kSibenPublicKey];
    NSString * url = [NSString stringWithFormat:allpath,phoneNumber,testCodeNum,enPassword,phoneNumber];
    NSString * final =  [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<>+"].invertedSet];
    [manager GET:final parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         int condition = [responseObject[@"Code"]intValue];
         if (condition == 1004)
         {
             [self hudHideTextStr:@"注册成功" delayTime:0.0];
             [self loginServer];
         }
         else
         {
             NSString * msg = responseObject[@"msg"];
             DeLog(@"code:%d  msg:%@",condition,msg);
             [self hudHideTextStr:responseObject[@"msg"] delayTime:3.0];
         }
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         [self hudHideTextStr:@"失败，请检查网络" delayTime:3.0];
     }];
}


-(void)loginServer
{
    self.HUD.label.text = @"登录中";
    [self.HUD showAnimated:YES];
    NSString * enPassword = [RSA encryptString:passwordNum publicKey:kSibenPublicKey];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSString * allpath = [NSString stringWithFormat:@"%@%@%@",kSXHHttpPath,kSXHLoginServelet,kSXHHandLoginPath];
    DeLog(@"%@",[NSString stringWithFormat:allpath,phoneNumber,enPassword,kSXHWebSite]);
    NSString * url = [NSString stringWithFormat:allpath,phoneNumber,enPassword,kSXHWebSite];
    NSString * final =  [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<>+"].invertedSet];
    [manager GET:final parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
         
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         
         int loginCode = [responseObject[@"Code"] intValue];
         if (2004 == loginCode)
         {
             [self hudHideTextStr:@"登录成功" delayTime:2.0];
             NSDictionary * loginDic = responseObject[@"msg"];
             [self checkVersion];//检测版本
             [SYUserDefaultMyInfo userdefaultSaveInfo:loginDic];
             [[LXHelpClass appDelegate] setRootwithTabBar];
         }
         else
         {
             [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:kUDLoginSuccess];
             [self hudHideTextStr:responseObject[@"msg"] delayTime:3.0];
         }
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:kUDLoginSuccess];
         [self hudHideTextStr:@"登录失败,请检查网络" delayTime:3.0];
         
     }];
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self resignFirstResponder];
}

#pragma mark - Observer

#pragma mark - Enent response
- (void)login:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - Private methods

#pragma mark - Setter and getter

@end
