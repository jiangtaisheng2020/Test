//
//  DayTopicFramModel.h
//  DayTopic
//
//  Created by bean on 16/5/18.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DayTopicModel.h"
@interface DayTopicFramModel : NSObject

/**数据源*/
@property (nonatomic, strong) DayTopicModel * showModel;//1
/**cell高*/
@property (nonatomic, assign) CGFloat cellHeight;
/**顶部文字的坐标*/
@property (nonatomic, assign) CGRect topViewDesFram;
/**图片的坐标*/
@property (nonatomic, assign) CGRect imgViewFrame;
/**帖子类型的坐标*/
@property (nonatomic, assign) CGFloat typeViewFrameH;
/**点赞的坐标*/
@property (nonatomic, assign) CGRect zanViewFrame;
/**更多评论的坐标*/
@property (nonatomic, assign) CGRect moreViewFrame;
/**评论的坐标*/
@property (nonatomic, assign) CGRect pinlunViewFrame;
/**占位的坐标*/
@property (nonatomic, assign) CGRect baseViewFrame;

@property (nonatomic, assign) BOOL isShowKeyBoard;
@property (nonatomic, assign) BOOL isTapTypePL;

@end
