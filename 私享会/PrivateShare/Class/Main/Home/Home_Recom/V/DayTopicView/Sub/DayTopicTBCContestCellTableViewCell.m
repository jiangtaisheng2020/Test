//
//  DayTopicTBCContestCellTableViewCell.m
//  XLXBadmintoon
//
//  Created by bean on 16/6/27.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "DayTopicTBCContestCellTableViewCell.h"

@interface DayTopicTBCContestCellTableViewCell()
{
    UILabel * contentLB;
//    UIImageView * imgV;
}

@end

@implementation DayTopicTBCContestCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = Color(235, 235, 235);
        [self creatUI];
    }
    
    return self;
}

-(void)creatUI
{
    UIView * baseView = [[UIView alloc]initWithFrame:CGRectMake(12, 9, 12, 12)];
    baseView.backgroundColor = kRedColor;
    baseView.layer.cornerRadius = 1;
    baseView.clipsToBounds = YES;
    [self.contentView addSubview:baseView];
    
    
    UILabel * titleLb = [[UILabel alloc]initWithFrame:CGRectMake(0,0,12,12)];
    titleLb.textColor = [UIColor whiteColor];
    titleLb.font = [UIFont systemFontOfSize:12];
    titleLb.text = @"顶";
    [baseView addSubview:titleLb];
    
    
//    UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 9, 12, 12)];
//    imgView.image = [UIImage imageNamed:@""];
//    imgV = imgView;
//    [self.contentView addSubview:imgV];
    
    UILabel * contentLable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(baseView.frame)+5, 9, kScreenWidth-CGRectGetMaxX(baseView.frame)-15, 16)];
    contentLable.textColor = kBlackFontColor;
    contentLable.font = [UIFont systemFontOfSize:12];
    contentLB = contentLable;
    [self.contentView addSubview:contentLB];
}

-(void)configCellWithModel:(DayTopicFramModel*)model indexPath:(NSIndexPath*)indexPath
{
    contentLB.text = model.showModel.title;
    
    DeLog(@"%@",model.showModel.content);
}

@end
