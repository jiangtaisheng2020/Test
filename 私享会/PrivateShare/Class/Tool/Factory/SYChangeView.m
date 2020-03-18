//
//  SYChangeView.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYChangeView.h"
@interface SYChangeView ()
{
    UIView * levelView;
    UIButton * selectedBtn;
    UIView * moveline;
    CGFloat pmW;
    NSArray * titleArray;
}

@end
@implementation SYChangeView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //        [self creatUI];
    }
    return self;
}


-(void)creatUI:(NSArray*)titleArr
{
    pmW = [UIScreen mainScreen].bounds.size.width;
    
    levelView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, pmW, 32)];
    
    levelView.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:0.99];
    
    
    UIView *  baseView=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(levelView.frame)-1, pmW, 1)];
    baseView.backgroundColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1];
    [levelView addSubview:baseView];
    
    titleArray = titleArr;
    
    for (int i=0; i<titleArray.count; i++)
    {
        
        UIButton * button =[[UIButton alloc]init];
        button.frame=CGRectMake((pmW/titleArray.count)*i, 5, pmW/titleArray.count, 20);
        
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        
        [button setTitleColor:kBlackFontColor  forState:UIControlStateNormal];
        [button setTitleColor:kBlueFontColor    forState:UIControlStateSelected];
        [button setTitleColor:kBlueFontColor   forState:UIControlStateHighlighted];
        button.titleLabel.font=[UIFont systemFontOfSize:14];
        
        [button addTarget:self action:@selector(handClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=100+i;
        
        if (button.tag==100)
        {
            button.selected=YES;
            selectedBtn=button;
            selectedBtn.backgroundColor=[UIColor  clearColor];
            moveline =[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(levelView.frame)-2, pmW/titleArray.count, 1)];
            moveline.backgroundColor=kBlueFontColor;
            [levelView addSubview:moveline];
            
            
        }
        
        [levelView addSubview:button];
        
    }
    
    [self addSubview:levelView];
}


- (void)handClick:(UIButton *)btn
{
    
    switch (btn.tag)
    {
        case 100:
        {
            selectedBtn.selected=NO;
            btn.selected=YES;
            selectedBtn=btn;
            selectedBtn.backgroundColor=[UIColor  clearColor];
            
            
            [UIView animateWithDuration:0.3 animations:^{
                moveline.frame=CGRectMake(pmW/titleArray.count*0, CGRectGetMaxY(levelView.frame)-2, pmW/titleArray.count, 1);
            }];
            
            [_changeDel changeTap:1];
            
        }
            break;
            
        case 101:
        {
            
            selectedBtn.selected=NO;
            btn.selected=YES;
            selectedBtn=btn;
            selectedBtn.backgroundColor=[UIColor  clearColor];
            
            
            [UIView animateWithDuration:0.3 animations:^{
                moveline.frame=CGRectMake(pmW/titleArray.count*1, CGRectGetMaxY(levelView.frame)-2, pmW/titleArray.count, 1);
            }];
            
            [_changeDel changeTap:2];
        }
            break;
        case 102:
        {
            
            selectedBtn.selected=NO;
            btn.selected=YES;
            selectedBtn=btn;
            selectedBtn.backgroundColor=[UIColor  clearColor];
            
            
            [UIView animateWithDuration:0.3 animations:^{
                moveline.frame=CGRectMake(pmW/titleArray.count*2, CGRectGetMaxY(levelView.frame)-2, pmW/titleArray.count, 1);
            }];
            
            [_changeDel changeTap:3];
        }
            break;
        case 103:
        {
            
            selectedBtn.selected=NO;
            btn.selected=YES;
            selectedBtn=btn;
            selectedBtn.backgroundColor=[UIColor  clearColor];
            
            
            [UIView animateWithDuration:0.3 animations:^{
                moveline.frame=CGRectMake(pmW/titleArray.count*3, CGRectGetMaxY(levelView.frame)-2, pmW/titleArray.count, 1);
            }];
            
            [_changeDel changeTap:1];
        }
            break;
        default:
            break;
    }
    
    
    
}
@end
