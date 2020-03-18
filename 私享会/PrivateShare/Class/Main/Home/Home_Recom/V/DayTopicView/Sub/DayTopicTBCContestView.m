//
//  DayTopicTBCContestView.m
//  XLXBadmintoon
//
//  Created by bean on 16/6/27.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "DayTopicTBCContestView.h"
#import "DayTopicFramModel.h"
#import "DayTopicTBCContestCellTableViewCell.h"
#import "SYChangeView.h"
@interface DayTopicTBCContestView()<UITableViewDelegate,UITableViewDataSource,ChangeViewDelegate>
{
    NSMutableArray * _dataArr;
}

@end


@implementation DayTopicTBCContestView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {

        [self creatTopView];
        
        self.scrollEnabled = NO;
        self.dataSource = self;
        self.delegate = self;
        _dataArr = [[NSMutableArray alloc]init];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsHorizontalScrollIndicator = NO;
        
        
    }
    
    return self;
}


-(void)creatTopView
{
    SYChangeView * headView = [[SYChangeView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 32)];
    headView.changeDel = self;
    [headView creatUI:@[@"结伴出行",@"定制旅游",@"景点推荐",@"私人管家"]];
    self.tableHeaderView = headView;
}

-(void)reloadData:(NSMutableArray*)dataArr
{
    [_dataArr setArray:dataArr];
    [self reloadData];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * idStr = @"if";
    DayTopicTBCContestCellTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idStr];
    if (!cell) {
        cell = [[DayTopicTBCContestCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idStr];
    }
    
    DayTopicFramModel * model = _dataArr[indexPath.row];
    [cell configCellWithModel:model indexPath:indexPath];
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * baseV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];
//    baseV.backgroundColor = [UIColor blackColor];
    
    
    UIView * linView = [[UIView alloc]initWithFrame:CGRectMake(0, 9, kScreenWidth, 1)];
    linView.backgroundColor = kLineColor;
    [baseV addSubview:linView];
    
    return baseV;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    DayTopicFramModel * model = _dataArr[indexPath.row];
    [_contestDel contestTap:model.showModel.tid indexPath:indexPath];
    
}


-(void)changeTap:(int)tapNum
{
    [_contestDel contestTopTap:tapNum];
}


@end
