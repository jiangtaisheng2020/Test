//
//  DayTopicTBCPinLunView.m
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "DayTopicTBCPinLunView.h"
#import "UIView+Extension.h"



@implementation DayTopicTBCPinLunView
{
    NSMutableArray * _dataArr;
    
    UIView * _pinlunView;
    UITextField * _pinlunTextView;
    DayTopicFramModel *_frameModel;
    CGFloat viewW;
    NSIndexPath * _indexPath;
    
    NSString * _tid;
    NSString * _aid;
    NSString * _ordid;
    NSString * _fid;
    
    BOOL isHuiFu;
}


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        self.dataSource = self;
        self.delegate = self;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.scrollEnabled = NO;
        _dataArr = [[NSMutableArray alloc]init];
        viewW = self.frame.size.width;
        [self creatUI];
        
        
        
    }
    return self;
}


-(void)creatUI
{
    CGFloat pinlunTextViewH = 26;
    CGFloat pAndBJianJu = 5;
    CGFloat btnH = 23;
    CGFloat bAndAllJianJu = 8;
    CGFloat bAndbJianJu = 5;
    CGFloat btnW = 50;
    
    _pinlunView = [[UIView alloc]initWithFrame:CGRectMake(21, 0, viewW-21-8, pinlunTextViewH+pAndBJianJu+btnH+bAndAllJianJu+10)];
    
    //评论输入框
    _pinlunTextView = [[UITextField alloc]initWithFrame:CGRectMake(21, 10, _pinlunView.frame.size.width, pinlunTextViewH)];
    _pinlunTextView.borderStyle = UITextBorderStyleRoundedRect;

    
    //取消按钮
    UIButton * cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancleBtn.frame = CGRectMake(viewW-8-bAndbJianJu-btnW*2, CGRectGetMaxY(_pinlunTextView.frame)+pAndBJianJu, btnW, btnH);
    cancleBtn.backgroundColor = Color(204, 204, 204);
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancleBtn.layer.cornerRadius = 5;
    cancleBtn.clipsToBounds = YES;
    [cancleBtn addTarget:self action:@selector(cancleSend) forControlEvents:UIControlEventTouchUpInside];
    
    //发送按钮
    UIButton * sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sendBtn.frame = CGRectMake(viewW-8-btnW, CGRectGetMaxY(_pinlunTextView.frame)+pAndBJianJu, btnW, btnH);
    [sendBtn setTitle:@"发表" forState:UIControlStateNormal];
    sendBtn.backgroundColor = Color(0, 168, 255);
    [sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sendBtn.layer.cornerRadius = 5;
    sendBtn.clipsToBounds = YES;
    [sendBtn addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    
    
//    [self addSubview:_pinlunView];
    [_pinlunView addSubview:_pinlunTextView];
    [_pinlunView addSubview:cancleBtn];
    [_pinlunView addSubview:sendBtn];
    
    

    
}
/**
 *  取消回复
 */
-(void)cancleSend
{
    DeLog(@"取消回复");
    [self keybordMiss];
}
/**
 *  回复
 */
-(void)send
{
    #warning 需要修改请求
//    NSString * urlH = [NSString stringWithFormat:@"%@%@%@",XB178Path,GoodessPath,ReplyTopicPath];
//    NSString * pram;
//    if (isHuiFu == YES)//回复楼层
//    {
//        pram = [NSString stringWithFormat:@"&tid=%@&aid=%@&content=%@&fid=%@&mode=refer",_tid,_aid,_pinlunTextView.text,_fid];
//    }
//    else//回复楼主
//    {
//        pram = [NSString stringWithFormat:@"&tid=%@&aid=%@&content=%@&fid=%@&mode=reply",_tid,_aid,_pinlunTextView.text,_fid];
//    }
//    NSString * token = [[NSUserDefaults standardUserDefaults]objectForKey:XLXUserToken];
//    NSString * other = [NSString stringWithFormat:@"%@%@",XLParaPath,token];
//    NSString * urlStr = [NSString stringWithFormat:@"%@%@%@",urlH,pram,other];
//    NSString * urlString = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL * url = [NSURL URLWithString:urlString];
//    
//
//    [JTSNetRequest getWithParam:url withBody:nil success:^(NSDictionary *responseDic)
//    {
//        
//        
//        if ([responseDic[@"r"]intValue]==200)
//        {
//            DLog(@"成功回复：：：%@",responseDic);
//            //回复成功
//            UIAlertView * aler = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"评论%@",XLXTipFixSuccess] message:nil delegate:nil cancelButtonTitle:XLXTipNetSure otherButtonTitles:nil];
//            [aler show];
//            [aler dismissWithClickedButtonIndex:0 animated:YES];
//        }
//        else
//        {
//            DLog(@"失败回复：：：%@",responseDic);
//            //回复失败
//            UIAlertView * aler = [[UIAlertView alloc]initWithTitle:XLXTipFixFail message:responseDic[@"r"] delegate:nil cancelButtonTitle:XLXTipNetSure otherButtonTitles:nil];
//            [aler show];
//        }
//        [self keybordMiss];
//        
//    } failure:^(NSError *error)
//    {
//
//        DLog(@"网络失败：：：：%@",error.description);
//        UIAlertView * aler = [[UIAlertView alloc]initWithTitle:XLXTipNetFail message:nil delegate:nil cancelButtonTitle:XLXTipNetSure otherButtonTitles:nil];
//        [aler show];
//        [self keybordMiss];
//        
//    }];
    
    
}


-(void)getmodel:(DayTopicFramModel*)model indexPath:(NSIndexPath*)indexPath
{
    
    _indexPath = indexPath;
    _frameModel = model;
    _pinlunView.y = 0;
    
    
    [_dataArr setArray:model.showModel.replyJSONArr];
    

    
    if (model.isTapTypePL == YES)
    {
        _tid = model.showModel.tid;
        _aid = model.showModel.aid;
        //此处没有fid
        _pinlunTextView.placeholder = [NSString stringWithFormat:@"回复:%@",model.showModel.author];
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num = 3;
    if (_dataArr.count<=3)
    {
        num = _dataArr.count;
    }
    return num;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return _pinlunView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DayTopicPLModel * model = _dataArr[indexPath.row];
    _fid = model.fid;
    _tid = _frameModel.showModel.tid;
    _aid = _frameModel.showModel.aid;
    _frameModel.isTapTypePL = NO;
    isHuiFu = YES;
    
    _pinlunTextView.placeholder = [NSString stringWithFormat:@"回复:%@",model.username];
    
    _frameModel.isShowKeyBoard = YES;
    [_plDelegate pinlunTap:indexPath];
    [_pinlunTextView becomeFirstResponder];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * pinlun = @"pinlun";
    DayTopicPinlunTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:pinlun];
    if (!cell)
    {
        cell = [[DayTopicPinlunTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:pinlun];
    }
    
    cell.row = indexPath.row;
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = kBackGroundColor;
    DayTopicPLModel * model = _dataArr[indexPath.row];
    [cell configCellWithModel:model indexPath:indexPath];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 49;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (_frameModel.isShowKeyBoard)
    {
        return 70;
    }
    
    return 0;
}




-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self keybordMiss];
}

//收起键盘
-(void)keybordMiss
{
    _pinlunTextView.text = @"";
    [_pinlunTextView resignFirstResponder];
    [_plDelegate pinlunAreadyTap:_indexPath];
}

#pragma cell代理
-(void)pinlunAvaTap:(NSInteger)row
{
    DayTopicPLModel * model = _dataArr[row];
    [_plDelegate pinlunAvaTap:_indexPath smllRow:row uid:model.uid];
}



@end
