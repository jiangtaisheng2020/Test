//
//  SYSettingTableView.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYSettingTableView.h"
#import "SYSettinggTableViewCell.h"

@interface SYSettingTableView()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray * dataArray;
}

@end

@implementation SYSettingTableView

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
//    self.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    static NSString * cellID = @"settingCellID";
    
    SYSettinggTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[SYSettinggTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    
    cell.leftLB.text = [dataArray[indexPath.row]objectForKey:@"title"];
    
    if (indexPath.row == 2)
    {
        
        cell.rightLB.text = [dataArray[indexPath.row]objectForKey:@"cache"];
    }
    
    
   
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
    return cell;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_setDel didSeleceCell:indexPath];
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    UIView * baseView = [[UIView alloc]initWithFrame:CGRectMake(12, 100, kScreenWidth-24, 40)];
    
    
    UIButton * logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    logoutBtn.frame = baseView.frame;
    [logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    logoutBtn.backgroundColor = kBlueFontColor;
    logoutBtn.layer.cornerRadius = 3;
    logoutBtn.clipsToBounds = YES;
    [logoutBtn addTarget:self action:@selector(logOut) forControlEvents:UIControlEventTouchUpInside];
    [baseView addSubview:logoutBtn];
    
    
    return baseView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 200;
}




#pragma mark - Private methods
-(void)logOut
{
    [_setDel logOut];
}


@end
