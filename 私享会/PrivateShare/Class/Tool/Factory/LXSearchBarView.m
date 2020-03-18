//
//  LXSearchBarView.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXSearchBarView.h"

#define kFieldY 6

@interface LXSearchBarView ()<UITextFieldDelegate>
{
    CGFloat fieldH;
    BOOL isSearch;
}

@end

@implementation LXSearchBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        fieldH = self.height - 2*kFieldY;
        
        //取消按钮
        UIButton *cancleBtn = [[UIButton alloc] init];
        [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        cancleBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        cancleBtn.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
        [cancleBtn setTitleColor:Color(0, 129, 204) forState:UIControlStateNormal];
        [cancleBtn addTarget:self action:@selector(cancleBtnClick) forControlEvents:UIControlEventTouchDown];
        [self addSubview:cancleBtn];
        self.cancelBtn = cancleBtn;
        
        UIView *searchView = [[UIView alloc] init];
        ViewBorderRadius(searchView, 5, 1, Color(0, 129, 204));
        searchView.backgroundColor = [UIColor whiteColor];
        [self addSubview:searchView];
        self.searchView = searchView;
        
        //搜索的图片
        UIImageView *findImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, (fieldH-15)/2.0, 15, 15)];
        findImg.image = [UIImage imageNamed:@"search"];
        [searchView addSubview:findImg];
        
        //删除按钮
        UIButton *fork = [[UIButton alloc] init];
        [fork setImage:[UIImage imageNamed:@"closed"] forState:UIControlStateNormal];
        [fork addTarget:self action:@selector(clearFieldText) forControlEvents:UIControlEventTouchDown];
        [searchView addSubview:fork];
        self.forkBtn = fork;
        
        //搜索框
        UITextField *field = [[UITextField alloc] init];
        field.font = [UIFont systemFontOfSize:16];
        field.placeholder = @"搜索";
        [field addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        field.clearsContextBeforeDrawing = YES;
        field.returnKeyType = UIReturnKeySearch;
        field.clearButtonMode = UITextFieldViewModeNever;
        field.delegate = self;
        field.textColor = [UIColor redColor];//输入文本颜色
        [field setValue:Color(0, 129, 204) forKeyPath:@"_placeholderLabel.textColor"];//默认文本颜色
        [searchView addSubview:field];
        self.searchField = field;
    }
    return self;
}

- (void)layoutSubviews
{
    CGFloat duration = self.cancelBtn.width==0 ? 0 : 0.5;
    [UIView animateWithDuration:duration animations:^{
        
        self.cancelBtn.frame = CGRectMake(self.searchField.editing ? kScreenWidth - 46: kScreenWidth, kFieldY, 46, fieldH);
        self.searchView.frame = CGRectMake(10, kFieldY, self.cancelBtn.x - 10*2, fieldH);
        self.forkBtn.frame = CGRectMake(self.searchView.width - 34, 0, 32, 32);
        
        CGFloat fieldX = 35;
        self.searchField.frame = CGRectMake(fieldX, 0, self.searchView.width - fieldX - self.forkBtn.width, fieldH);
    }];
}

//开始编辑
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self changeCancelBtnFrame];
}

//点击键盘上的搜索出发的事件
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.searchField resignFirstResponder];
    [self changeCancelBtnFrame];
    
    if ([self.searchDelegete respondsToSelector:@selector(didClickConfirmButtoun)]) {
        [self.searchDelegete didClickConfirmButtoun];
    }
    return YES;
}

//搜索框内容发生变化时出发
- (void)textFieldDidChange:(UITextField *)textField
{
    NSLog(@"--:%@", self.searchField.text);
    if ([self.searchDelegete respondsToSelector:@selector(searchContent:)]) {
        [self.searchDelegete searchContent:textField.text];
    }
}

//清空搜索框内容
- (void)clearFieldText
{
    self.searchField.text = @"";
    if ([self.searchDelegete respondsToSelector:@selector(searchContent:)]) {
        [self.searchDelegete searchContent:@""];
    }
}

//取消按钮出发
- (void)cancleBtnClick
{
    self.searchField.text = @"";
    [self.searchField resignFirstResponder];
    [self changeCancelBtnFrame];
    
    if ([self.searchDelegete respondsToSelector:@selector(cancelSearch)]) {
        [self.searchDelegete cancelSearch];
    }
}

- (void)changeCancelBtnFrame
{
    [self setNeedsLayout];
}

@end



