//
//  SYAboutViewController.m
//  tttttttttttt
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "SYAboutViewController.h"
#import "SYAboutView.h"
@interface SYAboutViewController ()

@end

@implementation SYAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleStr = @"关于我们";
        
    [self leftImageNormalStr:@"go_back_on" withAction:@selector(back)];

    SYAboutView * about = [[SYAboutView alloc]initWithFrame:CGRectMake(0, kSCreenViewY, kScreenWidth, kScreenHeight-kSCreenViewY)];
    [self.view addSubview:about];
    
    
}
#pragma mark - Private methods
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
