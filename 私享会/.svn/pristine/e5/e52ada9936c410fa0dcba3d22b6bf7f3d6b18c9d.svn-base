//
//  SYH5ViewController.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYH5ViewController.h"

#import "WXApiObject.h"
#import "WXApi.h"
#define Notification @"AllPostViewController"

@interface SYH5ViewController ()<UIWebViewDelegate,UIAlertViewDelegate>
{
    
    UIWebView * web;
    NSString * urlStr;
    
    NSString * zhifuStr;
    
}


@end

@implementation SYH5ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getWXMoney:) name:Notification object:nil];
    self.titleStr = self.titleName;
    [self leftImageNormalStr:@"go_back_on" withAction:@selector(back)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getWXMoney:) name:Notification object:nil];
    
    //创建一个webView
    [self creatView];
    UILabel * titleLB = [self.view viewWithTag:3111];
    titleLB.text = self.titleName;
    titleLB.frame = CGRectMake(kScreenWidth/2-self.titleName.length/2*18, 0, self.titleName.length*18, 44);
}

-(void)creatView
{
    if (web)
    {
        [web removeFromSuperview];
        web = nil;
    }
    CGFloat webH = self.view.frame.size.height-64;
    
    web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, webH)];
    web.scrollView.showsHorizontalScrollIndicator = NO;
    web.scrollView.showsVerticalScrollIndicator = NO;
    web.delegate = self;

//    [self hudShowTextStr:@"加载中"];
    [self.HUD showAnimated:YES];
    if ([self.titleName isEqualToString:@"帖子详情"])
    {
        //        DLog(@"帖子详情");
        urlStr = self.urlSting;
    }
    else if ([self.titleName isEqualToString:@"APP下载"])//jsp结尾
    {
        //        DLog(@"app下载");
        NSString * token = [[NSUserDefaults standardUserDefaults]objectForKey:kUDToken];
        urlStr = [NSString stringWithFormat:@"%@?code=%@",self.urlSting,token];
    }
    else if ([self.titleName isEqualToString:@"发布活动"])//jsp结尾
    {
        //        DLog(@"发布活动");
        NSString * token = [[NSUserDefaults standardUserDefaults]objectForKey:kUDToken];
        urlStr = [NSString stringWithFormat:@"%@?code=%@",self.urlSting,token];
    }
    else if ([self.titleName isEqualToString:@"打赏"])//nick需要Url编码
    {
        //        DLog(@"打赏");
        urlStr = [self.urlSting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    else
    {
        urlStr=[NSString stringWithFormat:@"%@",self.urlSting];
    }
    //注：如果是tab来的界面不重新加载，以防止每次点击都加载
    if (self.isTab == YES)
    {
        
    }
    else
    {
        //拼接token
        [LXNetRequest getShortToken:^{
            
            NSString * token = [[NSUserDefaults standardUserDefaults]objectForKey:kUDToken];
            NSString * urlStrA;
#warning 需要修改请求
            urlStrA = [NSString stringWithFormat:@"%@&code=%@&client=%@&company=%@",urlStr,token,kAPPName,kSXHCompany];
            NSURL * url = [NSURL URLWithString:urlStrA];
            NSURLRequest * request = [NSURLRequest requestWithURL:url];
            [web loadRequest:request];
            web.backgroundColor = Color(235, 235, 235);
            [web setScalesPageToFit:YES];
            [self.view addSubview:web];
        }];
    }
    
     //测试
    /*
     NSURL * url = [NSURL URLWithString:self.urlSting];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    [self.view addSubview:web];
     */
}
-(void)back
{
    UIButton * closeBtn = [self.view viewWithTag:12345];
    if ([web canGoBack]==YES&&zhifuStr.length==0)
    {
        closeBtn.hidden = NO;
        [web goBack];
    }
    else
    {
        closeBtn.hidden = NO;
        [self goBack];
    }
}

//返回上一个界面
-(void)goBack
{
    zhifuStr = nil;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"MyPostViewController3" object:@"1"];//发送给发帖完成的界面用于跳转回去
    [self.navigationController popViewControllerAnimated:YES];
}

//发起微信支付
-(void)wxPay:(NSArray*)payInfo
{
    for (int i = 0; i<payInfo.count; i++)
    {
        DeLog(@"%@",payInfo[i]);
    }
    if (payInfo.count ==0)
    {
        DeLog(@"没数据返回。。");
        return;
    }
    
    NSString * partnerId = payInfo[1];
    NSString * prepayid = payInfo[2];
    NSString * package = payInfo[3];
    NSString * noncestr = payInfo[4];
    NSString * timeStamp = payInfo[5];
    NSString * sign = payInfo[6];
    
    PayReq* req   = [[PayReq alloc] init];
    req.partnerId = partnerId;
    req.prepayId = prepayid;
    req.nonceStr = noncestr;
    req.package = package;
    req.sign = sign;
    req.timeStamp = [timeStamp intValue];
    [WXApi sendReq:req];
    
}

-(void)getWXMoney:(NSNotification*)info
{
    //    WXSuccess           = 0,    /**< 成功    */
    //    WXErrCodeCommon     = -1,   /**< 普通错误类型    */
    //    WXErrCodeUserCancel = -2,   /**< 用户点击取消并返回    */
    //    WXErrCodeSentFail   = -3,   /**< 发送失败    */
    //    WXErrCodeAuthDeny   = -4,   /**< 授权失败    */
    //    WXErrCodeUnsupport  = -5,   /**< 微信不支持    */
    
    NSString * finalPath;
    PayResp*response=(PayResp*)info.object;
    switch(response.errCode)
    {
        case WXSuccess://服务器端查询支付通知或查询API返回的结果再提示成功
        {
            finalPath = [NSString stringWithFormat:@"%@%@",zhifuStr,@"&code=succ"];
        }
            break;
        case WXErrCodeUserCancel:
        {
            [self goBack];
        }
            break;
        default:
        {
            finalPath = [NSString stringWithFormat:@"%@%@",zhifuStr,@"&code=err"];
        }
            break;
    }
    //加载url
    NSURL * url = [NSURL URLWithString:finalPath];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getWXMoney:) name:Notification object:nil];
    
}


#pragma mark - webView代理
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hudHideTextStr:@"加载完成" delayTime:2.0];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self hudHideTextStr:[NSString stringWithFormat:@"加载失败:%@",error.description] delayTime:2.0];
}


////webView代理
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    NSString *urlString = [[request URL] absoluteString];
    urlString = [urlString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //最后一个跳转url
    NSArray *zhifu = [urlString componentsSeparatedByString:@";http://"];
    if (zhifu.count > 1)
    {
        zhifuStr = [NSString stringWithFormat:@"http://%@",zhifu[1]];
    }
    NSArray *urlComps = [urlString componentsSeparatedByString:@"://"];
    if([urlComps count] && [[urlComps objectAtIndex:0] isEqualToString:@"xileappiospay"])
    {
        
        NSArray *arrFucnameAndParameter = [(NSString*)[urlComps objectAtIndex:1] componentsSeparatedByString:@";"];
        
        [self wxPay:arrFucnameAndParameter];
        
        //        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"请到俱乐部群中报名缴费" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        //        [alert show];
        return NO;
    }
    return YES;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self goBack];
}


@end
