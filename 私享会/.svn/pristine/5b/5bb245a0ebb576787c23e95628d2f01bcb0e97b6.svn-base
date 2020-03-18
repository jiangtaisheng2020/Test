//
//  SYFindCodeView.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYFindCodeView.h"
#import "SYInputTextView.h"

@interface SYFindCodeView()<SYInputDelegate>
{
    NSMutableArray * textArr;
}

@end

@implementation SYFindCodeView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        textArr = [NSMutableArray arrayWithArray:@[@"",@"",@""]];
        [self creatUI];
    }
    
    return self;
}

-(void)creatUI
{
    NSArray * placeHolderArr = @[@"输入注册手机号",@"输入验证码",@"输入新密码"];
    NSArray * imgNameArr = @[@"user",@"auth code",@"password"];
    for (int i = 0; i<placeHolderArr.count; i++)
    {
        SYInputTextView * inputV = [[SYInputTextView alloc]initWithFrame:CGRectMake(0, 44*i, kScreenWidth, 44)];
        inputV.tag = i+10;
        inputV.inputDel = self;
        [inputV inputViewPlaceHolder:placeHolderArr[i] img:[UIImage imageNamed:imgNameArr[i]]];
        [self addSubview:inputV];
        
    }
    
    
}

#pragma mark - CustomDelegate
-(void)didReturnText:(NSString *)text textTag:(NSInteger)tag
{
    [textArr setObject:text atIndexedSubscript:tag-10];
    [_findCodeDel didReturnTexttextArray:textArr];
}



@end
