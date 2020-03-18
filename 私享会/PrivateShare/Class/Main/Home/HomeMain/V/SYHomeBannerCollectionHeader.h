//
//  SYHomeBannerCollectionHeader.h
//  PrivateShare
//
//  Created by bean on 16/9/21.
//  Copyright © 2016年 xunbao. All rights reserved.
//
@protocol SYHomeBannerDelegate <NSObject>

-(void)didTapAD:(int)adNum;
-(void)didTapButton:(int)btNum;


-(void)didTapPhone:(NSString*)phoneNum;
-(void)didTapSearch:(NSString*)searchText searchCity:(NSString*)searchCity;

@end
#import <UIKit/UIKit.h>

@interface SYHomeBannerCollectionHeader : UICollectionReusableView

@property(nonatomic,strong)UILabel * headerBottomLB;

@property(nonatomic,weak)id<SYHomeBannerDelegate>bannerDel;

@end
