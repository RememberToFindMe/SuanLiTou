//
//  DHF_BaseTabBarController.m
//  DHFBrokerMGR
//
//  Created by 大黄蜂 on 2018/3/2.
//  Copyright © 2018年 dhffcw. All rights reserved.
//

#import "DHF_BaseTabBarController.h"
#import "DHFTabHomeViewController.h"
#import "DHFTabBrokerViewController.h"
#import "DHFTabManagerViewController.h"
#import "DHFTabMineViewController.h"
#import "DHF_BaseNavigationController.h"

#define tabBarItemTag  1000

@interface DHF_BaseTabBarController (){
    UIView *_myTabBar;
}

@end

@implementation DHF_BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setMenuItems];
    
    [self addMyTabBar];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBar.hidden = YES;
}

#pragma mark - Public
- (void)tabBarAppear {
    _myTabBar.hidden = NO;
}

- (void)tabBarHide {
    _myTabBar.hidden = YES;
}

- (void)changeMyTabBarWithBarItemChanged
{
    for (int i = 0; i < _myTabBar.subviews.count; i++) {
        UIView *itemView = [_myTabBar.subviews objectAtIndex:i];
        for (UIView *subView in itemView.subviews) {
            if (i == self.selectedIndex) {
                if ([subView isKindOfClass:[UIImageView class]]) {
                    UIImageView *subImageView = (UIImageView *)subView;
                    subImageView.highlighted = YES;
                }
                if ([subView isKindOfClass:[UILabel class]]) {
                    UILabel *subLabel = (UILabel *)subView;
                    subLabel.textColor = COLOR_TITLE_SELECT;
                }
            } else {
                if ([subView isKindOfClass:[UIImageView class]]) {
                    UIImageView *subImageView = (UIImageView *)subView;
                    subImageView.highlighted = NO;
                }
                if ([subView isKindOfClass:[UILabel class]]) {
                    UILabel *subLabel = (UILabel *)subView;
                    subLabel.textColor = COLOR_SUB_TITLE_TEXT;
                }
            }
        }
    }
}

#pragma mark - Private
- (void)setMenuItems {
    
    DHFTabHomeViewController *homeVC = [[DHFTabHomeViewController alloc] init];
    DHF_BaseNavigationController *homeNC = [[DHF_BaseNavigationController alloc] initWithRootViewController:homeVC];
    homeNC.title = @"首页";

    DHFTabBrokerViewController *brokerVC = [[DHFTabBrokerViewController alloc] init];
    DHF_BaseNavigationController *brokerNC = [[DHF_BaseNavigationController alloc] initWithRootViewController:brokerVC];
    brokerNC.title = @"经服专员";

    DHFTabManagerViewController *managerVC = [[DHFTabManagerViewController alloc] init];
    DHF_BaseNavigationController *managerNC = [[DHF_BaseNavigationController alloc] initWithRootViewController:managerVC];
    managerNC.title = @"管理";

    DHFTabMineViewController *mineVC = [[DHFTabMineViewController alloc] init];
    DHF_BaseNavigationController *mineNC = [[DHF_BaseNavigationController alloc] initWithRootViewController:mineVC];
    mineNC.title = @"我的";

    NSArray *normalArray = @[];
    NSArray *selectedArray = @[];

//    if ([[GLFUserInfo sharedManager].userModel.roleId integerValue] == UserRoleManager) {

        self.viewControllers = @[homeNC, brokerNC, managerNC, mineNC];
        normalArray = @[@"tab_home_n", @"tab_policy_n",@"tab_custom_n",@"tab_store_n"];
        selectedArray = @[@"tab_home_s", @"tab_policy_s",@"tab_custom_s",@"tab_store_s"];

//    } else if ([[GLFUserInfo sharedManager].userModel.roleId integerValue] == UserRoleStaff) {
//
//        self.viewControllers = @[homeNC, policyNC, customerNC, storeManageNC];
//        normalArray = @[@"tab_home_n", @"tab_policy_n",@"tab_custom_n",@"tab_store_n"];
//        selectedArray = @[@"tab_home_s", @"tab_policy_s",@"tab_custom_s",@"tab_store_s"];
//
//    } else if ([[GLFUserInfo sharedManager].userModel.roleId integerValue] == UserRoleChannel){
//
//        self.viewControllers = @[channelHomeNC, policyNC, channelManageNC];
//
//        normalArray = @[@"tab_home_n", @"tab_policy_n", @"tab_store_n"];
//        selectedArray = @[@"tab_home_s", @"tab_policy_s", @"tab_store_s"];
//
//    }

    for(NSInteger index = 0; index < self.tabBar.items.count; index++) {
        UITabBarItem *item = [self.tabBar.items objectAtIndex:index];

        item.image = [[UIImage imageNamed:[normalArray objectAtIndex:index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [[UIImage imageNamed:[selectedArray objectAtIndex:index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetZero];
    }
    
}

- (void)addMyTabBar
{
    //把原来的tabBar放到屏幕下
    CGRect frame = self.tabBar.frame;
    frame.origin.y += self.tabBar.height+1;
    self.tabBar.frame = frame;
    
    //添加自己的tabBar
    _myTabBar = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - self.tabBar.height, SCREEN_WIDTH, self.tabBar.height)];
    _myTabBar.backgroundColor = COLOR_TABBAR_BG;
    [self.view addSubview:_myTabBar];
    
    //添加item
    [self addMyTabBarItems];
}

- (void)addMyTabBarItems
{
    
    CGFloat itemWidth = _myTabBar.width/self.viewControllers.count;
    CGFloat itemHeight = _myTabBar.height;
    for (int i = 0; i < self.viewControllers.count; i++) {
        UIView *itemView = [[UIView alloc] initWithFrame:CGRectMake(i*itemWidth, 0, itemWidth, itemHeight)];
        itemView.backgroundColor = [UIColor clearColor];
        UINavigationController *navi = (UINavigationController *)[self.viewControllers objectAtIndex:i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = itemView.bounds;
        button.tag = tabBarItemTag + i;
        [button addTarget:self action:@selector(myTabBarItemSelected:) forControlEvents:UIControlEventTouchUpInside];
        [itemView addSubview:button];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((itemView.width-30)/2, 3, 30, 30)];
        //        UIImageView *imageView = [[UIImageView alloc] initWithFrame:itemView.bounds];//CGRectMake((itemView.width-25)/2, (itemView.height-35)/2, 25, 35)
        imageView.image = navi.tabBarItem.image;
        imageView.highlightedImage = navi.tabBarItem.selectedImage;
        imageView.contentMode = UIViewContentModeCenter;
        [itemView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.bottom, itemView.width, 15)];
        label.text = navi.title;
        label.font = [UIFont boldSystemFontOfSize:10];
        label.textAlignment = NSTextAlignmentCenter;
        [itemView addSubview:label];
        
        [_myTabBar addSubview:itemView];
        
        if (i == self.selectedIndex) {
            imageView.highlighted = YES;
            label.textColor = COLOR_TITLE_SELECT;
        } else {
            imageView.highlighted = NO;
            label.textColor = COLOR_SUB_TITLE_TEXT;
        }
    }
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _myTabBar.width, 1)];
    line.backgroundColor = COLOR_SEPARATOR;
    [_myTabBar addSubview:line];
}

- (void)myTabBarItemSelected:(UIButton *)button
{
    self.selectedIndex = button.tag - tabBarItemTag;
    
    [self changeMyTabBarWithBarItemChanged];
}


@end
