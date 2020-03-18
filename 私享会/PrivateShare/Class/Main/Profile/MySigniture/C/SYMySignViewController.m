//
//  SYMySignViewController.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYMySignViewController.h"
#import "SYMySignView.h"

@interface SYMySignViewController ()<SYMySignDelegate>
{
    SYMySignView * signView;
}

@end

@implementation SYMySignViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.titleStr = @"个性签名";
    
    [self leftImageNormalStr:@"go_back_on" withAction:@selector(back)];
    [self rightTextNormalStr:@"保存" withAction:@selector(saveSig)];
    
    
    
    signView = [[SYMySignView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 100)];
    signView.mySignTextView.text = self.oldSign;
    signView.mySignDel = self;
    [self.view addSubview:signView];
    
    //让文字从头输入  让光标在开始位置
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    self.HUD.label.text = @"修改中";
    [signView addSubview:self.HUD];

}

#pragma mark 保存签名点击事件
-(void)saveSig
{
    
    [signView updata];
    
}

#pragma mark 跳转回上一个页面点击事件
-(void)back
{
    [signView backLast];
}

//代理回调上传签名
-(void)mySignUpdata:(NSString *)mySign
{
    [self updataSigniture:mySign];
}
//代理回调点击返回签名判断
-(void)mySignBackLast:(NSString *)mySign
{
    if (![self.oldSign isEqualToString:mySign])
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"您修改了个性签名，是否需要保存?" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action)
        {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
        {
            [signView updata];
        }];
        
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}




//修改签名
-(void)updataSigniture:(NSString*)mySign
{
    NSString *urlAsString=[NSString stringWithFormat:@"%@%@%@",kSXHXLSPath,kSXHUserPath,kSXHUserSignature];
    NSDictionary * body= @{@"signature":mySign};
    [self.HUD showAnimated:YES];
    [LXNetRequest putWithUrlString:urlAsString withParam:[NSMutableDictionary dictionaryWithDictionary:body] success:^(NSDictionary *responseObject)
     {
         int status = [responseObject[@"status"]intValue];
         if (status == 2000)
         {
             [self hudHideTextStr:@"修改成功" delayTime:2.0];
             [[NSUserDefaults standardUserDefaults]setObject:mySign forKey:kUDSignature];
             [self.navigationController popViewControllerAnimated:YES];
         }
         else
         {
             [self hudHideTextStr:@"修改失败" delayTime:2.0];
             [self netRetuenCode:status];
             [self.navigationController popViewControllerAnimated:YES];
         }
         
     } failure:^(NSError *error)
     {
         [self hudHideTextStr:@"失败,请检查网络" delayTime:2.0];
         [self netRetuenCode:404];
         [self.navigationController popViewControllerAnimated:YES];
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
