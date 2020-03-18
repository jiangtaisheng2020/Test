//
//  SYProvinceViewController.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYProvinceViewController.h"
#import "SYCityViewController.h"
#import "SYMyAreaTableView.h"

@interface SYProvinceViewController ()<CityChooseDelegate>
{
    NSArray * data;
}

@end

@implementation SYProvinceViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.titleStr = @"省/直辖市";
    
    [self leftImageNormalStr:@"go_back_on" withAction:@selector(back)];
    
    NSArray * areaArr = [[NSUserDefaults standardUserDefaults]objectForKey:@"ChinaAllArea"];
    if (areaArr.count!=0)
    {
        data = areaArr;
    }
    else
    {
        data = [[NSArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"area.plist" ofType:nil]];
        [[NSUserDefaults standardUserDefaults]setObject:data forKey:@"ChinaAllArea"];
    }
    
    
    
    SYMyAreaTableView * cityView = [[SYMyAreaTableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    cityView.chooseType = Provience;
    cityView.cityDelegate = self;
    [cityView loadDataArray:data];
    [self.view addSubview:cityView];
    
}



-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(void)cityChooseNext:(NSArray *)nextArray chooseStr:(NSString*)chooseStr
{
    SYCityViewController * city = [[SYCityViewController alloc]init];
    city.cityArr = nextArray;
    city.provinceStr = chooseStr;
    [self.navigationController pushViewController:city animated:YES];
}


@end
