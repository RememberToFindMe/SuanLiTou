//
//  DHFMacro_Const.h
//  DHFBrokerMGR
//
//  Created by 大黄蜂 on 2018/3/2.
//  Copyright © 2018年 dhffcw. All rights reserved.
//

#ifndef DHFMacro_Const_h
#define DHFMacro_Const_h

#ifdef __OBJC__
#import <UIKit/UIKit.h>
#endif

//screen
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width

//AppDelegate
#define APPDELEGATE ((AppDelegate *)([UIApplication sharedApplication].delegate))

#define WEAK_SELF(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define IS_NULL(x)             (!x || [x isKindOfClass:[NSNull class]])
#define IS_EMPTY_STRING(x)      (IS_NULL(x) || [x isEqualToString:@""] || [x isEqualToString:@"(null)"] || [x isEqual:[NSNull null]] || [x isEqualToString:@"\"null\""] || [x isEqualToString:@"null"])

//设置view的圆角边框
#define VIEW_CORNER_RADIUS(View, Radius, Width, Color)  \
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

//获取图片资源
#define GET_IMAGE(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

// 字符串处理
#define objectOrNull(obj) ((obj) ? (obj) : [NSNull null])
#define objectOrEmptyStr(obj) ((!IS_EMPTY_STRING(obj)) ? [NSString stringWithFormat:@"%@",(obj)] : @"")
#define objectOrStr(obj,str) ((!isEmptyString(obj)) ? [NSString stringWithFormat:@"%@",(obj)] : str)
#define isArray(x)            (x  && [x isKindOfClass:[NSArray class]])
#define isNSDictionary(x) (x && [x isKindOfClass:[NSDictionary class]])
#define isNull(x)             (!x || [x isKindOfClass:[NSNull class]])
#define toInt(x)              (isNull(x) ? 0 : [x intValue])
#define isEmptyString(x)      (isNull(x) || [x isEqual:@""] || [x isEqual:@"(null)"])

//颜色
#define COLOR_RGBA(r, g, b, a)      [UIColor colorWithRed:(CGFloat)((r)/255.0) green:(CGFloat)((g)/255.0) blue:(CGFloat)((b)/255.0) alpha:(CGFloat)(a)]
#define COLOR_RGB(r, g, b)          COLOR_RGBA(r, g, b, 1.0)
#define COLOR_HEX(hexValue)         [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]

//背景颜色
#define COLOR_BASE_BG               COLOR_HEX(0xf5f5f5)
//导航栏颜色
#define COLOR_NAV_BG                COLOR_HEX(0xf55353)
#define COLOR_TITLE_SELECT          COLOR_HEX(0xf55353)
#define COLOR_BUTTON_BG             COLOR_HEX(0xf55353)
//导航栏文字颜色
#define COLOR_NAV_TITLE             [UIColor whiteColor]
//底栏颜色
#define COLOR_TABBAR_BG             [UIColor whiteColor]
//分割线颜色
#define COLOR_SEPARATOR             COLOR_HEX(0xdddddd)
//数字颜色
#define COLOR_NUMBER                COLOR_HEX(0xf96606)
//#define COLOR_NUMBER                COLOR_HEX(0xff3300)

//文字颜色
#define COLOR_TITLE_TEXT            COLOR_HEX(0x333333)
#define COLOR_TITLE_TEXT1           COLOR_HEX(0x282828)
#define COLOR_SUB_TITLE_TEXT        COLOR_HEX(0x999999)
#define COLOR_SUB_TITLE_TEXT1       COLOR_HEX(0xcccccc)

//const
//navbar高度
static CGFloat const NAV_BAR_HEIGHT     = 64.0f;
//navItem偏移量
static CGFloat const NAV_ITEM_OFFSET    = 8.0f;
//taBar高度
static CGFloat const TAB_BAR_HEIGHT     = 49.0f;
//左边距
static CGFloat const LEFT_SPACE         = 15.0f;
static CGFloat const TOP_SPACE          = 10.0f;
static NSInteger const BETWEEN_SPACE    = 8.0f;

//
static CGFloat const TEXT_HEIGHT        = 50.0f;
static CGFloat const BUTTON_HEIGHT      = 50.0f;

//接口每页数据项
static NSInteger const URL_PAGE_SIZE    = 10;


#define UI_IS_IPHONE            ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define UI_IS_IPHONE4           (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height < 568.0)
#define UI_IS_IPHONE5           (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define UI_IS_IPHONE6           (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define UI_IS_ABOVEIPHONE5           (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height > 568.0)
#define UI_IS_ABOVEIPHONE6           (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height >= 667.0)
#define UI_IS_IPHONE6           (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define UI_IS_IPHONE6PLUS       (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0 || [[UIScreen mainScreen] bounds].size.width == 736.0) // Both orientations

#endif /* DHFMacro_Const_h */
