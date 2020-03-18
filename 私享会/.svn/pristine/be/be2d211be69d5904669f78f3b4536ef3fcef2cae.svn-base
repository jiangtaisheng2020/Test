
//
//  SYCityViewController.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYCityViewController.h"

#import "SYCountyViewController.h"
#import "SYMyAreaTableView.h"
@interface SYCityViewController ()<CityChooseDelegate>

@end

@implementation SYCityViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self creatData];
    
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}




-(void)creatData
{
    
    self.titleStr = @"市/区";
    [self leftImageNormalStr:@"go_back_on" withAction:@selector(back)];
    
    
    SYMyAreaTableView * cityChooseView = [[SYMyAreaTableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    cityChooseView.cityDelegate = self;
    cityChooseView.chooseType = City;
    [cityChooseView loadDataArray:self.cityArr];
    [self.view addSubview:cityChooseView];
    
    self.HUD.label.text = @"修改中";
    [cityChooseView addSubview:self.HUD];
}



-(void)cityChooseNext:(NSArray *)nextArray chooseStr:(NSString *)chooseStr
{
    if (nextArray.count!=0)
    {
        SYCountyViewController * county = [[SYCountyViewController alloc]init];
        county.provinceStr = self.provinceStr;
        county.cityStr = chooseStr;
        county.countyArr = nextArray;
        [self.navigationController pushViewController:county animated:YES];
    }
    else
    {
        NSString * province = self.provinceStr;
        NSString * town = chooseStr;
        NSDictionary * body= @{@"country":@"中国",@"province":province,@"city":town};
        [self updataAddressHttpBody:body];
    }
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
