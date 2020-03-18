//
//  DayTopicTBCImgView.m
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "DayTopicTBCImgView.h"


@implementation DayTopicTBCImgView
{
    UIImageView * _imgV1;
    UIImageView * _imgV2;
    UIImageView * _imgV3;
    UIImageView * _imgV4;
    UIImageView * _imgV5;
    UIImageView * _imgV6;
    UIImageView * _imgV7;
    UIImageView * _imgV8;
    UIImageView * _imgV9;
    
    CGFloat viewW;
    NSIndexPath * _indexPath;
    
    UIImageView * _videoV;
    UIView * videoBaseV;
    
    DayTopicFramModel * _model;
    
    NSMutableArray * showImgArray;
    
    
    UIImageView * imgV2;
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        viewW = self.frame.size.width;
        CGFloat picjianju = 12;
        CGFloat picSize = (viewW-picjianju*2)/3;
//        self.backgroundColor = [UIColor cyanColor];
        showImgArray = [[NSMutableArray alloc]init];
        
        
        _imgV1 = [self avaImg:CGRectMake(0, 0, picSize,picSize) tag:10001];
        _imgV2 = [self avaImg:CGRectMake(picSize+picjianju, 0, picSize,picSize) tag:10002];
        _imgV3 = [self avaImg:CGRectMake(picSize*2+picjianju*2, 0, picSize,picSize) tag:10003];
        _imgV4 = [self avaImg:CGRectMake(0, picSize+picjianju, picSize,picSize) tag:10004];
        _imgV5 = [self avaImg:CGRectMake(picSize+picjianju, picSize+picjianju, picSize,picSize) tag:10005];
        _imgV6 = [self avaImg:CGRectMake(picSize*2+picjianju*2, picSize+picjianju, picSize,picSize) tag:10006];
        _imgV7 = [self avaImg:CGRectMake(0, picSize*2+picjianju*2, picSize,picSize) tag:10007];
        _imgV8 = [self avaImg:CGRectMake(picSize+picjianju, picSize*2+picjianju*2, picSize,picSize) tag:10008];
        _imgV9 = [self avaImg:CGRectMake(picSize*2+picjianju*2, picSize*2+picjianju*2, picSize,picSize) tag:10009];
        
        
        
        
        videoBaseV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 130)];
        videoBaseV.layer.borderWidth = 0.5;
        videoBaseV.layer.borderColor = kLineColor.CGColor;
        videoBaseV.hidden = YES;
        
        _videoV = [[UIImageView alloc]initWithFrame:CGRectMake(videoBaseV.center.x-15, videoBaseV.center.y-15, 30, 30)];
        videoBaseV.tag = 10010;
        [videoBaseV addSubview:_videoV];
        [self addSubview:videoBaseV];
        
        
        imgV2 = [[UIImageView alloc]init];
    }
    return self;
}

-(void)getmodel:(DayTopicFramModel*)model indexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    _model = model;
//    DLog(@"%@",model.showModel.videos);
    //判断是否有视频
    if ([model.showModel.videos isEqualToString:@"0"])
    {
        videoBaseV.hidden = YES;
        NSInteger count = 9;
        if (model.showModel.imgList.count<=9)
        {
            count = model.showModel.imgList.count;
        }
        
        for (int i = 1; i<=9; i++)
        {
            UIImageView * imgV = (UIImageView*)[self viewWithTag:10000+i];
            
            if (i <= count)
            {
                NSString * orgUrl = _model.showModel.imgList[i-1];
            
                NSString *imgUrl = [orgUrl stringByReplacingOccurrencesOfString:@"/t" withString:@"/o"];
                
                imgV.hidden = NO;
                [imgV sd_setImageWithURL:[NSURL URLWithString:model.showModel.imgList[i-1]] placeholderImage:[UIImage imageNamed:@"images"]completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
                {
//                    [self OriginImage:image imgView:imgV];
//                    [BeanHandleImgSize OriginImage:image imgView:imgV];
                    
                    [imgV2 sd_setImageWithURL:[NSURL URLWithString:imgUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
                    {
                        [showImgArray addObject:image];
                    }];
                    
                    
                }];
            }
            else
            {
                imgV.hidden = YES;
            }
        }
    }
    else
    {
        
//        int count = 1;
        
        for (int i = 1; i<=9; i++)
        {
            UIImageView * imgV = (UIImageView*)[self viewWithTag:10000+i];
            imgV.hidden = YES;
        }
        
        videoBaseV.hidden = NO;
        [_videoV sd_setImageWithURL:[NSURL URLWithString:model.showModel.firstImg] placeholderImage:[UIImage imageNamed:@"video"]];
//        _videoV.image = [UIImage imageNamed:@"video"];
        
    }
    
    
    
    
}

-(UIImageView*)avaImg:(CGRect)fram tag:(NSInteger)tag
{
    UIImageView * img = [[UIImageView alloc]initWithFrame:fram];
    img.hidden = YES;
//    img.contentMode = UIViewContentModeScaleAspectFit;
//    img.clipsToBounds = YES;
    img.tag = tag;
    [self addSubview:img];
    
    img.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImg:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [img addGestureRecognizer:tap];
    
    
    return img;
    
    
    
}






-(void)tapImg:(UITapGestureRecognizer*)tap
{
//    10001~10009
//    model.showModel.imgList
    
    [_imgDel imgTap:_model.showModel.imgList indexPath:_indexPath tapNum:tap.view.tag-10000];
    
}





@end
