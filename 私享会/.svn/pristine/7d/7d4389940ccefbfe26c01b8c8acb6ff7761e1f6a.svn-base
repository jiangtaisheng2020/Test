//
//  SYMyNickNameViewController.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYMyNickNameViewController.h"
#import "SYMyInfoUpdateView.h"

@interface SYMyNickNameViewController ()<SYUpdateDelegate>
{
    SYMyInfoUpdateView * updateView;
}

@end

@implementation SYMyNickNameViewController

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleStr = @"昵称";
    
    [self leftImageNormalStr:@"go_back_on" withAction:@selector(back)];
    [self rightTextNormalStr:@"保存" withAction:@selector(saveName)];
    
    
    updateView = [[SYMyInfoUpdateView alloc]initWithFrame:CGRectMake(10, 64, kScreenWidth, kScreenHeight-64) titleName:nil number:self.oldName];
    updateView.updateDelegate = self;
    updateView.emailTextField.placeholder = @"请输入昵称";
    [self.view addSubview:updateView];
    
    self.HUD.label.text = @"修改中";
    [self.view addSubview:self.HUD];

}


#pragma mark - CustomDelegate
-(void)bdNickName:(NSString *)nickName
{
    [self upDataNickName:nickName];
}


#pragma mark - Private methods

//代理回调返回上一届面判断是否需要保存nickname
-(void)bdBackLast:(NSString *)nickName
{
    if ([self.oldName isEqualToString:nickName])
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确认使用新的昵称?" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action)
       {
           [self.navigationController popViewControllerAnimated:YES];
       }];
        
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
        {
            [self saveName];
        }];
        
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    
    
}

//上传昵称
-(void)saveName
{
    [updateView update];
}


-(void)back
{
    [updateView backLast];
}


#warning 需要修改请求
//修改昵称
-(void)upDataNickName:(NSString *)nickName
{
    NSString *urlAsString=[NSString stringWithFormat:@"%@%@%@",kSXHXLSPath,kSXHUserPath,kSXHUserNickName];
    NSDictionary * body= @{@"nickname":nickName};
    
    
    [self.HUD showAnimated:YES];
    [LXNetRequest putWithUrlString:urlAsString withParam:[NSMutableDictionary dictionaryWithDictionary:body] success:^(NSDictionary *responseObject)
     {
         int status = [responseObject[@"status"]intValue];
         if (status == 2000)
         {
             [self hudHideTextStr:@"修改成功" delayTime:2.0];
             [[NSUserDefaults standardUserDefaults]setObject:nickName forKey:kUDNickname];
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
