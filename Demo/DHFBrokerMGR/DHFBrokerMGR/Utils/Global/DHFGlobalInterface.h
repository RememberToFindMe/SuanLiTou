//
//  GLFGlobalInterface.h
//  GLFStore
//
//  Created by 大黄蜂 on 2017/6/14.
//  Copyright © 2017年 gonglf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHFGlobalInterface : NSObject

+ (BOOL)isFirstRun;

//获取时间
+ (NSString *)getTimeStringWithTime:(NSNumber *)timeNumber andDateFormat:(NSString *)dateFormat;

//用来返回一个字符串的size
+ (CGSize)getTextSizeWithContent:(NSString *)content contentWidth:(CGFloat)contentWidth contentFont:(UIFont *)font;

//toast
+ (void)showToast:(NSString *)message;
//居中提示框
+ (void)showCenterToast:(NSString *)message;

+ (void)showLongToast:(NSString *)message second:(NSTimeInterval)delay;

+ (void)showLoadingToast;
+ (void)showLoadingToastWithTitle:(NSString *)title;
+ (void)hideLoadingToast;

//打电话按钮
+ (UIButton *)getCommonPhoneButton;

+ (NSString *)PhoneFormat:(NSString *)phone;

//公用的拼接文字
+ (NSAttributedString *)getLabelAttStringWithWholeString:(NSString *)wholeString rangeString:(NSString *)rangeString rangeTextColor:(UIColor *)rangeTextColor;

//验证身份证是否合法
+ (BOOL)verifyIDCardNumber:(NSString *)value;

@end
