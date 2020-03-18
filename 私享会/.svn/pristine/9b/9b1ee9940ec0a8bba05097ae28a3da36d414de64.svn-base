//
//  LXSearchBarView.h
//  PrivateShare
//
//  Created by 李旭 on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

@protocol LXSearchProtocol <NSObject>

//搜索内容变化
- (void)searchContent:(NSString *)keywords;
//确定按钮触发事件
- (void)didClickConfirmButtoun;
@optional
//取消搜索
- (void)cancelSearch;

@end

@interface LXSearchBarView : UIView

@property (nonatomic,weak) id<LXSearchProtocol> searchDelegete;
@property (nonatomic, weak) UIView *searchView;
@property (nonatomic, weak) UIButton *forkBtn;//删除按钮
@property (nonatomic, weak) UIButton *cancelBtn;//取消按钮
@property (nonatomic, weak) UITextField *searchField;//搜索框

@end
