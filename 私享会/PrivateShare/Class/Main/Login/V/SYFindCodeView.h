//
//  SYFindCodeView.h
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

@protocol SYFindCodeDelegate <NSObject>

-(void)didReturnTexttextArray:(NSMutableArray*)textArray;

@end

#import <UIKit/UIKit.h>

@interface SYFindCodeView : UIView

@property(nonatomic,weak)id<SYFindCodeDelegate>findCodeDel;

@end
