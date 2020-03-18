//
//  TSLoginViewController.m
//  PrivateShare
//
//  Created by apple2015 on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "TSLoginViewController.h"
#import "LoginView.h"
#import "CustomView.h"
#import "RegisterViewController.h"
#import "SYFindCodeViewController.h"
#import "AppDelegate+SYLogin.h"
#import "SYUserDefaultMyInfo.h"

#define WXAPPID @"wx7d2fcdeffc747958"
#define Description @"*****"
#define TOPH    (kScreenHeight-424)*(4/7.0)

@interface TSLoginViewController ()<CustomViewDelegate,LoginViewDelegate,WXApiDelegate>

@property(nonatomic,strong)LoginView  * loginView;
@property(nonatomic,strong)MASConstraint *  constraint;
@end
@implementation TSLoginViewController


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
        LoginView * loginView =[[LoginView alloc]init];
        loginView.delegate =self;
        self.loginView=loginView;
        [self.view addSubview:loginView];
    
        [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
            self.constraint = make.top.equalTo(self.view).offset(TOPH);
            make.width.equalTo(@(280));
            make.height.equalTo(@(300));
            make.left.equalTo(self.view).offset(((kScreenWidth-280)/2));
            
        }];
    
    
        CustomBtn * registerBtn =[[CustomBtn alloc]init];
        [registerBtn setTitle:@"还没注册？点击注册" forState:UIControlStateNormal];
        [registerBtn addTarget:self action:@selector(registerActon:) forControlEvents:UIControlEventTouchUpInside];
        registerBtn.tag=2;
        [registerBtn setBackgroundColor:[UIColor clearColor]];
        registerBtn.titleLabel.font=[UIFont boldSystemFontOfSize:16];
        registerBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
        [self.view addSubview:registerBtn];
    
        UIView * lineV =[[UIView alloc]init];
        lineV.backgroundColor=kCellBackGroundColor;
        [self.view addSubview:lineV];
    
        [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(loginView.mas_bottom).offset(26);
            make.width.equalTo(@(150));
            make.height.equalTo(@(18));
            make.left.equalTo(self.view).offset(((kScreenWidth-150)/2));
        }];
    
        [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(registerBtn.mas_bottom).offset(2);
            make.width.equalTo(@(155));
            make.height.equalTo(@(1));
            make.left.equalTo(self.view).offset(((kScreenWidth-155)/2));
        }];
    
    
        //第三方登陆
        UIView * leftLine =[[UIView alloc]init];
        leftLine.backgroundColor =kCellBackGroundColor;
        [self.view addSubview:leftLine ];
        UIView * rightLine =[[UIView alloc]init];
        rightLine.backgroundColor =kCellBackGroundColor;
        [self.view addSubview:rightLine ];
    
        UILabel * loginLabel = [[UILabel alloc]init];
        loginLabel.textAlignment=NSTextAlignmentCenter;
        loginLabel.font=[UIFont systemFontOfSize:15];
        loginLabel.textColor=kCellBackGroundColor;
        loginLabel.text=@"第三方登录";
        [self.view addSubview:loginLabel];
    
        [loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineV.mas_bottom).offset(20);
            make.width.equalTo(@(100));
            make.height.equalTo(@(18));
            make.left.equalTo(self.view.mas_left).offset(((kScreenWidth-100)/2));
        }];
        [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineV.mas_bottom).offset(30);
            make.height.equalTo(@(1));
            make.left.equalTo(self.view.mas_left).offset(40);
            make.right.equalTo(loginLabel.mas_left).offset(-5);
        }];
        [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lineV.mas_bottom).offset(30);
            make.height.equalTo(@(1));
            make.left.equalTo(loginLabel.mas_right).offset(5);
            make.right.equalTo(self.view.mas_right).offset(-40);
        }];
    
        CustomView * WXView=[[CustomView alloc]init];
        WXView.delegate=self;
        WXView.iconStr=@"wechat";
        WXView.titleStr=@"微信登录";
        [self.view  addSubview:WXView];
    
        [WXView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(loginLabel.mas_bottom).offset(20);
            make.height.equalTo(@(60));
            make.width.equalTo(@(80));
            make.left.equalTo(self.view.mas_left).offset((kScreenWidth-70)/2);
        }];
    
    self.HUD.label.text = @"登录中";
    [self.view addSubview:self.HUD];
}
#pragma mark - UITableViewDelegate

#pragma mark - SystemDelegate

#pragma mark - CustomDelegate
- (void)setFormRegisterOrLoginMessage:(NSDictionary *)dic
{
    [self.HUD showAnimated:YES];
    NSString * passwordStr = dic[@"password"];
    NSString * phoneStr = dic[@"phone"];
    NSString * enPassword = [RSA encryptString:passwordStr publicKey:kSibenPublicKey];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSString * company = [NSString stringWithFormat:@"&company=%@",kSXHCompany];
    NSString * allpath = [NSString stringWithFormat:@"%@%@%@%@",kSXHHttpPath,kSXHLoginServelet,kSXHHandLoginPath,company];
    NSString * url = [NSString stringWithFormat:allpath,phoneStr,enPassword,kSXHWebSite];
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
             DeLog(@"登录个人信息+++++++%@",loginDic);
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
//忘记密码
- (void)forgetPassword
{
    SYFindCodeViewController * findCode = [[SYFindCodeViewController alloc]init];
    [self presentViewController:findCode animated:YES completion:nil];
    NSLog(@"---++++++++++");
}
//更新约束
- (void)loginViewKeyboardHeight:(CGFloat)height
{
    [self updateConstraints:height];
}

- (void)updateConstraints:(CGFloat)height{
    
    if (height>0) {
        
        [self.loginView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.view.mas_top).offset(40);
            
        }];
        
    }else{
        
        [self.loginView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.view.mas_top).offset(TOPH);
            
        }];
        
    }
}

#pragma mark - Observer

#pragma mark - Enent response

- (void)registerActon:(UIButton *)btn
{
    
    RegisterViewController * registerVC = [[RegisterViewController alloc]init];
    [self presentViewController:registerVC animated:YES completion:nil];
}
//微信登陆
- (void)customViewHandleTap
{
    [WXApi registerApp:WXAPPID withDescription:Description];
    SendAuthReq * req = [[SendAuthReq alloc]init];
    req.scope = @"snsapi_userinfo";
    req.state = Description;
    [WXApi sendAuthReq:req
        viewController:self
              delegate:self];
}

#pragma mark - Private methods
-(void)getCode:(BaseResp *)resp
{
    if (resp.errCode == 0)
    {
        SendAuthResp * aresp = (SendAuthResp*)resp;
        [self getAccessToken:aresp.code];
    }
    else if (resp.errCode == -4)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"用户拒绝授权" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
    else if (resp.errCode == -2)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"用户取消登录" message:@""delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
}

-(void)getAccessToken:(NSString*)code
{
    [self otherLinkLoginInfo:code];
}

//微信登录
-(void)otherLinkLoginInfo:(id)info
{
    NSString * code = info;
    NSString * allpath = [NSString stringWithFormat:@"%@%@%@",kSXHHttpPath,kSXHLoginServelet,kSXHWXLoginPath];
    NSString * finalLoginPath = [NSString stringWithFormat:allpath,code,kSXHWebSite];
    [self.HUD showAnimated:YES];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:finalLoginPath parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
    {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         DeLog(@"%@",responseObject);
         int wxLoginCode = [responseObject[@"Code"]intValue];
         if (2007 == wxLoginCode||2010 == wxLoginCode)//2016和2017是QQ登录，2007和2010是微信登录
         {
             [self checkVersion];//检测版本
             NSDictionary * loginDic = responseObject[@"msg"];
             [SYUserDefaultMyInfo userdefaultSaveInfo:loginDic];
             [[LXHelpClass appDelegate] setRootwithTabBar];
         }
         else
         {
             [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:kUDLoginSuccess];
             [self hudHideTextStr:responseObject[@"msg"] delayTime:3.0];
         }
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:kUDLoginSuccess];
         [self hudHideTextStr:@"登录失败，请检查网络" delayTime:3.0];
     }];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self resignFirstResponder];
}

#pragma mark - Setter and getter

@end
