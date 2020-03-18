//
//  DayTopicModel.m
//  DayTopic
//
//  Created by bean on 16/5/17.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "DayTopicModel.h"

@implementation DayTopicModel
@synthesize showContent = _showContent;
- (instancetype)init
{
    self = [super init];
    if (self) {
        _shangJSON = [[NSMutableArray alloc]init];
        _favJSON = [[NSMutableArray alloc]init];
        _replyJSONArr = [[NSMutableArray alloc]init];
        
    }
    return self;
}

-(NSString *)showContent
{
    if (_showContent == nil || _showContent.length == 0) {
        NSMutableString *contentStr = [NSMutableString stringWithFormat:@" %@",self.content];
        switch ([self.prize integerValue]) {
            case 8: {
                [contentStr insertString:daytopic[0] atIndex:0];
            } break;
            case 20: {
                [contentStr insertString:daytopic[1] atIndex:0];
            } break;
            case 50: {
                [contentStr insertString:daytopic[2] atIndex:0];
            } break;
            case 100: {
                [contentStr insertString:daytopic[3] atIndex:0];
            } break;
                
            default:
                break;
        }
        
        if ([self.pingyou integerValue] > 0) {//1
            [contentStr insertString:@"[精] " atIndex:0];
        }
        _showContent = contentStr;
    }
    return _showContent;
}

@end
