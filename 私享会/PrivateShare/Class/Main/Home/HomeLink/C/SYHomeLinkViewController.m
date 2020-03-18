//
//  SYHomeLinkViewController.m
//  PrivateShare
//
//  Created by bean on 16/9/21.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "SYHomeLinkViewController.h"
#import "SYH5ViewController.h"
#import "DayTopicTableView.h"
#import "DayTopicFramModel.h"

#import "MJRefresh.h"
#import "SYShowImgView.h"


@interface SYHomeLinkViewController ()<DayTopicTableViewTapDelegete>
{
    DayTopicTableView * _tab;
    BOOL _isUpDate;
    int _indexPage;
    NSMutableArray * showArr;
    
    NSMutableArray * yqqContestArr;
    int _totalPage;
//    int type;
    BOOL isFirst;
    SYShowImgView * beanShowImgV;
}


@end

@implementation SYHomeLinkViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleStr = self.titleName;
    [self leftImageNormalStr:@"go_back_on" withAction:@selector(back)];
    
    _tab = [[DayTopicTableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
    _tab.tapDelegate = self;
    _tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    isFirst = YES;
    [self.view addSubview:_tab];
    _indexPage = 1;
    _totalPage = 1;
    showArr = [[NSMutableArray alloc]init];//需要显示的数组
    yqqContestArr = [[NSMutableArray alloc]init];//显示上面分站赛的数组
    [self loadData:_indexPage];
    
    self.HUD.label.text = @"加载中";
    [_tab addSubview:self.HUD];
    
    //添加上拉下拉刷新
    if (![self.titleStr isEqualToString:@"首页"])
    {
        _tab.mj_header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
            if (!_isUpDate)
            {
                _isUpDate=!_isUpDate;
                _indexPage=1;
                
                [self loadData:_indexPage];
            }
            else
            {
                [_tab.mj_header endRefreshing];
            }
        }];
    }
    _tab.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        if (!_isUpDate)
        {
            _isUpDate=!_isUpDate;
            _indexPage+=1;
            [self loadData:_indexPage];
        }
    }];
}


//加载数据
-(void)loadData:(int)page
{
#warning 需要修改请求
    [self.HUD showAnimated:YES];
    if (page==1&&showArr.count!=0)
    {
        [showArr removeAllObjects];
    }
    if (page!=1)
    {
        isFirst = NO;
    }
    if (_totalPage < page)
    {
        [_tab.mj_footer endRefreshing];
        [_tab.mj_header endRefreshing];
        [_tab.mj_footer setState:MJRefreshStateNoMoreData];
        [self hudHideTextStr:@"加载完成" delayTime:2.0];
        return;
    }
    
    
#pragma 需要修改请求
    
//    NSString * urlH = [NSString stringWithFormat:@"%@%@%@",kSXHHttpPath,kSXHGoddessPath,kSXHDayTopicPath];
//    NSString * method = [NSString stringWithFormat:@"%@&nowpage=%d",kSXHDayTopicPath,page];
    NSString * token = [[NSUserDefaults standardUserDefaults]objectForKey:kUDToken];
//    NSString * other = [NSString stringWithFormat:@"%@%@&tagid=%@&type=%d",kSXHParaPath,token,self.orgID,self.type];
//    NSString * urlStr = [NSString stringWithFormat:@"%@%@%@",urlH,method,other];
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",@"http://wechat.xunbao178.com/goddess/forumservlet?method=getTopicListByTagid&aid=66&nowpage=1&m=wechat&client=IOSYQQAPP&company=WEIXIN_APP_YQQ&tagid=110020&type=0&code=",token];
    
    
    
    
    [LXNetRequest getWithUrlString:urlStr withParam:nil success:^(NSDictionary *responseDic)
     {
         NSDictionary * dic = responseDic;
         if ([dic[@"r"]intValue] == 200)
         {
             [self hudHideTextStr:@"加载完成" delayTime:2.0];
             NSString * items = dic[@"items"];//所有需要的数据
             NSArray * itemArr = [self arrayWithString:items];
             _totalPage = [dic[@"totalPage"]intValue];//总页数
             //            DLog(@"+++++++++++++++++++++++++++++++%d",_totalPage);
             for (NSDictionary * infoDic in itemArr)
             {
                 DayTopicFramModel * framModel = [[DayTopicFramModel alloc]init];
                 DayTopicModel * topicModel = [[DayTopicModel alloc]init];
                 //                _totalPage = [infoDic[@"totalPage"]intValue];//总页数
                 //--------------顶部视图所需-------------
                 topicModel.uid = infoDic[@"uid"];//用户id
                 topicModel.author = infoDic[@"author"];//作者
                 topicModel.createTime = infoDic[@"createTime"];//发帖时间[用这个]
                 topicModel.avatar = infoDic[@"avatar"];//个人头像
                 topicModel.tid = infoDic[@"tid"];//帖子id
                 
                 NSString * extra = infoDic[@"extra"];//要转
                 NSDictionary * extraDic = [self arrayWithString:extra];//拓展字段
                 topicModel.prize = [NSString stringWithFormat:@"%d",[extraDic[@"prize"]intValue]];//喜乐奖多少元【注:如果是8->12】
                 topicModel.pingyou = [NSString stringWithFormat:@"%d",[extraDic[@"pingyou"]intValue]];//评论【注:大于0是优帖子】
                 NSString * content = infoDic[@"content"];//帖子内容

                 topicModel.title = infoDic[@"title"];//置顶帖子标题
                 if (content.length<=64)
                 {
                     topicModel.content = content;
                 }
                 else
                 {
                     topicModel.content = [NSString stringWithFormat:@"%@...",[content substringToIndex:60]];
                 }
                 
                 //--------------图片或视频视图所需-------------
                 topicModel.videos = [NSString stringWithFormat:@"%d",[infoDic[@"videos"]intValue]];//是否有视频
                 topicModel.firstImg = infoDic[@"firstImg"];//视频图
                 topicModel.imgList = infoDic[@"imgList"];//发帖图片数组
                 
                 //--------------帖子类型和点赞打赏视图所需-------------

                 NSArray * tagJSONArray = infoDic[@"tagJSONArray"];
                 if ([infoDic[@"type"]intValue]==14)
                 {
                     topicModel.tagname = @"签到";
                 }
                 else if ([infoDic[@"type"]intValue]==15)
                 {
                     topicModel.tagname = @"踩楼";
                 }
                 else if ([infoDic[@"type"]intValue]==16)
                 {
                     topicModel.tagname = @"分享";
                 }
                 else if ([infoDic[@"type"]intValue]==17)
                 {
                     topicModel.tagname = @"话题";
                 }
                 else if (tagJSONArray.count!=0)
                 {
                     for (NSDictionary * tagDic in tagJSONArray)
                     {
                         NSString * tagname = tagDic[@"tagname"];//帖子类型[运动]
                         if (![tagname isEqualToString:@"每日话题"])
                         {
                             topicModel.tagname = tagname;
                         }
                     }
                 }
                 topicModel.presentCount = [NSString stringWithFormat:@"%d",[infoDic[@"presentCount"]intValue]];//打赏数量
                 topicModel.viewNum = [NSString stringWithFormat:@"%d",[infoDic[@"viewNum"]intValue]];//浏览量
                 topicModel.favNum = [NSString stringWithFormat:@"%d",[infoDic[@"favNum"]intValue]];//点赞量
                 topicModel.replyNum = [NSString stringWithFormat:@"%d",[infoDic[@"replyNum"]intValue]];//回复数
                 
                 //--------------点赞视图所需-------------
                 NSArray * shangJSON = infoDic[@"shangJSON"];//点赞数组
                 NSMutableArray * dsArr = [[NSMutableArray alloc]init];
                 for (NSDictionary * favDic in shangJSON)
                 {
                     DayTopicDSModel * model = [[DayTopicDSModel alloc]init];
                     model.uid = favDic[@"uid"];//打赏人id
                     model.avatar = favDic[@"avatar"];//打赏人头像
                     [dsArr addObject:model];
                 }
                 NSArray * favJSON = infoDic[@"favJSON"];//点赞数组
                 NSMutableArray * dzArr = [[NSMutableArray alloc]init];
                 for (NSDictionary * favDic in favJSON)
                 {
                     DayTopicDZModel * model = [[DayTopicDZModel alloc]init];
                     model.avatar = favDic[@"avatar"];//点赞人头像
                     model.uid = favDic[@"uid"];//点赞人id
                     [dzArr addObject:model];
                 }
                 NSDictionary * tagDic = infoDic[@"tagJSON"];//tag数组
                 topicModel.top = [NSString stringWithFormat:@"%d",[tagDic[@"top"] intValue]];//判断是否置顶
                 
                 //--------------回复视图所需-------------

                 topicModel.aid = [NSString stringWithFormat:@"%d",[infoDic[@"aid"]intValue]];//需要
                 NSArray * replyJSONArr = infoDic[@"replyJSON"];//所有回复数组
                 NSMutableArray * plArr = [[NSMutableArray alloc]init];
                 for (NSDictionary * replyDic in replyJSONArr)
                 {
                     DayTopicPLModel * model = [[DayTopicPLModel alloc]init];
                     model.avatar = replyDic[@"avatar"];//回复人头像
                     model.uid = replyDic[@"uid"];//回复人id
                     model.username = replyDic[@"username"];//回复人
                     model.content = replyDic[@"content"];//回复内容
                     model.fid = [NSString stringWithFormat:@"%d",[replyDic[@"fid"]intValue]];//回复楼层的id
                     //                     model.refid = replyDic[@"refid"];//回复楼层中评论的id
                     model.refusername = replyDic[@"refusername"];//回复楼层中评论的人名
                     //                     DLog(@"%@",replyDic);
                     [plArr addObject:model];
                 }
                 [topicModel.shangJSON addObjectsFromArray:dsArr];
                 [topicModel.favJSON addObjectsFromArray:dzArr];
                 [topicModel.replyJSONArr addObjectsFromArray:plArr];
                 framModel.showModel = topicModel;
                 if ([topicModel.top intValue]!=2)
                 {
                     [showArr addObject:framModel];
                 }
                 else
                 {
                     //DLog(@"%@",topicModel.content);
                     if (page == 1&&self.type==0&&isFirst==YES)
                     {
                         [yqqContestArr addObject:framModel];
                     }
                 }
             }
             [_tab reloadData:showArr pageNum:page contestArr:yqqContestArr titleName:self.titleName];
             [_tab.mj_header endRefreshing];
             [_tab.mj_footer endRefreshing];
             _isUpDate=NO;
         }
         else
         {
             [self hudHideTextStr:@"加载失败" delayTime:2.0];
             DeLog(@"请求失败");

         }

     } failure:^(NSError *error)
     {
         [self hudHideTextStr:@"加载失败,请检查网络" delayTime:2.0];
         DeLog(@"%@",error);
     }];
}

- (id)arrayWithString:(NSString *)str
{
    if(str.length<=0)
        return nil ;
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

#pragma mark tableview代理方法
/**
 *  点击某一个cell
 *
 *  @param indexPath 哪一个cell
 */
-(void)tapTableviewCellIndex:(NSIndexPath *)indexPath tid:(NSString*)tid
{
    [self tapTid:tid];
}
/**
 *  点击哪一个广告
 */
-(void)tapTableviewAD:(int)num
{
//    SYH5ViewController * post = [[SYH5ViewController alloc]init];
//    switch (num+1)
//    {
//        case 1:
//        {
//            post.urlSting = @"http://wechat.xunbao178.com/jsp/app.jsp";
//            post.titleName = @"APP下载";
//        }
//            break;
//        case 2:
//        {
//            post.urlSting = @"http://www.xilexuan.com/jsp/activity_weixin/post_activity_sumOfMoney.jsp";
//            post.titleName = @"发布活动";
//        }
//            break;
//        case 3:
//        {
//            post.urlSting = @"http://wechat.xunbao178.com/xile/forum?m=wechat&book=1";
//            post.titleName = @"读书";
//        }
//            break;
//        case 4:
//        {
//            post.urlSting = @"http://wechat.xunbao178.com/jsp/app.jsp";
//            post.titleName = @"APP下载";
//        }
//            break;
//
//        default:
//            break;
//    }
//    [self.navigationController pushViewController:post animated:YES];
//    DeLog(@"点击第%d个广告",num+1);
}
/**
 *  点击作者的头像
 */
-(void)tapTopUid:(NSString *)uid indexPath:(NSIndexPath *)indexPath
{
    
    SYH5ViewController * post = [[SYH5ViewController alloc]init];
    post.urlSting = [NSString stringWithFormat:@"http://wechat.xunbao178.com:80/xile/forum/ta?uid=%@&m=wechat",uid];
    post.titleName = @"个人详情";
    [self.navigationController pushViewController:post animated:YES];
    
    DeLog(@"点击顶部头像链接%@，位置%ld",uid,(long)indexPath.row);
}
/**
 *  点击点赞打赏人的头像
 */
-(void)tapDzdsUid:(NSString *)uid indexPath:(NSIndexPath *)indexPath
{
    
    SYH5ViewController * post = [[SYH5ViewController alloc]init];
    post.urlSting = [NSString stringWithFormat:@"http://wechat.xunbao178.com:80/xile/forum/ta?uid=%@&m=wechat",uid];
    post.titleName = @"个人详情";
    [self.navigationController pushViewController:post animated:YES];
    
    DeLog(@"点击点赞打赏头像链接%@，位置%ld",uid,(long)indexPath.row);
}
/**
 *  点击评论人头像
 */
-(void)tapPinlunUid:(NSString *)uid indexPath:(NSIndexPath *)indexPath
{
    
    SYH5ViewController * post = [[SYH5ViewController alloc]init];
    post.urlSting = [NSString stringWithFormat:@"http://wechat.xunbao178.com:80/xile/forum/ta?uid=%@&m=wechat",uid];
    post.titleName = @"个人详情";
    [self.navigationController pushViewController:post animated:YES];
    DeLog(@"点击评论人头像链接%@，位置%ld",uid,(long)indexPath.row);
}
/**
 *  点击更多评论
 */
-(void)tapMoreIndexPath:(NSIndexPath *)indexPath tid:(NSString *)tid
{
    SYH5ViewController * post = [[SYH5ViewController alloc]init];
    post.urlSting = [NSString stringWithFormat:@"http://wechat.xunbao178.com/xile/thread-%@.html?m=wechat",tid];
    post.titleName = @"个人详情";
    [self.navigationController pushViewController:post animated:YES];
    DeLog(@"点击更多评论链接%@，位置%ld",tid,(long)indexPath.row);
}
/**
 *  点击打赏
 */
-(void)tapDzds:(NSIndexPath *)indexPath tid:(NSString *)tid ava:(NSString *)ava nickName:(NSString *)nick forward:(NSString *)forward
{
    SYH5ViewController * post = [[SYH5ViewController alloc]init];
    post.urlSting = [NSString stringWithFormat:@"http://wechat.xunbao178.com/present.do?method=presentDispather&tid=%@&avator=%@&nickname=%@&forward=%@",tid,ava,nick,forward];
    post.titleName = @"打赏";
    [self.navigationController pushViewController:post animated:YES];
    
    DeLog(@"点击打赏链接%@，位置%ld nick:%@ ava:%@ forward:%@",tid,(long)indexPath.row,nick,ava,forward);
}
/**
 *  不刷新tableView
 */
-(void)tableViewNoRefresh
{
    DeLog(@"刷新个OOOOOO");
    [_tab.mj_footer endRefreshing];
}

/**
 *  点击分段赛
 */
-(void)tapContest:(NSIndexPath *)indexPath tid:(NSString *)tid
{
    [self tapTid:tid];
}
/**
 *  点击类别
 */
-(void)tapContestTop:(int)tapNum
{
    self.type = tapNum-1;
    isFirst = NO;
    _indexPage = 1;
    [self loadData:_indexPage];
}


-(void)tapTid:(NSString*)tapTid
{
    SYH5ViewController * post = [[SYH5ViewController alloc]init];
    post.urlSting = [NSString stringWithFormat:@"http://wechat.xunbao178.com/xile/thread-%@.html?m=wechat",tapTid];
    post.titleName =@"帖子详情";
    [self.navigationController pushViewController:post animated:YES];
    
}

/**
 *  点击放大图片
 */
-(void)tapImg:(NSArray *)imgArr tapNum:(NSInteger)tapNum
{
    //    if (beanShowImgV == nil)
    //    {
    beanShowImgV = [[SYShowImgView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //    }
    
    beanShowImgV.alpha = 0;
    
    
    
    [beanShowImgV getImgArr:imgArr tapNum:tapNum];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissImgShow:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [beanShowImgV addGestureRecognizer:tap];
    [self.view addSubview:beanShowImgV];
    
    [UIView animateWithDuration:1.2 animations:^{
        beanShowImgV.alpha = 1;
    }];
    
    
    
    
}

-(void)dismissImgShow:(UITapGestureRecognizer*)tap
{
    [UIView animateWithDuration:1.0 animations:^{
        beanShowImgV.alpha = 0;
    }completion:^(BOOL finished) {
        [beanShowImgV removeFromSuperview];
    }];
    
}

@end

