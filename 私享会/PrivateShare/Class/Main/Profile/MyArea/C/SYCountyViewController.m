//
//  SYCountyViewController.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYCountyViewController.h"
#import "SYMyAreaTableView.h"

@interface SYCountyViewController ()<CityChooseDelegate>
{
    NSArray * data;
}

@end

@implementation SYCountyViewController



- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.titleStr = @"县";
    [self leftImageNormalStr:@"go_back_on" withAction:@selector(back)];
    [self creatData];
    
}


-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)creatData
{
    SYMyAreaTableView * cityChooseView = [[SYMyAreaTableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    cityChooseView.cityDelegate = self;
    cityChooseView.chooseType = County;
    [cityChooseView loadDataArray:self.countyArr];
    [self.view addSubview:cityChooseView];
    
    self.HUD.label.text = @"修改中";
    [self.view addSubview:self.HUD];
    
}


-(void)cityChooseNext:(NSArray *)nextArray chooseStr:(NSString *)chooseStr
{
    
    NSString * province = self.provinceStr;
    NSString * town = self.cityStr;
    
    
    [[NSUserDefaults standardUserDefaults]setObject:province forKey:kUDProvince];
    [[NSUserDefaults standardUserDefaults]setObject:town forKey:kUDCity];
//    [[NSUserDefaults standardUserDefaults]setObject:chooseStr forKey:XLXUserCounty];
    
#pragma mark 发送请求
    NSDictionary * body= @{@"country":@"中国",@"province":self.provinceStr,@"city":self.cityStr/*,@"county":county*/};
    [self updataAddressHttpBody:body];
    

    
}


#warning 需要修改请求
//修改地区
-(void)updataAddressHttpBody:(NSDictionary*)httpBody
{
    NSString *urlAsString=[NSString stringWithFormat:@"%@%@%@%@",kSXHXLSPath,kSXHUserPath,kSXHUserInfoPath,kSXHUserArea];
    [self.HUD showAnimated:YES];
    
    [LXNetRequest putWithUrlString:urlAsString withParam:[NSMutableDictionary dictionaryWithDictionary:httpBody] success:^(NSDictionary *responseObject)
     {
         int status = [responseObject[@"status"]intValue];
         if (status == 2000)
         {
             [self hudHideTextStr:@"修改成功" delayTime:2.0];
             
             [[NSUserDefaults standardUserDefaults]setObject:httpBody[kUDProvince] forKey:kUDProvince];
             [[NSUserDefaults standardUserDefaults]setObject:httpBody[kUDCity] forKey:kUDCity];
             [self dismissViewControllerAnimated:YES completion:nil];
         }
         else
         {
             [self hudHideTextStr:@"修改失败" delayTime:2.0];
             [self netRetuenCode:status];
             [self dismissViewControllerAnimated:YES completion:nil];
         }
         
     } failure:^(NSError *error) {
         [self hudHideTextStr:@"失败，请检查网络" delayTime:2.0];
         [self netRetuenCode:404];
         [self dismissViewControllerAnimated:YES completion:nil];
     }];
    
}

@end
