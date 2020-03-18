//
//  SYCountyViewController.h
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXNavBarController.h"

@interface SYCountyViewController : LXNavBarController

/**县*/
@property(nonatomic,strong)NSArray * countyArr;


/**传递过来的省*/
@property(nonatomic,copy)NSString * provinceStr;


/**传递过来的市*/
@property(nonatomic,copy)NSString * cityStr;

@end
