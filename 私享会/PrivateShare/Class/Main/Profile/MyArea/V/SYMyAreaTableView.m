//
//  SYMyAreaTableView.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYMyAreaTableView.h"
@interface SYMyAreaTableView ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray * data;
}


@end

@implementation SYMyAreaTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        //        data  = [NSArray array];
        [self creatUI];
        
    }
    
    return self;
    
}

-(void)creatUI
{
    self.tableFooterView = [[UIView alloc]init];
    self.delegate = self;
    self.dataSource = self;
}


-(void)loadDataArray:(NSArray*)dataArray
{
    data = [NSArray arrayWithArray:dataArray];
    [self reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return data.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * city = @"city2";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:city];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:city];
    }
    
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    
    switch (self.chooseType) {
        case Provience:
        {
            cell.textLabel.text = [data[indexPath.row]objectForKey:@"state"];
        }
            break;
        case City:
        {
            cell.textLabel.text = [data[indexPath.row]objectForKey:@"city"];
        }
            break;
        case County:
        {
            cell.textLabel.text = data[indexPath.row];
        }
            break;
            
        default:
            break;
    }
    
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (self.chooseType) {
        case Provience:
        {
            NSArray * arr = [data[indexPath.row]objectForKey:@"cities"];
            NSString * provienceStr = [data[indexPath.row]objectForKey:@"state"];
            
            [_cityDelegate cityChooseNext:arr chooseStr:provienceStr];
            
            
        }
            break;
        case City:
        {
            NSArray * arr = [data[indexPath.row]objectForKey:@"areas"];
            NSString * cityStr = [data[indexPath.row]objectForKey:@"city"];
            [_cityDelegate cityChooseNext:arr chooseStr:cityStr];
        }
            break;
        case County:
        {
            NSString * county = data[indexPath.row];
            [_cityDelegate cityChooseNext:nil chooseStr:county];
            
        }
            break;
            
        default:
            break;
    }
    
    
}


@end
