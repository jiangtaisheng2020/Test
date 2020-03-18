//
//  ProposedViewController.m
//  PrivateShare
//
//  Created by apple2015 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "ProposedViewController.h"
#import "TSProposalTopView.h"
#import "TSSuggestionView.h"
#import "TSPhoneView.h"
#import "isPhoneNumber.h"

@interface ProposedViewController ()<TSSuggestionViewDelegate,TSPhoneViewDelegate>
@property(nonatomic,strong)TSProposalTopView * topView;
@property(nonatomic,strong) UIScrollView * scrollView ;
@property(nonatomic,strong)TSSuggestionView * suggesstView;
@property(nonatomic,strong)TSPhoneView * phoneView;
@property(nonatomic,copy) NSString * suggestText;
@property(nonatomic,copy) NSString * phoneText;
@end

@implementation ProposedViewController
#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createNav];
    [self createUI];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
}


- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    
    [super viewDidDisappear:animated];
}


#pragma mark - Interface

#pragma mark - Loading data

#pragma mark - Create view


- (void)createNav
{
    self.titleStr =@"意见反馈";
    [self leftImageNormalStr:@"go_back_on" withAction:@selector(back)];
    [self rightTextNormalStr:@"提交" withHlightedStr:@"提交" withAction:@selector(submit:)];


}
- (void)createUI{

    UIScrollView * scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, kSCreenViewY, kScreenWidth, kScreenHeight-kSCreenViewY)];
    scrollView.contentSize =CGSizeMake(kScreenWidth, self.scrollView.height+1);
    scrollView.bounces=YES;
    self.scrollView=scrollView;
    [self.view addSubview:scrollView];

    self.topView= [[TSProposalTopView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 240)];
    [self.scrollView addSubview:self.topView];
    
    self.suggesstView =[[TSSuggestionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topView.frame)+10, kScreenWidth, 169)];
    self.suggesstView.delegate=self;
    self.suggesstView.titleStr=@"您的建议";
    self.suggesstView.textStr=@"请简要描述你的问题和意见";
    
    self.phoneView =[[TSPhoneView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.suggesstView.frame), kScreenWidth, 88)];
    self.phoneView.titleStr=@"联系电话";
    self.phoneView.textStr=@"  选填 ，便于我们与你联系";
    self.phoneView.delegate=self;
    [self.scrollView addSubview:self.suggesstView];
    [self.scrollView addSubview:self.phoneView];
    
    CGFloat height = CGRectGetMaxY(self.phoneView.frame)>self.scrollView.height ?(CGRectGetMaxY(self.phoneView.frame) ):self.scrollView.height;
   self.scrollView.contentSize =CGSizeMake(kScreenWidth, height);
    [self.view sendSubviewToBack:self.scrollView];

}
#pragma mark - UITableViewDelegate

#pragma mark - SystemDelegate

#pragma mark - CustomDelegate
- (void)setFormMessage:(NSString *)textstring
{
    self.suggestText =textstring;
//    NSLog(@"--------------%@",textstring);
    
}

- (void)keyboardHeight:(CGFloat)height
{
    
    if (height>0) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = self.scrollView.frame;
            rect.origin.y = (kSCreenViewY-260);
            self.scrollView.frame = rect;
        }];

    }else{
    
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = self.scrollView.frame;
            rect.origin.y = (kSCreenViewY);
            self.scrollView.frame = rect;
        }];
    }
}

- (void)setFormPhone:(NSString *)text
{
    self.phoneText=text;
//    NSLog(@"++++++++++%@",text);

  
}

#pragma mark - Observer

#pragma mark - Enent response
- (void)submit:(UIButton *)btn
{
    if (self.suggestText.length>0&&self.phoneText.length==0) {
        [self submitMessage];
    }else if (self.suggestText.length>0&&self.phoneText.length>0){
        if ([isPhoneNumber isPhoneNumAvailability:self.phoneText])
        {
            [self submitMessage];
        }else{
        
            
        }
    }
    else{
        UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:@"提示" message:@"请填写你的建议" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    
    }

}

- (void)submitMessage{

    NSString * urlString=[NSString stringWithFormat:@"http://wechat.xunbao178.com/goddess/badminton?method=elopeSuggestMsg&company=%@&client=%@&isAppClient=1",kSXHCompany,kAPPName];
    NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:0];
    [dic setValue:self.suggestText forKey:@"msg"];
    if (self.phoneText.length>0) {
        [dic setValue:self.phoneText forKey:@"tel"];
    }
    [LXNetRequest postWithUrlString:urlString withParam:dic success:^(NSDictionary *responseDic) {
        
        NSLog(@"%@",responseDic);
        NSInteger code =[responseDic[@"code"]integerValue];
        if (code==200) {
            UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:@"提示" message:@"意见提交成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
        }else{
        
            UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:@"提示" message:@"意见提交失败" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
        }
        
    } failure:^(NSError *error) {
        
    }];

}
- (void)back
{

    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Private methods

#pragma mark - Setter and getter
@end
