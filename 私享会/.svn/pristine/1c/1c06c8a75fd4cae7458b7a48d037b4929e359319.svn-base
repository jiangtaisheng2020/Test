//
//  SYMyInfoTableView.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYMyInfoTableView.h"
#import "SYMyInfoTableViewCell.h"
@interface SYMyInfoTableView()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray * dataArray;
}

@end

@implementation SYMyInfoTableView

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
    [self reloadData];
}



#pragma mark - UITableViewDelegate
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"myInfo";
    SYMyInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[SYMyInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.titleLable.text = [[dataArray[indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"title"];
    if (indexPath.row == 0 && indexPath.section == 0)
    {
        //需要头像
        NSData * avatar = [[dataArray[indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"detail"];
        UIImage * image = [UIImage imageWithData:avatar];
        cell.avatar.image = image;
        
    }
    
    
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray[section] count];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}



-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 14;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_myInfoDel didSelectIndexPath:indexPath];
}
#pragma mark - Private methods

@end
