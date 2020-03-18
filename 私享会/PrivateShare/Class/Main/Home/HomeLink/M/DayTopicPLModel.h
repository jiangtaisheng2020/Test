//
//  DayTopicPLModel.h
//  DayTopic
//
//  Created by bean on 16/5/18.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DayTopicPLModel : NSObject
/**回复人的头像*/
@property (nonatomic,copy) NSString * avatar;
/**回复人uid*/
@property (nonatomic,copy) NSString * uid;
/**评论人昵称*/
@property (nonatomic,copy) NSString * username;
/**评论内容*/
@property (nonatomic,copy) NSString * content;
/**评论楼层*/
@property (nonatomic,copy) NSString * fid;
/**评论楼层中的某个人*/
//@property (nonatomic,copy) NSString * refid;
/**评论楼层中的某个人的名字*/
@property (nonatomic,copy) NSString * refusername;
@end
