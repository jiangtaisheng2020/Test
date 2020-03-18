//
//  DayTopicModel.h
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DayTopicDSModel.h"
#import "DayTopicDZModel.h"
#import "DayTopicPLModel.h"
@interface DayTopicModel : NSObject

@property (nonatomic,copy) NSString * showContent;

/**uid*/
@property (nonatomic,copy) NSString * uid;
/**作者*/
@property (nonatomic,copy) NSString * author;//1
/**发帖时间[用这个]*/
@property (nonatomic,copy) NSString * createTime;//1
/**个人头像*/
@property (nonatomic,copy) NSString * avatar;//1
/**帖子标题*/
@property (nonatomic,copy) NSString * content;//1
/**帖子id*/
@property (nonatomic,copy) NSString * tid;
/**判断是否是置顶帖子*/
@property (nonatomic,copy) NSString * top;// top:1 置顶帖子 2 分站赛帖子 0不置顶
/**喜乐奖多少元【注:如果是8->12】*/
@property (nonatomic,copy) NSString * prize;//1
/**评优【注:大于0是优帖子】*/
@property (nonatomic,copy) NSString * pingyou;//效果？
/**判断是否有视频*/
@property (nonatomic,copy) NSString * videos;
/**有视频的话这是封面链接*/
@property (nonatomic,copy) NSString * firstImg;

/**aid[回复需要]*/
@property (nonatomic,copy) NSString * aid;




/**帖子图片数组*/
@property (nonatomic,strong) NSArray * imgList;//1
/**帖子类型*/
@property (nonatomic,copy) NSString * tagname;//1

/**羽球圈需要*/
@property (nonatomic,copy) NSString * title;//1






/**浏览量*/
@property (nonatomic,copy) NSString * viewNum;//1
/**打赏量*/
@property (nonatomic,copy) NSString * presentCount;//1
/**点赞量*/
@property (nonatomic,copy) NSString * favNum;//1
/**评论量*/
@property (nonatomic,copy) NSString * replyNum;//1
/**打赏的数组*/
@property (nonatomic,strong) NSMutableArray * shangJSON;//1
/**点赞的数组*/
@property (nonatomic,strong) NSMutableArray * favJSON;//1
/**评论的数组*/
@property (nonatomic,strong) NSMutableArray * replyJSONArr;//1

@end
