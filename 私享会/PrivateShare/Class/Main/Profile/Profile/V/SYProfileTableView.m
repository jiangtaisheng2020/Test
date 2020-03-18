//
//  SYProfileTableView.m
//  PrivateShare
//
//  Created by bean on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYProfileTableView.h"
#import "SYProfileTableViewCell.h"
#import "SYProfileHeaderView.h"


@interface SYProfileTableView()<UITableViewDelegate,UITableViewDataSource,SYProfileHeaderDelegate>
{
    NSMutableArray * dataArray;
}

@end

@implementation SYProfileTableView


#pragma mark - Life cycle
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        dataArray = [NSMutableArray array];
        [self creatUI];
    }
    
    return self;
}
#pragma mark - Create view
-(void)creatUI
{
    self.dataSource = self;
    self.delegate = self;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.tableFooterView = [[UIView alloc]init];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}



#pragma mark - Interface
-(void)loadData:(NSMutableArray*)dataArr
{
    [dataArray setArray:dataArr];
//    NSLog(@"%@",dataArray);
    [self reloadData];
}


#pragma mark - UITableViewDelegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"infoCellID";
    
    SYProfileTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[SYProfileTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.midLB.text = [dataArray[indexPath.row]objectForKey:@"title"];
        
    cell.lfImg.image = [UIImage imageNamed:[dataArray[indexPath.row]objectForKey:@"img"]];
    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
    return cell;
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45+10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_profileDel didSeleceCell:indexPath];
}


-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SYProfileHeaderView * headView = [[SYProfileHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, (134+186+7+30+40)/2)];
    headView.backgroundColor = [UIColor whiteColor];
    headView.proHeaderDel = self;
    
    //需要网络请求的数据
//    UIImageView * imgV = [[UIImageView alloc]init];
//    [imgV sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
//    [headView loadData:imgV];
    return headView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return (134+186+7+30+40)/2;
}


#pragma mark - CustomDelegate
-(void)didSelectAva
{
    [_profileDel didTapEdit];
}





@end
