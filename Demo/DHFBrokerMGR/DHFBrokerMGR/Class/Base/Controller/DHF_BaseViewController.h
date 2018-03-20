//
//  GLF_BaseViewController.h
//  GLFStore
//
//  Created by 大黄蜂 on 2017/6/14.
//  Copyright © 2017年 gonglf. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIScrollView+Touch.h"

@interface DHF_BaseViewController : UIViewController

@property (nonatomic, strong) UIScrollView *contentScrollView;

- (void)setNaviLeftItemWithArrow;

//第一次添加
- (void)setNaviLeftItemWithTitle:(NSString *)title
                     normalImage:(NSString *)normalImage
                   selectedImage:(NSString *)selectedImage
                highlightedImage:(NSString *)highlightImage;

- (void)setNaviRightItemWithTitle:(NSString *)title
                      normalImage:(NSString *)normalImage
                    selectedImage:(NSString *)selectedImage
                 highlightedImage:(NSString *)highlightImage;

//重设
- (void)resetNaviLeftItemAtIndex:(NSInteger)index
                       withTitle:(NSString *)title
                     normalImage:(NSString *)normalImage
                   selectedImage:(NSString *)selectedImage
                highlightedImage:(NSString *)highlightImage;

- (void)resetNaviRightItemAtIndex:(NSInteger)index
                        withTitle:(NSString *)title
                      normalImage:(NSString *)normalImage
                    selectedImage:(NSString *)selectedImage
                 highlightedImage:(NSString *)highlightImage;

- (void)navLeftItemClicked:(id)sender;

- (void)navRightItemClicked:(id)sender;

- (void)addContentScrollView;
- (void)addCustomView;

- (void)tabBarShow;
- (void)tabBarHide;

@end
