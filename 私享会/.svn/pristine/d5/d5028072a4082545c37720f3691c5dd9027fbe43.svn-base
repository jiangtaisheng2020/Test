//
//  UIView+B_Animation.m
//  XLXBadmintoon
//
//  Created by bean on 16/6/2.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "UIView+B_Animation.h"

@implementation UIView (B_Animation)
-(void)b_Viewshark
{
    CALayer *lbl = [self layer];
    CGPoint posLbl = [lbl position];
    CGPoint y = CGPointMake(posLbl.x-10, posLbl.y);
    CGPoint x = CGPointMake(posLbl.x+10, posLbl.y);
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction
                                  functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    [animation setAutoreverses:YES];
    [animation setDuration:0.08];
    [animation setRepeatCount:3];
    [lbl addAnimation:animation forKey:nil];
}
@end
