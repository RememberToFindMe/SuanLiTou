//
//  XBConst.h
//  XBSettingControllerDemo
//
//  Created by XB on 15/9/23.
//  Copyright © 2015年 XB. All rights reserved.
//

#ifndef XBConst_h
#define XBConst_h


//获取屏幕尺寸
#define XBScreenWidth      [UIScreen mainScreen].bounds.size.width
#define XBScreenHeight     [UIScreen mainScreen].bounds.size.height
#define XBScreenBounds     [UIScreen mainScreen].bounds


//功能图片到左边界的距离
#define XBFuncImgToLeftGap 15

//功能名称字体
#define XBFuncLabelFont 15

//功能名称到功能图片的距离,当功能图片funcImg不存在时,等于到左边界的距离
#define XBFuncLabelToFuncImgGap 15

//指示箭头或开关到右边界的距离
#define XBIndicatorToRightGap 10

//详情文字字体
#define XBDetailLabelFont 12

//详情到指示箭头或开关的距离
#define XBDetailViewToIndicatorGap 13

#endif /* XBConst_h */
