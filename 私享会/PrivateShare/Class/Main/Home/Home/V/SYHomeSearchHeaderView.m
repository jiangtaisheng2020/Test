//
//  SYHomeSearchHeaderView.m
//  Search
//
//  Created by bean on 2016/10/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "SYHomeSearchHeaderView.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface SYHomeSearchHeaderView()<UITextFieldDelegate,CLLocationManagerDelegate,MKMapViewDelegate>
{
    CLLocationManager *locationManager;
    NSString * cityStr;
}

@property(nonatomic,weak)UIButton * cityBtn;
@property(nonatomic,weak)UITextField * searchTextV;
@property(nonatomic,weak)UIButton * phoneBtn;


@end

@implementation SYHomeSearchHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self creatUI];
        [self locate];
    }
    return self;
}

- (void)locate {
    //判断定位功能是否打开
    if ([CLLocationManager locationServicesEnabled]) {
        locationManager = [[CLLocationManager alloc] init];
        // 设置定位精度，十米，百米，最好
        [locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
        locationManager.delegate = self;
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
            
            [locationManager requestAlwaysAuthorization];//添加这句
        }        //    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        // 开始时时定位
        [locationManager startUpdatingLocation];
    }
    
}

#pragma mark CoreLocation delegate
// 错误信息
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"允许\"定位\"提示" message:@"请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"打开定位" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开定位设置
        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:settingsURL];
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:cancel];
    [alertVC addAction:ok];
    
    
    [self.cityBtn setTitle:@"无法定位" forState:UIControlStateNormal];
}

// 6.0 以上调用这个函数
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
//    NSLog(@"%lu", (unsigned long)[locations count]);
    //    CLLocation *newLocation = locations[0];
    CLLocation *currLocation = [locations lastObject];
    //------------------位置反编码---5.0之后使用-----------------
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:currLocation
                   completionHandler:^(NSArray *placemarks, NSError *error)
     {
         for (CLPlacemark *place in placemarks)
         {
             cityStr = place.locality;
             [self.cityBtn setTitle:cityStr forState:UIControlStateNormal];
         }
         [locationManager stopUpdatingLocation];
         
     }];
    
}

-(void)creatUI
{
    UIButton * cityButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cityButton.frame = CGRectMake(15, 15, 55, 16);
    [cityButton setTitleColor:kBlueFontColor forState:UIControlStateNormal];
    cityButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [cityButton setTitle:@"定位中" forState:UIControlStateNormal];
    [cityButton addTarget:self action:@selector(chooseCity) forControlEvents:UIControlEventTouchUpInside];
    self.cityBtn = cityButton;
    [self addSubview:self.cityBtn];
    
    
    UIImageView * arrImgV = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(cityButton.frame), 20, 6, 6)];
    arrImgV.image = [UIImage imageNamed:@"homeTopmap"];
    [self addSubview:arrImgV];
    
    
    UIView * searchImgBgView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(arrImgV.frame)+8, 10, 30, 28)];
    searchImgBgView.backgroundColor = Color(238, 238, 238);
    [self addSubview:searchImgBgView];
    
    UIImageView * searchImgV = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 15, 15)];
    searchImgV.image = [UIImage imageNamed:@"search"];
    [searchImgBgView addSubview:searchImgV];
    
    
    
    UITextField * searchText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(searchImgBgView.frame), 10, self.frame.size.width-CGRectGetMaxX(searchImgBgView.frame)-11-19-19, 28)];
    searchText.backgroundColor = Color(238, 238, 238);
    searchText.placeholder = @"马尔代夫";
    searchText.returnKeyType = UIReturnKeySearch;
    searchText.delegate = self;
    self.searchTextV = searchText;
    [self addSubview:self.searchTextV];
    
    
    
    UIButton * phoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    phoneButton.frame = CGRectMake(self.frame.size.width-15-19, 15, 19, 19);
    [phoneButton addTarget:self action:@selector(phone) forControlEvents:UIControlEventTouchUpInside];
    [phoneButton setImage:[UIImage imageNamed:@"tel"] forState:UIControlStateNormal];
    self.phoneBtn = phoneButton;
    [self addSubview:self.phoneBtn];
    
}

-(void)chooseCity
{
    
}

-(void)phone
{
    [_homeSearchDel homePhone:@"400-878-9736"];
}

#pragma mark systemDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (cityStr.length == 0)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"" message:@"定位中,请稍后点击" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"", nil];
        [alert show];
    }
    else
    {
        [_homeSearchDel homeSearch:textField.text searchCity:cityStr];
    }
    return NO;
}


@end
