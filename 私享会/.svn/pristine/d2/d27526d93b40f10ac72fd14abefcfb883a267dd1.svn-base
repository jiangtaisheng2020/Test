//
//  TSProposalTopView.m
//  PrivateShare
//
//  Created by apple2015 on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "TSProposalTopView.h"
@interface TSProposalTopView ()
@property(nonatomic,strong)UIImageView * avatarView;
@property(nonatomic,strong)UILabel * textLable;


@end
@implementation TSProposalTopView

- (instancetype )initWithFrame:(CGRect)frame
{

    if (self=[super initWithFrame:frame]) {
        
        self.backgroundColor=[UIColor whiteColor];
        [self createUI];
    }

    return self;
}


- (void)createUI
{


    self.avatarView =[[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth-75)/2, 25, 75, 130)];
    [self.avatarView setImage:[UIImage imageNamed:@"feedback"]];
    [self addSubview:self.avatarView];
    
    self.textLable =[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.avatarView.frame), kScreenWidth, 80)];
    self.textLable .textAlignment=NSTextAlignmentCenter;
    self.textLable .font=[UIFont systemFontOfSize:17];
    self.textLable.numberOfLines=2;
    self.textLable .text=@"我们需要您的建议\n他将成为我们努力改进的方向";
    [self addSubview:self.textLable ];


}
@end
