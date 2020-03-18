//
//  SYMySexViewController.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYMySexViewController.h"
#import "SYMySexView.h"

@interface SYMySexViewController ()
{
    SYMySexView * manView;
    SYMySexView * womanView;
}

@end

@implementation SYMySexViewController




#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleStr = @"性别";
    
    [self leftImageNormalStr:@"go_back_on" withAction:@selector(back)];
    
    
    [self creatView];
}


#pragma mark - Create view

-(void)creatView
{
    NSArray * sexArr = @[@"男",@"女"];
    for (int i = 0; i<sexArr.count; i++)
    {
        SYMySexView * sexView = [[SYMySexView alloc]initWithFrame:CGRectMake(0, 64+15+(44+15)*i, kScreenWidth, 44)];
        sexView.sexLb.text = sexArr[i];
        sexView.tag = i+1;
        [self.view addSubview:sexView];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeSex:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [sexView addGestureRecognizer:tap];
    }
    
    manView = [self.view viewWithTag:1];
    womanView = [self.view viewWithTag:2];
    
    if ([self.mysex isEqualToString:@"女"])
    {
        manView.hiddenImg = YES;
        womanView.hiddenImg = NO;
    }
    else
    {
        womanView.hiddenImg = YES;
        manView.hiddenImg = NO;
    }
    
    self.HUD.label.text = @"修改中";
    [self.view addSubview:self.HUD];
}


#pragma mark - Private methods


-(void)changeSex:(UITapGestureRecognizer*)tap
{
    switch (tap.view.tag)
    {
        case 1://男
        {
            womanView.hiddenImg = YES;
            manView.hiddenImg = NO;
            [self updataSex:@"男"];
        }
            break;
        case 2://女
        {
            manView.hiddenImg = YES;
            womanView.hiddenImg = NO;
            [self updataSex:@"女"];
        }
            break;
            
        default:
            break;
    }
}


-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
#warning 需要修改请求
//修改性别
-(void)updataSex:(NSString*)sex
{
    NSString *urlAsString=[NSString stringWithFormat:@"%@%@%@",kSXHXLSPath,kSXHUserPath,kSXHUserSex];
    NSDictionary * body= @{@"sex":sex};
//    [self hudShowTextStr:@"修改中"];
    [self.HUD showAnimated:YES];
    [LXNetRequest putWithUrlString:urlAsString withParam:[NSMutableDictionary dictionaryWithDictionary:body] success:^(NSDictionary *responseObject)
     {
         int status = [responseObject[@"status"]intValue];
         
         if (status == 2000)
         {
             [self hudHideTextStr:@"修改成功" delayTime:2.0];
             [[NSUserDefaults standardUserDefaults]setObject:sex forKey:kUDSex];
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
