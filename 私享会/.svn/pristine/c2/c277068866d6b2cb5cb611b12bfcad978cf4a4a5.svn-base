//
//  LXTextView.m
//  TestDemo
//
//  Created by 李旭 on 16/4/7.
//  Copyright © 2016年 LiXu. All rights reserved.
//

#import "BattleTextView.h"

@interface BattleTextView ()

@property (nonatomic, weak) UILabel *placehoderLabel;

@end

@implementation BattleTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
        // 添加一个显示提醒文字的label（显示占位文字的label）
        UILabel *placehoderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, self.width-2*10, self.height)];
        placehoderLabel.textAlignment = NSTextAlignmentLeft;
        placehoderLabel.numberOfLines = 0;
        [self addSubview:placehoderLabel];
        self.placehoderLabel = placehoderLabel;
        
        // 设置默认的占位文字颜色
        self.placehoderColor = [UIColor lightGrayColor];
        
        // 设置默认的字体
        self.font = [UIFont systemFontOfSize:16];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 监听文字改变
- (void)textDidChange
{
    self.placehoderLabel.hidden = (self.text.length != 0);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TextViewTextDidChange" object:self];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self textDidChange];
}

- (void)setPlacehoder:(NSString *)placehoder
{
    if (placehoder.length>0) {
        CGSize  size=[placehoder boundingRectWithSize:CGSizeMake(self.width-2*10, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size;
        self.placehoderLabel.frame = CGRectMake(10, 2, self.width-2*10, size.height);
    }
    _placehoder = [placehoder copy];
    self.placehoderLabel.text = placehoder;
    [self setNeedsLayout];
}

- (void)setPlacehoderColor:(UIColor *)placehoderColor
{
    _placehoderColor = placehoderColor;
    
    // 设置颜色
    self.placehoderLabel.textColor = placehoderColor;
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placehoderLabel.font = font;
    
    // 重新计算子控件的fame
    [self setNeedsLayout];
}

@end


