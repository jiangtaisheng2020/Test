//
//  LXHelpClass.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXHelpClass.h"

@implementation LXHelpClass

DEFINE_SINGLETON_FOR_CLASS(LXHelpClass);

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setFaceData];
    }
    return self;
}

- (void)setFaceData
{
    _faces=[NSArray arrayWithArray:[LXHelpClass getFace]];
    _keyArr = [[NSMutableArray alloc] init];
    _valueArr = [[NSMutableArray alloc] init];
    for (NSArray *arr0 in self.faces)
    {
        for (NSDictionary *dic0 in arr0)
        {
            [self.keyArr addObject:[dic0 allKeys][0]];
            [self.valueArr addObject:[dic0 allValues][0]];
        }
    }
    
    [self.keyArr addObject:@"[精]"];
    [self.valueArr addObject:@"essence"];
    
    self.keyArrAll = [NSArray arrayWithArray:[self.keyArr  arrayByAddingObjectsFromArray:daytopic]];
    self.valueArrAll = [NSArray arrayWithArray:[self.valueArr  arrayByAddingObjectsFromArray:daytopicName]];
}

+ (NSArray *)getFace
{
    NSString *plistFilePath = [[NSBundle mainBundle] pathForResource:@"expression" ofType:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:plistFilePath];
    return arr;
}
+ (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

@end
