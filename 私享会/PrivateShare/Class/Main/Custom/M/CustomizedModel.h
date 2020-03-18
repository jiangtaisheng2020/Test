//
//  CustomizedModel.h
//  PrivateShare
//
//  Created by apple2015 on 16/9/24.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomizedModel : NSObject
@property(nonatomic,copy)NSString * aid;
@property(nonatomic,copy)NSString * brandName;
@property(nonatomic,copy)NSString * commId;
@property(nonatomic,copy)NSString * imagePath;
@property(nonatomic,copy)NSString * name;
@property(nonatomic,assign)CGFloat   price;
@property(nonatomic,copy)NSString * sellStatus;
@property(nonatomic,copy)NSString * sendPeriod;
@property(nonatomic,copy)NSString * typeName;
@property(nonatomic,copy)NSString * kucunNum;

@end
