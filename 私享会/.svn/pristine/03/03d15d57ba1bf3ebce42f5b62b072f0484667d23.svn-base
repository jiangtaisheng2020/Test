//
//  LXBaseViewController.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXBaseController.h"
#import "AppDelegate+SYLogin.h"

@implementation LXBaseController

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = kBackGroundColor;
    
    [self addHUD];
}

- (void)dealloc
{
    DeLog(@"%@", self);
}

- (void)addHUD
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    self.HUD = HUD;
    self.HUD.label.text = @"加载中...";
}

-(void)hudHideTextStr:(NSString*)hideText delayTime:(NSTimeInterval)time
{
    self.HUD.label.text = hideText;
    [self.HUD hideAnimated:YES afterDelay:time];
}

-(void)netRetuenCode:(int)code
{
    switch (code) {
        case 4032:
        {
            [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:kUDLoginSuccess];
            [[LXHelpClass appDelegate] setRootwithLogin];
        }
            break;
            
        default:
            break;
    }
}


-(void)checkVersion
{
    
    NSString * finalStr = [self versionNum];
    NSString *urlAsString=[NSString stringWithFormat:@"%@%@%@",kSXHXLSPath,kSXHUserPath,kSXHVersion];
    
    NSDictionary * body= @{@"versionId":finalStr,@"platform":@"12"};
    [LXNetRequest postWithUrlString:urlAsString withParam:[NSMutableDictionary dictionaryWithDictionary:body] success:^(NSDictionary *html)
     {
         if ([html[@"status"]intValue] == 2000)
         {
             if ([html[@"isNewest"]boolValue] == 0)
             {
                 UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"私享汇有新版本啦，快去更新下载吧。" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                 [alert show];
             }
             else
             {
                 //已经是新版本
             }
         }
         else if ([html[@"status"]intValue] == 5000)
         {
             UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"检测版本失败" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
             [alert show];         }
         
     } failure:^(NSError *error)
     {
         //        DLog(@"%@",error.description);
         UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"失败,请检查网络" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
         [alert show];
     }];
    
}

-(NSString*)versionNum
{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    int one = 0;
    int two = 0;
    int three = 0;
    
    for (int j = 0; j<currentVersion.length; j++)
    {
        NSString *s = [currentVersion substringWithRange:NSMakeRange(j, 1)];
        switch (j)
        {
            case 0:
            {
                one = [s intValue]*100;
            }
                break;
            case 2:
            {
                two = [s intValue]*10;
            }
                break;
            case 4:
            {
                three = [s intValue];
            }
                break;
            default:
                break;
        }
    }
    
    int final = one+two+three;
    NSString * finalStr = [NSString stringWithFormat:@"%d",final];
    return finalStr;
}


@end
