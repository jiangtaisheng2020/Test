//
//  LeavingMessageView.m
//  PrivateShare
//
//  Created by apple2015 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LeavingMessageView.h"
#import "BattleTextView.h"
@interface LeavingMessageView ()<UITextViewDelegate>

@property(nonatomic,strong) BattleTextView * textView;
@property (nonatomic, assign) CGFloat keyboardHeight;
@property(nonatomic,strong)UIButton * messageBtn;

@end

@implementation LeavingMessageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
        
    }
    return self;

}


- (void)createUI
{
   
    UIView * topView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 54)];
    [self addSubview:topView];
    //
    UIView * ligteView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];
    ligteView.backgroundColor= kBackGroundColor;
    [topView addSubview:ligteView];
    //
    UIView * leftView=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(ligteView.frame), 8, 44)];
    leftView.backgroundColor= kBlueFontColor;
    [topView addSubview:leftView];
    
    UILabel * titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftView.frame)+10, CGRectGetMaxY(ligteView.frame)+10, 70, 16)];
    titleLabel.textAlignment=NSTextAlignmentLeft;
    titleLabel.font=[UIFont boldSystemFontOfSize:16];
    titleLabel.textColor=[UIColor colorWithRed:0/255.0 green:129/255.0 blue:204/255.0 alpha:1];
    titleLabel.text=@"私人订制";
    [topView  addSubview:titleLabel];
    UIImageView * imageView= [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame)+8, CGRectGetMaxY(ligteView.frame)+10, 16, 16)];
    [imageView setImage:[UIImage imageNamed:@"set1_"]];
    [topView addSubview:imageView];
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame)-1, kScreenWidth, 1)];
    lineView.backgroundColor =[UIColor lightGrayColor];
    [topView addSubview:lineView];
    
   //创建textView
    
    BattleTextView * textView =[[BattleTextView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(topView.frame)+20, kScreenWidth-30, 100)];
    textView.font = [UIFont systemFontOfSize:14];
    textView.placehoder = @"说出你的需求，给我们的客服留言，私人管家将尽快为你定制属于您的专属旅游计划 。（如旅游时间，出发地，目的地,人数等。）";
    textView.placehoderColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    textView.font=[UIFont systemFontOfSize:14];
    textView.delegate = self;
    textView.returnKeyType = UIReturnKeyDone;
    textView.layer.borderWidth=1.0;
    textView.layer.borderColor= [UIColor colorWithRed:0/255.0 green:129/255.0 blue:204/255.0 alpha:1].CGColor;
    textView.layer.cornerRadius =5;
    textView.layer.masksToBounds=YES;
    [self addSubview:textView];
    self.textView = textView;

    UIButton *  houseBtn =[[UIButton alloc]init];
    houseBtn.frame=CGRectMake(kScreenWidth-15-80, CGRectGetMaxY(self.textView.frame)+10, 80, 30);
    [houseBtn setTitle:@"呼叫管家" forState:UIControlStateNormal];
    [houseBtn addTarget:self action:@selector(message:) forControlEvents:UIControlEventTouchUpInside];
    houseBtn.tag=2;
    houseBtn.layer.cornerRadius=5;
    houseBtn.layer.masksToBounds=YES;
    houseBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [houseBtn setBackgroundColor:[UIColor colorWithRed:0/255.0 green:129/255.0 blue:204/255.0 alpha:1]];
    [self addSubview:houseBtn];
    
    UIButton *  messageBtn =[[UIButton alloc]init];
    messageBtn.frame=CGRectMake(CGRectGetMinX(houseBtn.frame)-55, CGRectGetMaxY(self.textView.frame)+10, 50, 30);
    [messageBtn setTitle:@"留言" forState:UIControlStateNormal];
    messageBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [messageBtn addTarget:self action:@selector(message:) forControlEvents:UIControlEventTouchUpInside];
     messageBtn.tag=1;
    messageBtn.layer.cornerRadius=5;
    messageBtn.layer.masksToBounds=YES;
    [messageBtn setBackgroundColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1]];
    self.messageBtn=messageBtn;
    [self addSubview:self.messageBtn];

//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange:) name:UITextViewTextDidChangeNotification object:nil];

}

- (void)textChange:(NSNotification *)notic
{

    if (self.textView.text.length>0) {
        
        [self.messageBtn setBackgroundColor:[UIColor colorWithRed:0/255.0 green:129/255.0 blue:204/255.0 alpha:1]];
        
    }else{
    
        [self.messageBtn setBackgroundColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1]];

    }

}
- (void)message:(UIButton *)btn
{
    if (btn.tag==1) {
        
        if (_delegate &&[_delegate respondsToSelector:@selector(setFormMessage:)]&&self.textView.text.length>0) {
            
            [_delegate setFormMessage:self.textView.text];
        }
        
    }
    if (btn.tag==2) {
        
        if (_delegate &&[_delegate respondsToSelector:@selector(setFormMessage:)]) {
            
            [_delegate setFormMessage:nil];
        }
        
    }

}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification  object:nil];
    
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange:) name:UITextViewTextDidChangeNotification object:nil];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        if ([self.delegate respondsToSelector:@selector(keyboardHeight:)]) {
            [self.delegate keyboardHeight:0 ];
        }
        
        
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        return NO;
    }
    
    
    return YES;
}

- (void)keyboardWillChange:(NSNotification *)noti
{
    NSDictionary *dict  = noti.userInfo;
    CGRect keyboardFrame = [dict[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if (keyboardFrame.size.height > 0) {
        self.keyboardHeight = keyboardFrame.size.height;
        
        if ([self.delegate respondsToSelector:@selector(keyboardHeight:)]) {
            [self.delegate keyboardHeight:keyboardFrame.size.height ];
        }
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
