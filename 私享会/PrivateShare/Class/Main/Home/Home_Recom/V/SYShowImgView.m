//
//  SYShowImgView.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYShowImgView.h"

@implementation SYShowImgView

{
    UIScrollView * _adScr;
    UIPageControl * _pageControl;
    NSTimer * _timer;
    NSArray * _imgArr;
    
    CGFloat pmW;
    CGFloat pmH;
    NSInteger _tapNumPic;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        pmW = kScreenWidth;//[UIScreen mainScreen].bounds.size.width;
        pmH = kScreenHeight;//[UIScreen mainScreen].bounds.size.height;
//        kScreenWidth
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}


-(void)getImgArr:(NSArray *)imgArr tapNum:(NSInteger)tapNum
{
    _imgArr = [NSArray arrayWithArray:imgArr];
    _tapNumPic = tapNum;
    [self creatADScr];
    [self creatADPage];
}

/**
 *  广告视图
 *  @param imgArr 图片数组
 */
-(void)creatADScr
{
    _adScr = [[UIScrollView alloc]initWithFrame:self.frame];
    _adScr.contentSize = CGSizeMake((_imgArr.count+1)*pmW, pmH);
    _adScr.contentOffset = CGPointMake((_tapNumPic-1)*pmW, 0);
    _adScr.showsHorizontalScrollIndicator = NO;
    _adScr.showsVerticalScrollIndicator = NO;
    _adScr.pagingEnabled = YES;
    _adScr.delegate = self;
    [self addSubview:_adScr];
    
    
    for (int i = 0; i<_imgArr.count; i++)
    {
        UIImageView * view2 = [[UIImageView alloc]initWithFrame:CGRectMake(pmW*i, pmH/2-(pmH-100)/2, pmW, pmH-100)];
        
        NSString * orgUrl = _imgArr[i];
        
        [self showImg:orgUrl imageView:view2];
        
        
    }
    
    
    UIImageView * view3 = [[UIImageView alloc]initWithFrame:CGRectMake(pmW*_imgArr.count, pmH/2-(pmH-100)/2, pmW, pmH-100)];
    
    NSString * orgUrl = _imgArr[0];
    
    [self showImg:orgUrl imageView:view3];
    
    
}
/**
 *  页码小白点
 *
 *  @param imgArr 图片数组
 */
-(void)creatADPage
{
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, pmH-40, pmW, 40)];
    
    
    [self addSubview:_pageControl];
    
    
    
    //给PageControl设置总页数
    _pageControl.numberOfPages = _imgArr.count;
    
    //设置当前页码  //也就是小白点的位置
    _pageControl.currentPage = _tapNumPic-1;
    
    //选中颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    //未选中颜色
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    
    
}





#pragma ****UIScrollViewDelegate*****

/**
 *  结束减速的适合调用，然后计算偏移量
 *
 *  @param scrollView scr
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSInteger page = scrollView.contentOffset.x/pmW;
    
    
    _pageControl.currentPage = page;
    
    if (scrollView.contentOffset.x>=pmW*_imgArr.count)
    {
        _pageControl.currentPage = 0;
        scrollView.contentOffset = CGPointZero;
        
    }
    else if (scrollView.contentOffset.x <=0)
    {
        _pageControl.currentPage = _imgArr.count+1;
        scrollView.contentOffset = CGPointMake(pmW*_imgArr.count, 0);
        
    }
    
    
}



-(void)showImg:(NSString*)orgUrl imageView:(UIImageView*)imageView
{
    
    
    NSString *imgUrl = [orgUrl stringByReplacingOccurrencesOfString:@"/t" withString:@"/o"];
    
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"images"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
     {
         
         
         CGRect imgFram = imageView.frame;
         CGFloat scal = image.size.width/image.size.height;
         if (scal>=1)
         {
             CGFloat height = (image.size.height/image.size.width)*pmW;
             imageView.frame = CGRectMake(CGRectGetMinX(imgFram), pmH/2-height/2, pmW, height);
         }
         else
         {
             CGFloat width;
             width = scal*(pmH-60);
             
             if (width>=pmW)
             {
                 width = pmW;
             }
             
             imageView.frame = CGRectMake(CGRectGetMinX(imgFram), pmH/2-(pmH-60)/2, width, pmH-60);
         }
         
     }];
    
    
    
    
    [_adScr addSubview: imageView];
}


@end
