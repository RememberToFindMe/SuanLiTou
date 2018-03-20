//
//  YXCustomAlertView.m
//  YXCustomAlertView
//
//  Created by Houhua Yan on 16/7/12.
//  Copyright © 2016年 YanHouhua. All rights reserved.

//

#import "YXCustomAlertView.h"

@interface YXCustomAlertView()

@property (nonatomic, strong) UILabel *titleLabel;

@end


@implementation YXCustomAlertView


- (instancetype) initAlertViewWithFrame:(CGRect)frame andSuperView:(UIView *)superView
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.middleView.frame = superView.frame;
        [superView addSubview:_middleView];
        
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 8;
        self.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, _centerY);
        [superView addSubview:self];
        
        
        self.titleLabel.frame = CGRectMake(0, 15, frame.size.width, 20);
        [self addSubview:_titleLabel];
        
        
        CGRect cancelFrame = CGRectMake(0, frame.size.height-42, frame.size.width/2, 42);
        UIButton *cancelBtn = [self creatButtonWithFrame:cancelFrame title:@"取消"];
        [self addSubview:cancelBtn];
        [cancelBtn addTarget:self action:@selector(leftCancelClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        CGRect confirmF = CGRectMake(frame.size.width/2, cancelBtn.frame.origin.y, cancelBtn.frame.size.width, cancelBtn.frame.size.height);
        UIButton *confirmBtn = [self creatButtonWithFrame:confirmF title:@"确定"];
        [self addSubview:confirmBtn];
        [confirmBtn addTarget:self action:@selector(confirmBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        //两条分割线
        UIView *horLine = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height-43, frame.size.width, 0.5)];
        horLine.backgroundColor = COLOR_SEPARATOR;
        [self addSubview:horLine];
        
        UIView *verLine = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width/2-1,frame.size.height-43, 0.5, 43)];
        verLine.backgroundColor = horLine.backgroundColor;
        [self addSubview:verLine];
    }
    
    return self;
    
}

- (UIButton *)creatButtonWithFrame:(CGRect) frame title:(NSString *) title
{
    UIButton *itemBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    itemBtn.frame = frame;
    [itemBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [itemBtn setTitle:title forState:UIControlStateNormal];
    
    itemBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    return itemBtn;
}


#pragma mark - Action
- (void) leftCancelClick
{
    if ([_delegate respondsToSelector:@selector(customAlertView:clickedButtonAtIndex:)]) {
        [_delegate customAlertView:self clickedButtonAtIndex:0];
    }
}

- (void) confirmBtnClick
{
    if ([_delegate respondsToSelector:@selector(customAlertView:clickedButtonAtIndex:)]) {
        [_delegate customAlertView:self clickedButtonAtIndex:1];
    }
    
}


#pragma mark - 注销视图
- (void) dissMiss
{
    
    if (_middleView) {
        [_middleView removeFromSuperview];
        _middleView = nil;
    }
    
    [self removeFromSuperview];
}

#pragma mark - getter And setter

- (void) setTitleStr:(NSString *)titleStr {
    _titleLabel.text = titleStr;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleLabel.textColor = titleColor;
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleLabel.font = titleFont;
}


- (UIView *) middleView {
    if (_middleView == nil) {
        _middleView = [[UIView alloc] init];
        _middleView.backgroundColor = [UIColor blackColor];
        _middleView.alpha = 0.65;
    }
    
    return _middleView;
}

- (UILabel *) titleLabel {
    
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
    }
    
    return _titleLabel;
}


@end
