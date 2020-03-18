//
//  LXFindCollectionHeader.h
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXFindCollectionHeader : UICollectionReusableView

@property (nonatomic, weak)   UILabel *titleLaber;

- (void)configurationCell:(id)object;

@end
