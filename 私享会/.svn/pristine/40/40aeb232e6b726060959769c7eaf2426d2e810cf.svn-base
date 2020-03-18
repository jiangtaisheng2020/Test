//
//  SYTimeLose.m
//  PrivateShare
//
//  Created by bean on 16/9/21.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYTimeLose.h"

@implementation SYTimeLose
+(void)testCodeTimeChange:(UIButton*)tesetCodeBtn
{
    __block int timeout=120; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [tesetCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                tesetCodeBtn.backgroundColor = Color(168, 208, 76);
                tesetCodeBtn.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeout % 121;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [tesetCodeBtn setTitle:[NSString stringWithFormat:@"%@秒等待",strTime] forState:UIControlStateNormal];
                tesetCodeBtn.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
                tesetCodeBtn.userInteractionEnabled = NO;
                
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
}

@end
