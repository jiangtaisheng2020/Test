//
//  SYHotRecomendCollectionCell.h
//  PrivateShare
//
//  Created by bean on 16/9/21.
//  Copyright © 2016年 xunbao. All rights reserved.
//

@protocol SYHotRecomDel <NSObject>

-(void)tapHotNum:(int)num;

@end
#import "LXBaseCollectionCell.h"

@interface SYHotRecomendCollectionCell : LXBaseCollectionCell

@property(nonatomic,weak)id<SYHotRecomDel>hotDel;

@end
