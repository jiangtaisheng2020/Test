//
//  DayTopicFramModel.m
//  DayTopic
//
//  Created by bean on 16/5/18.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "DayTopicFramModel.h"
#import "NSObject+AutoSize.h"

@implementation DayTopicFramModel
{
    CGFloat cellHeightOrigl;
}
- (void)setShowModel:(DayTopicModel *)showModel
{
    _showModel = showModel;
    
    
    CGFloat pmW = [UIScreen mainScreen].bounds.size.width;
    CGFloat topViewDesLabelW = pmW-36-12-12;
    
    
    
    //帖子内容
    CGFloat topViewDesLabelH = [self calculateLabelighWithText:showModel.showContent withMaxSize:CGSizeMake(topViewDesLabelW, MAXFLOAT) withFont:12].height;
    
    self.topViewDesFram = CGRectMake(25, 12+5, topViewDesLabelW, topViewDesLabelH+5);//12+5 昵称高度以及昵称和des间距
    
    
    
    
    
    //图片数组高度 [1.如果没有图 2.如果少于等于3张图 3.如果大于3张少于等于6张 4.大于6张]
    CGFloat imgViewH = CGRectGetMaxY(self.topViewDesFram);
    CGFloat imgViewW = pmW-50-25;
    CGFloat picjianju = 12;
    CGFloat picSize = (imgViewW-picjianju*2)/3;
    
    if ([showModel.videos isEqualToString:@"0"])
    {
        if (showModel.imgList.count==0)
        {
            self.imgViewFrame = CGRectMake(CGRectGetMinX(self.topViewDesFram), imgViewH, imgViewW, 0);
        }
        else if (showModel.imgList.count<=3)
        {
            self.imgViewFrame = CGRectMake(CGRectGetMinX(self.topViewDesFram), imgViewH+10, imgViewW, picSize);
        }
        else if (showModel.imgList.count>3&&showModel.imgList.count<=6)
        {
            self.imgViewFrame = CGRectMake(CGRectGetMinX(self.topViewDesFram), imgViewH+10, imgViewW, picSize*2+picjianju);
        }
        else
        {
            self.imgViewFrame = CGRectMake(CGRectGetMinX(self.topViewDesFram), imgViewH+10, imgViewW, picSize*3+picjianju*2);
        }
    }
    else
    {
        self.imgViewFrame = CGRectMake(CGRectGetMinX(self.topViewDesFram), imgViewH+10, imgViewW, 130);
    }
    
    
    
    _typeViewFrameH = 18;
    
    
    CGFloat zanViewFramH = 39;
    //点赞高度【是否有点赞】 如果有打赏就用打赏的fram
    if (showModel.shangJSON.count!=0)
    {
        self.zanViewFrame = CGRectMake(10, CGRectGetMaxY(self.imgViewFrame)+_typeViewFrameH+10, pmW-20, zanViewFramH);
    }
    else
    {
        if (showModel.favJSON.count==0)
        {
            self.zanViewFrame = CGRectMake(10, CGRectGetMaxY(self.imgViewFrame)+_typeViewFrameH, pmW-20, 0);
        }
        else
        {
            self.zanViewFrame = CGRectMake(10, CGRectGetMaxY(self.imgViewFrame)+_typeViewFrameH+10, pmW-20, zanViewFramH);
        }
    }
    
    
    
    //评论高度[1.如果没有评论 2.如果评论数少于3条 3.如果评论数多于3条]
//    CGFloat morePinlun = 36;
    CGFloat pinlunH = 49;
    CGFloat footH = 36;
    if (showModel.replyJSONArr.count==0)
    {
        self.pinlunViewFrame = CGRectMake(10, CGRectGetMaxY(self.zanViewFrame), pmW-20, 0);
    }
    else if (showModel.replyJSONArr.count<=3)
    {
        self.pinlunViewFrame = CGRectMake(10, CGRectGetMaxY(self.zanViewFrame)+10, pmW-20, pinlunH*showModel.replyJSONArr.count);
    }
    else
    {
        self.pinlunViewFrame = CGRectMake(10, CGRectGetMaxY(self.zanViewFrame)+10, pmW-20, pinlunH*3+footH);
    }
    
    if ([showModel.replyNum intValue]>=3)
    {
        
        self.moreViewFrame = CGRectMake(10, CGRectGetMaxY(self.pinlunViewFrame)+8, pmW-24, 36);
    }
    else
    {
        self.moreViewFrame = CGRectMake(10, CGRectGetMaxY(self.pinlunViewFrame), pmW-24, 0);
    }
    
    
    
    
    
//    if ([showModel.replyNum intValue]==0)
//    {
//        self.baseViewFrame = CGRectMake(0, CGRectGetMaxY(self.moreViewFrame),pmW, 10);
//    }
//    else if([showModel.replyNum intValue]<3)
//    {
//        self.baseViewFrame = CGRectMake(0, CGRectGetMaxY(self.moreViewFrame)+15,pmW, 10);
//    }
//    else
//    {
        self.baseViewFrame = CGRectMake(0, CGRectGetMaxY(self.moreViewFrame)+15,pmW, 10);
//    }
    
    //cell总高度
    cellHeightOrigl = CGRectGetMaxY(self.baseViewFrame)+25;

}

- (CGFloat)cellHeight
{
    if (self.isShowKeyBoard) {
        return cellHeightOrigl + 71;
    }
    return cellHeightOrigl;
}


@end
