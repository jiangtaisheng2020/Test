//
//  DayTopicTableView.m
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "DayTopicTableView.h"
#import "DayTopicModel.h"
#import "DayTopicFramModel.h"
#import "AppDelegate.h"


@implementation DayTopicTableView

{
    
    NSMutableArray * _dataArr;
    NSMutableArray * _contestArr;
    
    UIButton * _morePLBtn;
    
    NSIndexPath * _indexPath;//记录点击的评论行数
    DayTopicFramModel * _topicFramModel;
    CGRect cellTableFram;
    CGFloat pmH;
    CGFloat pmW;
    
    UIView * allTopView;
    
    NSString * _titleStr;
    
    DayTopicADView * _adView;
    DayTopicTBCContestView * contestV;
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self creatTab];
        self.dataSource = self;
        self.delegate = self;
        self.scrollsToTop = YES;
//        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tableScr:) name:UIKeyboardWillShowNotification object:nil];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tableEndScr:) name:UIKeyboardWillHideNotification object:nil];
    }
    
    return self;
}

-(void)creatTab
{
    _dataArr = [[NSMutableArray alloc]init];
    _contestArr = [[NSMutableArray alloc]init];
   
    pmW = [UIScreen mainScreen].bounds.size.width;
    pmH = [UIScreen mainScreen].bounds.size.height;
    
    
    _adView = [[DayTopicADView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 140)];
    _adView.delegate = self;
    
    allTopView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 140)];
    [allTopView addSubview:_adView];
    
    
//    if ([_titleStr isEqualToString:@"每日话题"])
//    {
//        //广告轮播器
//        NSMutableArray * arr = [NSMutableArray array];
//        for (int i = 1; i<4; i++)
//        {
//            [arr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"banner-%d.jpg",i]]];
//            
//        }
//        [_adView getImgArr:arr];
//        
//    }
//    else
//    {
        //广告轮播器
        NSMutableArray * arr = [NSMutableArray array];
    
        [arr addObject:[UIImage imageNamed:@"banner"]];
        [arr addObject:[UIImage imageNamed:@"bashangcaoyuan_"]];
    
        [_adView getImgArr:arr];
        
        
        contestV = [[DayTopicTBCContestView alloc]init];
        contestV.frame = CGRectMake(0, CGRectGetMaxY(_adView.frame), kScreenWidth, 0);
        contestV.contestDel = self;
        contestV.hidden = YES;
        [allTopView addSubview:contestV];
        
//    }
    
    
    
    
}

/**
 *  刷新数据
 */
-(void)reloadData:(NSMutableArray*)dataArr pageNum:(int)pageNum contestArr:(NSMutableArray*)contestArr titleName:(NSString*)titleName
{
    _dataArr = dataArr;
    
    _contestArr = contestArr;
    _titleStr = titleName;
//    DLog(@"%@",_contestArr);
    if ([_titleStr isEqualToString:@"结伴出行"]||[_titleStr isEqualToString:@"定制旅游"]||[_titleStr isEqualToString:@"景点推荐"]||[_titleStr isEqualToString:@"私人管家"])
    {
        allTopView.frame = CGRectMake(0, 0, kScreenWidth, 140);
    }
    else
    {
        contestV.hidden = NO;
        contestV.frame = CGRectMake(0, CGRectGetMaxY(_adView.frame), kScreenWidth, 30*contestArr.count+32);
        [contestV reloadData:_contestArr];
        allTopView.frame = CGRectMake(0, 0, kScreenWidth, 140+30*contestArr.count+10+32);
    }
    
    self.tableHeaderView = allTopView;
    
    [self reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * idStr = @"dayTopic";
    DayTopicTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idStr];
    if (!cell)
    {
        cell = [[DayTopicTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idStr];
    }
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    DayTopicFramModel * model = _dataArr[indexPath.row];
    [cell configCellWithModel:model indexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    DayTopicFramModel * model = _dataArr[indexPath.row];
    [_tapDelegate tapTableviewCellIndex:indexPath tid:model.showModel.tid];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DayTopicFramModel * model = _dataArr[indexPath.row];

    return model.cellHeight;
}




//监听键盘弹出
-(void)tableScr:(NSNotification*)info
{
    
    NSDictionary * keyBoardDic = info.userInfo;
    //获取键盘显示或者收起的时间
    NSTimeInterval time = [[keyBoardDic objectForKey:UIKeyboardAnimationDurationUserInfoKey]floatValue];
    CGPoint tabContentOffSet = self.contentOffset;
    
    CGRect keybordH = [[keyBoardDic objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    
    
    CGFloat jiaozheng = pmH - cellTableFram.origin.y - (cellTableFram.size.height+70);//70:评论高度，36:foot【更多】高度
    if (_topicFramModel.showModel.replyJSONArr.count>3)
    {
        jiaozheng += 36;
    }
    
    
    
    
    [UIView animateWithDuration:time animations:^{
        
        self.contentOffset = CGPointMake(tabContentOffSet.x, tabContentOffSet.y+keybordH.size.height-jiaozheng);
    }];

}
//监听键盘收起
-(void)tableEndScr:(NSNotification*)info
{
    NSDictionary * keyBoardDic = info.userInfo;
    //获取键盘显示或者收起的时间
    NSTimeInterval time = [[keyBoardDic objectForKey:UIKeyboardAnimationDurationUserInfoKey]floatValue];
    CGPoint tabContentOffSet = self.contentOffset;
    CGFloat jiaozheng = pmH - cellTableFram.origin.y - (cellTableFram.size.height+70);//70:评论高度，36:foot【更多】高度
    if (_topicFramModel.showModel.replyJSONArr.count>3)
    {
        jiaozheng += 36;
    }
    
    CGRect keybordH = [[keyBoardDic objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    
    [UIView animateWithDuration:time animations:^{
        self.contentOffset = CGPointMake(tabContentOffSet.x, tabContentOffSet.y-keybordH.size.height+jiaozheng);
    }];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (_dataArr.count == 0||_dataArr==nil)
    {
        return;
    }
    
    _topicFramModel = _dataArr[_indexPath.row];
    
    if (_topicFramModel.isTapTypePL == NO)
    {
//        if (_dataArr.count!=0)
//        {
        if (_topicFramModel.isShowKeyBoard)
        {
            [self reloadData];
            
            _topicFramModel.isShowKeyBoard = NO;
        }
        
        [self endEditing:YES];
//        }
    }
    else
    {
        _topicFramModel.isTapTypePL = NO;
    }
    
}

#pragma mark 所有代理

#pragma cell代理
-(void)refreshCell:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    DayTopicTableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
    AppDelegate * dele = [UIApplication sharedApplication].delegate;
    
    cellTableFram = [cell.pinlunView convertRect:cell.pinlunView.bounds toView:dele.window];
    
    
    
    _topicFramModel = _dataArr[indexPath.row];
    if (_topicFramModel.isTapTypePL == YES)
    {
        CGPoint tabContentOffSet = self.contentOffset;
        CGFloat jiaozheng = pmH - cellTableFram.origin.y - (cellTableFram.size.height+70);//70:评论高度，36:foot【更多】高度
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.contentOffset = CGPointMake(tabContentOffSet.x, tabContentOffSet.y-jiaozheng);
        }];
    }
    
    
    [self reloadData];
//    [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:NO];
}


//点击作者头像
-(void)topTapUid:(NSString *)uid indexPath:(NSIndexPath *)indexPath
{
    [_tapDelegate tapTopUid:uid indexPath:indexPath];
}
//点击点赞打赏者头像
-(void)dzdsTapUid:(NSString *)uid indexPath:(NSIndexPath *)indexPath
{
    [_tapDelegate tapDzdsUid:uid indexPath:indexPath];
}
//点击评论者头像
-(void)pinlunTapUid:(NSString *)uid indexPath:(NSIndexPath *)indexPath
{
    [_tapDelegate tapPinlunUid:uid indexPath:indexPath];
}
//点击更多评论
-(void)moreTapIndexPath:(NSIndexPath *)indexPath tid:(NSString *)tid
{
    [_tapDelegate tapMoreIndexPath:indexPath tid:tid];
}
//点击打赏
-(void)dzdsTapShang:(NSIndexPath *)indexPath tid:(NSString *)tid ava:(NSString *)ava nickName:(NSString *)nick forward:(NSString *)forward
{
    [_tapDelegate tapDzds:indexPath tid:tid ava:ava nickName:nick forward:forward];
}

#pragma mark 广告代理
/**
 *  点击的是第一个图
 *
 *  @param adNum 数组的第几个
 */
- (void)tapAD:(int)adNum
{
//    DLog(@"%d",adNum);
    [_tapDelegate tapTableviewAD:adNum];
}


#pragma mark 点击分站赛
-(void)contestTap:(NSString *)tid indexPath:(NSIndexPath *)indexPath
{
    [_tapDelegate tapContest:indexPath tid:tid];
}
//点击类别
-(void)contestTopTap:(int)tapNum
{
    [_tapDelegate tapContestTop:tapNum];
}


-(void)imgTap:(NSArray *)imgArray indexPath:(NSIndexPath *)indexPath tapNum:(NSInteger)tapNum
{
    [_tapDelegate tapImg:imgArray tapNum:tapNum];
}
@end
