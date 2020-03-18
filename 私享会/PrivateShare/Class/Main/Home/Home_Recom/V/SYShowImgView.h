//
//  SYShowImgView.h
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYShowImgView : UIView<UIScrollViewDelegate>

//-(instancetype)initWithFrame:(CGRect)frame;


-(void)getImgArr:(NSArray *)imgArr tapNum:(NSInteger)tapNum;

@end
