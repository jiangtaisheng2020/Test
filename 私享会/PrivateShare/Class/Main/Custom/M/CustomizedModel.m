//
//  CustomizedModel.m
//  PrivateShare
//
//  Created by apple2015 on 16/9/24.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "CustomizedModel.h"

@implementation CustomizedModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{



}

- (void)setImagePath:(NSString *)imagePath
{


    _imagePath =[NSString stringWithFormat:@"http://www.xilexuan.com%@",imagePath];

}
@end
