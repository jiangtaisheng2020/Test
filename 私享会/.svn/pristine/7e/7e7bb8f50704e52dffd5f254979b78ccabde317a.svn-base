//
//  DayTopicTBCTopView.m
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "DayTopicTBCTopView.h"
#import "LXRichTextView.h"

@interface DayTopicTBCTopView () <LXRichTextViewDelegate>

@property (nonatomic,strong) UIButton * avaBtn;//头像

@property (nonatomic,strong) UILabel  * nickNameLb;//昵称

@property (nonatomic,strong) UILabel  * timeLb;//时间

@property (nonatomic,strong) UILabel  * typeLB;//奖励类型

@property (nonatomic,strong) LXRichTextView  * desLB;//文字

@property (nonatomic,strong) UIImageView * clockImgView;//闹钟图

@end

@implementation DayTopicTBCTopView
{
    NSString * _uid;
    CGFloat _nickNameLbFont;
    CGFloat _timeLbFont;
    CGFloat _desLBFont;
    
    NSIndexPath * _indexPath;
    
    
    
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self creatUI];
        
    }
    
    return self;
}

-(void)creatUI
{
    float corner = 24;
    self.avaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.avaBtn.layer.cornerRadius = corner/2;
    
    self.avaBtn.clipsToBounds = YES;
    [self.avaBtn addTarget:self action:@selector(clickAva:) forControlEvents:UIControlEventTouchUpInside];
    
    _nickNameLbFont = 14;
    self.nickNameLb = [[UILabel alloc]init];
    self.nickNameLb.font = [UIFont systemFontOfSize:_nickNameLbFont];
    self.nickNameLb.textColor = Color(236, 68, 64);
    
    
    _timeLbFont = 12;
    self.timeLb = [[UILabel alloc]init];
    self.timeLb.font = [UIFont systemFontOfSize:_timeLbFont];
    self.timeLb.textColor = Color(200, 200, 200);
    
    
    
    
    self.clockImgView = [[UIImageView alloc]init];
    self.clockImgView.image = [UIImage imageNamed:@"time"];
    [self addSubview:self.clockImgView];
    
    _desLBFont = 12;
    
    LXRichTextView *desLB = [[LXRichTextView alloc] initWithFrame:self.bounds];
    desLB.font = [UIFont systemFontOfSize:_desLBFont];
    desLB.textColor = kBlackFontColor;
    desLB.delegage = self;
    [self addSubview:desLB];
    self.desLB = desLB;
    
    
    
    
    
    [self addSubview:self.avaBtn];
    [self addSubview:self.nickNameLb];
    [self addSubview:self.typeLB];
    [self addSubview:self.desLB];
    [self addSubview:self.timeLb];
    
    
}
-(void)getmodel:(DayTopicFramModel*)model indexPath:(NSIndexPath*)indexPath
{
    _indexPath = indexPath;
    _uid = model.showModel.uid;
    
    
    CGFloat pmW = self.frame.size.width;
    //头像
    float corner = 24;
    self.avaBtn.frame = CGRectMake(0, 0, corner, corner);
    
    [self.avaBtn sd_setImageWithURL:[NSURL URLWithString:model.showModel.avatar] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"AppIcon.png"]];
    
    
    
    
    //昵称
    CGFloat nickNameW;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] init];
    
    if ([model.showModel.top intValue]==1)
    {
        nickNameW = model.showModel.author.length*(_nickNameLbFont+1)+40;
        NSAttributedString *substring1 = [[NSAttributedString alloc] initWithString:model.showModel.author];
        [string appendAttributedString:substring1];
        
        NSTextAttachment *attachment2 = [[NSTextAttachment alloc] init];
        attachment2.image = [UIImage imageNamed:@"stickied"];
        attachment2.bounds = CGRectMake(4, -2, 36, 15);
        NSAttributedString *subtring4 = [NSAttributedString attributedStringWithAttachment:attachment2];
        [string appendAttributedString:subtring4];
    }
    else
    {
        nickNameW = model.showModel.author.length*(_nickNameLbFont+1);
        
        NSAttributedString *substring1 = [[NSAttributedString alloc] initWithString:model.showModel.author];
        [string appendAttributedString:substring1];
    }
    
    self.nickNameLb.frame = CGRectMake(CGRectGetMaxX(self.avaBtn.frame)+12, 0, nickNameW, 12);
    
    // 富文本用法3 - 图文混排
    
    
    self.nickNameLb.attributedText = string;
    
    //时间
    CGFloat timeW = [self calculateLabelighWithText:model.showModel.createTime withMaxSize:CGSizeMake(pmW-CGRectGetMaxX(self.nickNameLb.frame), MAXFLOAT) withFont:_timeLbFont].width;
    self.timeLb.frame = CGRectMake(pmW-8-timeW, 0, model.showModel.createTime.length*(_timeLbFont+1), _timeLbFont);
    self.timeLb.text = model.showModel.createTime;
    
    
    
    self.desLB.frame = CGRectMake(CGRectGetMaxX(self.avaBtn.frame)+12, CGRectGetMaxY(self.nickNameLb.frame)+5, pmW-12-CGRectGetMaxX(self.avaBtn.frame), model.topViewDesFram.size.height);
    self.desLB.text = model.showModel.showContent;
    //闹钟
    float jianju = 5;
    float clock = 12;
    self.clockImgView.frame = CGRectMake(CGRectGetMinX(self.timeLb.frame)-jianju-clock, 0, clock, clock);
    
    
}

/**
 *  点击头像
 *
 *  @param btn 自己头像
 */
-(void)clickAva:(UIButton*)btn
{
    [_delegate topTap:_uid indexPath:_indexPath];
}

- (void)richTextView:(LXRichTextView *)view touchBeginRun:(LXRichTextBaseRun *)run
{
    DeLog(@"touchBeginRun");
}

- (void)richTextView:(LXRichTextView *)view touchEndRun:(LXRichTextBaseRun *)run
{
    DeLog(@"touchEndRun");
}

@end
