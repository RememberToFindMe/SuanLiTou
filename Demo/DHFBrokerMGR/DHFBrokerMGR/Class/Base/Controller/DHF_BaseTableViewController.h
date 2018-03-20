//
//  GLF_BaseTableViewController.h
//  GLFStore
//
//  Created by 大黄蜂 on 2017/6/14.
//  Copyright © 2017年 gonglf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHF_BaseTableViewController : UITableViewController

- (void)setNaviLeftItemWithArrow;
- (void)setNaviLeftItemWithTitle:(NSString *)title
                     normalImage:(NSString *)normalImage
                   selectedImage:(NSString *)selectedImage
                highlightedImage:(NSString *)highlightImage;

- (void)setNaviRightItemWithTitle:(NSString *)title
                      normalImage:(NSString *)normalImage
                    selectedImage:(NSString *)selectedImage
                 highlightedImage:(NSString *)highlightImage;

- (void)navLeftItemClicked:(id)sender;

- (void)navRightItemClicked:(id)sender;

- (void)addCustomView;

- (void)tabBarShow;
- (void)tabBarHide;

@end
