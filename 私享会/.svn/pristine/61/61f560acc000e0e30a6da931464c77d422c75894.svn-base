//
//  LXFindCollectionHeaderSearch.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXFindCollectionHeaderSearch.h"
#import "LXSearchBarView.h"

@interface LXFindCollectionHeaderSearch () <LXSearchProtocol>

@property (nonatomic, strong)   UISearchController *searchController;

@end

@implementation LXFindCollectionHeaderSearch

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        LXSearchBarView *searchView = [[LXSearchBarView alloc] initWithFrame:CGRectMake(0, 0, self.width, 44)];
        searchView.backgroundColor = kCellBackGroundColor;
        searchView.searchDelegete = self;
        [searchView.searchField.layer setBorderColor:[Color(0, 129, 204) CGColor]];
//        searchView.searchField.userInteractionEnabled = NO;
        [self addSubview:searchView];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, searchView.height, kScreenWidth, 20);
        [btn setImage:[UIImage imageNamed:@"read-mode"] forState:UIControlStateNormal];
        [btn setTitle:@"浏览记录：新西兰、温度水城、爱心公益" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitleColor:Color(153, 153, 153) forState:UIControlStateNormal];
        btn.backgroundColor = kBackGroundColor;
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, kScreenGap, 0, 0);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, kScreenGap + 15 - btn.imageView.width, 0, 0);
        [self addSubview:btn];
    }
    return self;
}

//搜索内容变化
- (void)searchContent:(NSString *)keywords
{

}

//确定按钮触发事件
- (void)didClickConfirmButtoun
{
    
}

//取消搜索
- (void)cancelSearch
{
    
}

@end
