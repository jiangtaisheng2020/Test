//
//  TSCustomizedCell.m
//  PrivateShare
//
//  Created by apple2015 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "TSCustomizedCell.h"
#import "CustomizedModel.h"
@interface TSCustomizedCell ()
@property(nonatomic,strong)UIImageView * bannerView;
@property(nonatomic,strong)UILabel * titleLable;
@property(nonatomic,strong)UILabel * priceLable;
@property(nonatomic,strong)UIButton * purchaseBtn;
@property(nonatomic,strong)UIView  * bottView;
@end
@implementation TSCustomizedCell


+(instancetype)cellWithTableView:(UITableView *)tableView
{
    NSString * ID =@"TSCustomizedCell";
    TSCustomizedCell * cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        
        cell =[[TSCustomizedCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor =kBackGroundColor;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }

    return cell;
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self creatUI];
    }

    return self;
}

- (void)creatUI
{

    self.bannerView=[[UIImageView  alloc]initWithFrame:CGRectMake(12, 10, kScreenWidth-24, 130)];
    [self.contentView addSubview:self.bannerView];
    
    UIView * bottView=[[UIView alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(self.bannerView.frame), kScreenWidth-24, 50)];
    bottView.backgroundColor=[UIColor whiteColor];
    self.bottView=bottView;
    [self.contentView addSubview:bottView];
    
    self.titleLable =[[UILabel alloc]initWithFrame:CGRectMake(5, 8,self.width-60 , 14)];
    self.titleLable.textAlignment=NSTextAlignmentLeft;
    self.titleLable.numberOfLines=0;
    self.titleLable.font=[UIFont systemFontOfSize:14];
    self.titleLable.textColor=[UIColor colorWithRed:52/255.0 green:52/255.0 blue:52/255.0 alpha:1];
    [bottView addSubview:self.titleLable];
 
    self.priceLable =[[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.titleLable.frame)+4, 200, 14)];
    self.priceLable.textAlignment=NSTextAlignmentLeft;
    self.priceLable.font=[UIFont systemFontOfSize:14];
    self.priceLable.textColor=[UIColor colorWithRed:239/255.0 green:68/255.0 blue:84/255.0 alpha:1];
    [bottView addSubview:self.priceLable];
    
    self.purchaseBtn =[[UIButton alloc]init];
    self.purchaseBtn.frame=CGRectMake(bottView.frame.size.width-40,  0, 40, 40);
    [self.purchaseBtn setBackgroundImage:[UIImage imageNamed:@"buy_bg"] forState:UIControlStateNormal];
    [self.purchaseBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    self.purchaseBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    self.purchaseBtn.titleLabel.numberOfLines =2;
    [self.purchaseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bottView addSubview:self.purchaseBtn];

}
- (void)config:(CustomizedModel *)model
{
    _model=model;
    [self.bannerView sd_setImageWithURL:[NSURL URLWithString:model.imagePath] placeholderImage:[UIImage imageNamed:@"banner"]];
    self.titleLable.text =model.name;
    self.priceLable.text= [NSString stringWithFormat:@"¥ %0.2f",model.price];


}
- (void)layoutSubviews
{
    CGSize size =[_model.name boundingRectWithSize:CGSizeMake(kScreenWidth-24-50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    
    self.titleLable.frame = CGRectMake(5, 8,size.width, size.height);
    self.priceLable.frame =CGRectMake(5, CGRectGetMaxY(self.titleLable.frame)+4, 200, 14);
    self.bottView.frame=CGRectMake(12, CGRectGetMaxY(self.bannerView.frame), kScreenWidth-24, 36+size.height);

}
@end
