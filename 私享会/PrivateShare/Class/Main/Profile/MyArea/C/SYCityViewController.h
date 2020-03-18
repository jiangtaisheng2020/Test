//
//  SYCityViewController.h
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXNavBarController.h"
 
@interface SYCityViewController : LXNavBarController

/**市*/
@property(nonatomic,strong)NSArray * cityArr;

/**传递过来的省*/
@property(nonatomic,copy)NSString * provinceStr;

@end
