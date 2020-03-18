//
//  UserGuideViewController.m
//  PrivateShare
//
//  Created by apple2015 on 16/9/26.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "UserGuideViewController.h"

@interface UserGuideViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)    UIPageControl   *pageControl;

@end

@implementation UserGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor lightGrayColor];
    [self createUI];
}

- (void)createUI
{
    //    第一次
    UIScrollView * sc=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    sc.contentSize=CGSizeMake(kScreenWidth*4, kScreenHeight);
    sc.bounces=YES;
    sc.showsHorizontalScrollIndicator=NO;
    sc.showsVerticalScrollIndicator=NO;
    sc.bounces=YES;
    sc.pagingEnabled=YES;
    sc.delegate=self;
    sc.tag=1991;
    [self.view addSubview:sc];
    //循环
    NSArray * array=@[@"bj1",@"bj2",@"bj3",@"bj4"];
    for (int i=0; i<array.count; i++) {
        
        UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i*kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        imageView.userInteractionEnabled=YES;
        [imageView setImage:[UIImage imageNamed:array[i]]];
        [sc addSubview:imageView];
        if (i==3) {
            //在最后一页添加button
            UIButton*button=[[UIButton alloc]init];
            button.frame=CGRectMake((kScreenWidth-114)/2, kScreenHeight-100, 114, 35);
            [button setImage:[UIImage imageNamed:@"enter_"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:button];
        }
    }

    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, kScreenHeight-60, kScreenWidth, 30)];
    _pageControl.numberOfPages = array.count;
    _pageControl.enabled = NO;
    _pageControl.currentPage=0;
    [self.view addSubview:_pageControl];
    
}
-(void)buttonClick:(UIButton *)btn
{
    //第一次
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    [user setValue:@"appfirst" forKey:@"appfirst"];
    [user synchronize];
    if (_delgate&&[_delgate respondsToSelector:@selector(replaceSetRootViewController)]) {
        [_delgate replaceSetRootViewController];
    }

//    [UIView animateWithDuration:1 animations:^{
//        sc.alpha=0;
//    }completion:^(BOOL finished) {
//        //[sc removeFromSuperview];
//        //第一次
//        NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
//        [user setValue:@"appfirst" forKey:@"appfirst"];
//        [user synchronize];
//        if (_delgate&&[_delgate respondsToSelector:@selector(replaceSetRootViewController)]) {
//            [_delgate replaceSetRootViewController];
//        }
//    }];
    
}

#pragma mark - UIScrollView的代理

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    CGFloat x =scrollView.contentOffset.x;
//    if (0>x  ) {
//        scrollView.bounces=NO;
//    }else{
//    
//        scrollView.bounces=YES;
//
//    }
  
    NSInteger index =scrollView.contentOffset.x/kScreenWidth;
    if (0<=index &&index<=3) {
        self.pageControl.currentPage =index;
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat x =scrollView.contentOffset.x;
    if (0>x  ) {
        
        scrollView.contentOffset=CGPointMake(0, 0);
        scrollView.bounces=NO;

    }else if (x >kScreenWidth*3){
        
        scrollView.contentOffset=CGPointMake(kScreenWidth*3, 0);
        scrollView.bounces=NO;

    }


}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
