//
//  LXCustomController.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXCustomController.h"
#import "TSCustomizedCell.h"
#import "LeavingMessageView.h"
#import "LXNetRequest.h"
#import "CustomizedModel.h"
#import "SYH5ViewController.h"
#import "MJRefresh.h"

@interface LXCustomController ()<UITableViewDataSource,UITableViewDelegate,LeavingMessageViewDelegate>
{

  BOOL  _isUpDate;
}
@property(nonatomic,strong)UITableView *   tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;
@property(nonatomic,strong)LeavingMessageView * messageView;
@end

@implementation LXCustomController


#pragma mark - Life cycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createUI];
    [self loadNetData];
    
    

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
}
- (void)viewWillDisappear:(BOOL)animated
{

    [super viewWillDisappear:animated];
}


- (void)viewDidAppear:(BOOL)animated
{
   
    [super viewDidAppear:animated];

}

- (void)viewDidDisappear:(BOOL)animated
{

    [super viewDidDisappear:animated];
}

-(NSMutableArray *)dataSource
{
    if (_dataSource==nil) {
        _dataSource= [NSMutableArray arrayWithCapacity:0];
    }
    
    return _dataSource;
    
}


#pragma mark - Interface

#pragma mark - Loading data

- (void)loadNetData
{
  
    NSString * urlString= @"http://www.xilexuan.com/purchase.gsp?method=comms4Shop&shopId=2200563595&pageNum=1&pageSize=100&sort=posttime";
    [LXNetRequest postWithUrlString:urlString withParam:nil success:^(NSDictionary *responseDic) {
        NSArray * commItemList =responseDic[@"commItemList"];
        if (commItemList.count>0) {
            [self.dataSource removeAllObjects];
        }
        for (NSDictionary * dic in commItemList) {
            CustomizedModel * model =[CustomizedModel mj_objectWithKeyValues:dic];
            [self.dataSource addObject:model];
        }
        [_tableView.mj_header endRefreshing];
        [_tableView.mj_footer endRefreshing];
        _isUpDate=NO;
        [_tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}


#pragma mark - Create view

- (void)createUI
{
    UITableView * tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kSCreenViewY, kScreenWidth, kScreenHeight-kSCreenViewY-49) style:UITableViewStylePlain];
    tableView.delegate =self;
    tableView.dataSource=self;
    self.tableView=tableView;
    [self.view addSubview:self.tableView];
    UILabel *  titleLable =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    titleLable.textAlignment=NSTextAlignmentCenter;
    titleLable.font=[UIFont systemFontOfSize:17];
    titleLable.textColor =[UIColor colorWithRed:0/255.0 green:129/255.0 blue:204/255.0 alpha:1];
    titleLable.text = @"优质推荐路线";
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLable.frame), kScreenWidth, 1)];
    lineView.backgroundColor =[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1];
    [titleLable addSubview:lineView];
    
    self.tableView.tableHeaderView =titleLable;
    self.messageView =[[LeavingMessageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];
    self.messageView.delegate=self;
    self.tableView.tableFooterView =self.messageView;
    
    
    _tableView.mj_header=  [MJRefreshStateHeader headerWithRefreshingBlock:^{
        if (!_isUpDate)
        {
         
            [self loadNetData];
            
        }
        else
        {
            [_tableView.mj_header endRefreshing];
        }
    }];

}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    CustomizedModel * model = self.dataSource[indexPath.row];
    TSCustomizedCell * cell=[TSCustomizedCell cellWithTableView:tableView];
    [cell config:model];
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomizedModel * model=self.dataSource[indexPath.row];
    SYH5ViewController * vc=[[SYH5ViewController alloc]init];
    vc.urlSting=[NSString stringWithFormat:@"http://www.xilexuan.com/purchase.fo?method=detail&commId=%@",model.commId];
    vc.titleName=@"商品详情";
    [self.navigationController pushViewController:vc animated:YES];

    
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    CustomizedModel * model =self.dataSource[indexPath.row];
   CGSize size =[model.name boundingRectWithSize:CGSizeMake(kScreenWidth-24-50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    
    return 176.0+size.height;
}


#pragma mark - SystemDelegate

#pragma mark - CustomDelegate

- (void)setFormMessage:(NSString *)textString
{
    if (textString.length>0) {
        NSLog(@"--------------%@",textString);
        [self leavingMesssage:textString];
    }else{
        //呼叫管家
        [self callAction];
    }
}

- (void)callAction{
    NSString *number = @"4008789736";// 此处读入电话号码
//     NSString *num = [[NSString alloc]initWithFormat:@"tel://%@",number]; //number为号码字符串 如果使用这个方法结束电话之后会进入联系人列表
    NSString *num = [[NSString alloc]initWithFormat:@"telprompt://%@",number]; //而这个方法则打电话前先弹框 是否打电话 然后打完电话之后回到程序中 网上说这个方法可能不合法 无法通过审核
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]]; //拨号
}

- (void)leavingMesssage:(NSString *)text
{
    NSString * urlString=[NSString stringWithFormat:@"http://wechat.xunbao178.com/goddess/badminton?method=elopeLeaveMsg&company=%@&client=%@&isAppClient=1&code=%@&website=%@",kSXHCompany,kAPPName,[[NSUserDefaults standardUserDefaults]objectForKey:@"token"],kAPPName];
    NSDictionary * dic =@{@"msg":text};
    [LXNetRequest postWithUrlString:urlString withParam:dic success:^(NSDictionary *responseDic) {
        NSLog(@"%@",responseDic);
        NSInteger r =[responseDic[@"r"]integerValue];
        if (r==200) {
            
            UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:@"提示" message:@"留言成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
        }else{
        
            UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:@"提示" message:@"留言失败" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
        }
        
    } failure:^(NSError *error) {
        
    }];

}

- (void)keyboardHeight:(CGFloat)height
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = self.tableView.frame;
        rect.origin.y = kSCreenViewY;
        rect.size.height = self.view.frame.size.height - height - kSCreenViewY;
        self.tableView.frame = rect;
    }];

    if (self.tableView.contentSize.height > self.tableView.frame.size.height)
    {
        CGPoint offset = CGPointMake(0, self.tableView.contentSize.height - self.tableView.frame.size.height);
        [self.tableView setContentOffset:offset animated:NO];
    }

}
#pragma mark - Observer

#pragma mark - Enent response

#pragma mark - Private methods

#pragma mark - Setter and getter
@end
