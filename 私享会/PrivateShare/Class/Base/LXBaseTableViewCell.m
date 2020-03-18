//
//  LXBaseCell.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXBaseTableViewCell.h"

@implementation LXBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = kCellBackGroundColor;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
    }
    return self;
}

@end
