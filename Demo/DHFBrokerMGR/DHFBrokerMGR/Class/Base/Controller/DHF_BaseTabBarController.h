//
//  DHF_BaseTabBarController.h
//  DHFBrokerMGR
//
//  Created by 大黄蜂 on 2018/3/2.
//  Copyright © 2018年 dhffcw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHF_BaseTabBarController : UITabBarController

- (void)tabBarAppear;
- (void)tabBarHide;

- (void)changeMyTabBarWithBarItemChanged;

@end
