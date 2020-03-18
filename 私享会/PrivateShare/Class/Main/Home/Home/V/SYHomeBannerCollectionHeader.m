//
//  SYHomeBannerCollectionHeader.m
//  PrivateShare
//
//  Created by bean on 16/9/21.
//  Copyright © 2016年 xunbao. All rights reserved.
//



#import "SYHomeBannerCollectionHeader.h"
#import "DayTopicADView.h"
#import "SYChooseHomeView.h"
#import "SYHomeSearchHeaderView.h"

#pragma mark - Interface
@interface SYHomeBannerCollectionHeader()<DayTopicADTapDelegete,SYHomeSearchDel>

@property(nonatomic,weak)DayTopicADView * adView;
@property(nonatomic,weak)SYHomeSearchHeaderView * searchView;




@end

@implementation SYHomeBannerCollectionHeader
#pragma mark - Life cycle
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self creatUI];
    }
    
    return self;
}

-(void)creatUI
{
    
    SYHomeSearchHeaderView * searchV = [[SYHomeSearchHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 48)];
    searchV.homeSearchDel = self;
    searchV.backgroundColor = Color(255, 255, 255);
    self.searchView = searchV;
    [self addSubview:self.searchView];
    
    
    
    DayTopicADView * adV = [[DayTopicADView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.searchView.frame), self.frame.size.width, 160)];
    adV.delegate = self;
    //广告轮播器
    NSMutableArray * arr = [NSMutableArray array];
    [arr addObject:[UIImage imageNamed:@"banner"]];
    [arr addObject:[UIImage imageNamed:@"bashangcaoyuan_"]];
    [adV getImgArr:arr];
    self.adView = adV;
    [self addSubview:self.adView];
    
    NSArray * titleArr = @[@"结伴出行",@"定制旅游",@"景点推荐",@"私人管家"];
    NSArray * imgArr = @[@"partner",@"airplane",@"map",@"land"];
    
    for (int i = 0; i<imgArr.count; i++)
    {
        SYChooseHomeView * choose = [[SYChooseHomeView alloc]initWithFrame:CGRectMake(kScreenWidth/4*i, CGRectGetMaxY(self.adView.frame), kScreenWidth/4, 200/2)];
        [choose loadDate:titleArr[i] icon:imgArr[i]];
        choose.tag = 20+i;
        choose.userInteractionEnabled = YES;
        choose.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapType:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [choose addGestureRecognizer:tap];
        [self addSubview:choose];
    }
    
    UIView * headerBottomV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.adView.frame)+200/2, kScreenWidth, 46)];
    headerBottomV.backgroundColor = kBackGroundColor;
    [self addSubview:headerBottomV];
    
    
    
    self.headerBottomLB = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-18*10/2, 15, 18*10, 16)];
    self.headerBottomLB.textAlignment = 1;
    [headerBottomV addSubview:self.headerBottomLB];
    
    UIView * leftLine = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.headerBottomLB.frame)-69, headerBottomV.frame.size.height/2-0.5, 59, 0.5)];
    leftLine.backgroundColor = Color(204, 204, 204);
    [headerBottomV addSubview:leftLine];
    
    UIView * rightLine = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.headerBottomLB.frame)+10, headerBottomV.frame.size.height/2-0.5, 59, 0.5)];
    rightLine.backgroundColor = Color(204, 204, 204);
    [headerBottomV addSubview:rightLine];
    
}

-(void)tapAD:(int)adNum
{
    [_bannerDel didTapAD:adNum];
}

#pragma mark - CustomDelegate
-(void)homePhone:(NSString *)phoneNum
{
    [_bannerDel didTapPhone:phoneNum];
}

-(void)homeSearch:(NSString *)searchText searchCity:(NSString *)searchCity
{
    [_bannerDel didTapSearch:searchText searchCity:searchCity];
}


#pragma mark - Observer

#pragma mark - Enent response

#pragma mark - Private methods
-(void)tapType:(UITapGestureRecognizer*)tap
{
    [_bannerDel didTapButton:(int)tap.view.tag];
}


@end
