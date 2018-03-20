//
//  GLF_BaseViewController.m
//  GLFStore
//
//  Created by 大黄蜂 on 2017/6/14.
//  Copyright © 2017年 gonglf. All rights reserved.
//

#import "DHF_BaseViewController.h"
#import "DHF_BaseTabBarController.h"

@interface DHF_BaseViewController () {
    DHF_BaseTabBarController *_myTabBarController;
}

@end

@implementation DHF_BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = COLOR_BASE_BG;
    self.navigationController.navigationBar.barTintColor = COLOR_NAV_BG;
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    [self setNaviTitleStyle];
    self.navigationItem.hidesBackButton = YES;
}

#pragma mark - Navigation
- (void)setNaviTitleStyle {
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18], NSForegroundColorAttributeName: COLOR_NAV_TITLE}];
}

- (void)setNaviLeftItemWithArrow {
    
    [self setNaviLeftItemWithTitle:nil normalImage:@"nav_back_w" selectedImage:@"nav_back_w" highlightedImage:@"nav_back_w"];
}

- (void)setNaviLeftItemWithTitle:(NSString *)title
                     normalImage:(NSString *)normalImage
                   selectedImage:(NSString *)selectedImage
                highlightedImage:(NSString *)highlightImage {
    
    [self setNavItemWithTitle:title normalImage:normalImage selectedImage:selectedImage highlightedImage:highlightImage navItemType:NavItemTypeLeft];
}

- (void)setNaviRightItemWithTitle:(NSString *)title
                      normalImage:(NSString *)normalImage
                    selectedImage:(NSString *)selectedImage
                 highlightedImage:(NSString *)highlightImage {
    
    [self setNavItemWithTitle:title normalImage:normalImage selectedImage:selectedImage highlightedImage:highlightImage navItemType:NavItemTypeRight];
}

- (void)setNavItemWithTitle:(NSString *)title
                normalImage:(NSString *)normalImage
              selectedImage:(NSString *)selectedImage
           highlightedImage:(NSString *)highlightImage
                navItemType:(NavItemType)navItemType {
    
    /*
     设置左右item到边界的间隔
     */
    switch (navItemType) {
        case NavItemTypeLeft:
        {
            if (self.navigationItem.leftBarButtonItems.count <= 0) {
                UIBarButtonItem *naviSpacer = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                               target:nil action:nil];
                naviSpacer.width = -NAV_ITEM_OFFSET;
                self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:naviSpacer, nil];
            }
        }
            break;
        case NavItemTypeRight:
        {
            if (self.navigationItem.rightBarButtonItems.count <= 0) {
                UIBarButtonItem *naviSpacer = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                               target:nil action:nil];
                naviSpacer.width = -NAV_ITEM_OFFSET;
                self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:naviSpacer, nil];
            }
        }
            break;
        default:
            break;
    }
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    //设置button的位置，tag，点击事件
    switch (navItemType) {
        case NavItemTypeLeft:
        {
            button.tag = NavItemTypeLeft + self.navigationItem.leftBarButtonItems.count;
            [button addTarget:self action:@selector(navLeftItemClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
        case NavItemTypeRight:
        {
            button.tag = NavItemTypeRight + self.navigationItem.rightBarButtonItems.count;
            [button addTarget:self action:@selector(navRightItemClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
        default:
            break;
    }
    //设置title
    if (title && title.length > 0) {
        CGSize size = [DHFGlobalInterface getTextSizeWithContent:title contentWidth:100.0f contentFont:[UIFont systemFontOfSize:15]];
        button.frame = CGRectMake(0, 0, MAX(size.width, 44), 44);
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:COLOR_NAV_TITLE forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    //设置图片
    if (normalImage && normalImage.length > 0) {
        [button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
        [button setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    }
    
    if ((title && title.length > 0) && (normalImage && normalImage.length > 0)) {
        UIImage *image = [UIImage imageNamed:normalImage];
        button.frame = CGRectMake(0, 0, button.frame.size.width+10+image.size.width, 44);
        
        button.titleLabel.textAlignment = NSTextAlignmentLeft;
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -button.imageView.bounds.size.width, 0, button.imageView.bounds.size.width)];
        
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, button.titleLabel.bounds.size.width, 0, -button.titleLabel.bounds.size.width)];
    }
    //转化为buttonItem
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    /**
     *  设置当前为左item还是右item
     *  之前已有item，继续追加
     */
    switch (navItemType) {
        case NavItemTypeLeft:
        {
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            NSMutableArray *itemsArray = [NSMutableArray arrayWithArray:self.navigationItem.leftBarButtonItems];
            [itemsArray addObject:barButtonItem];
            self.navigationItem.leftBarButtonItems = itemsArray;
        }
            break;
        case NavItemTypeRight:
        {
            NSMutableArray *itemsArray = [NSMutableArray arrayWithArray:self.navigationItem.rightBarButtonItems];
            [itemsArray addObject:barButtonItem];
            self.navigationItem.rightBarButtonItems = itemsArray;
        }
            break;
        default:
            break;
    }
    
}

- (void)resetNaviLeftItemAtIndex:(NSInteger)index withTitle:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage highlightedImage:(NSString *)highlightImage {
    [self resetNavItemAtIndex:index withTitle:title normalImage:normalImage selectedImage:selectedImage highlightedImage:highlightImage navItemType:NavItemTypeLeft];
}

- (void)resetNaviRightItemAtIndex:(NSInteger)index withTitle:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage highlightedImage:(NSString *)highlightImage {
    [self resetNavItemAtIndex:index withTitle:title normalImage:normalImage selectedImage:selectedImage highlightedImage:highlightImage navItemType:NavItemTypeRight];
}

- (void)resetNavItemAtIndex:(NSInteger)index
                  withTitle:(NSString *)title
                normalImage:(NSString *)normalImage
              selectedImage:(NSString *)selectedImage
           highlightedImage:(NSString *)highlightImage
                navItemType:(NavItemType)navItemType {
    switch (navItemType) {
        case NavItemTypeLeft:
        {
            if (self.navigationItem.leftBarButtonItems.count > 0) {
                UIButton *leftButton = (UIButton *)[self.navigationItem.leftBarButtonItems objectAtIndex:(index+1)].customView;
                //设置title
                if (title && title.length > 0) {
                    CGSize size = [DHFGlobalInterface getTextSizeWithContent:title contentWidth:100.0f contentFont:[UIFont systemFontOfSize:15]];
                    leftButton.frame = CGRectMake(0, 0, MAX(size.width, 44), 44);
                    [leftButton setTitle:title forState:UIControlStateNormal];
                    [leftButton setTitleColor:COLOR_NAV_TITLE forState:UIControlStateNormal];
                    leftButton.titleLabel.font = [UIFont systemFontOfSize:15];
                }
                //设置图片
                if (normalImage && normalImage.length > 0) {
                    [leftButton setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
                    [leftButton setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
                    [leftButton setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
                }
                
                if ((title && title.length > 0) && (normalImage && normalImage.length > 0)) {
                    UIImage *image = [UIImage imageNamed:normalImage];
                    leftButton.frame = CGRectMake(0, 0, leftButton.frame.size.width+10+image.size.width, 44);
                    
                    leftButton.titleLabel.textAlignment = NSTextAlignmentLeft;
                    leftButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
                    
                    [leftButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -leftButton.imageView.bounds.size.width, 0, leftButton.imageView.bounds.size.width)];
                    
                    [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, leftButton.titleLabel.bounds.size.width, 0, -leftButton.titleLabel.bounds.size.width)];
                }
            }
        }
            break;
        case NavItemTypeRight:
        {
            if (self.navigationItem.rightBarButtonItems.count > 0) {
                UIButton *rightButton = (UIButton *)[self.navigationItem.rightBarButtonItems objectAtIndex:(index+1)].customView;
                //设置title
                if (title && title.length > 0) {
                    CGSize size = [DHFGlobalInterface getTextSizeWithContent:title contentWidth:100.0f contentFont:[UIFont systemFontOfSize:15]];
                    rightButton.frame = CGRectMake(0, 0, MAX(size.width, 44), 44);
                    [rightButton setTitle:title forState:UIControlStateNormal];
                    [rightButton setTitleColor:COLOR_NAV_TITLE forState:UIControlStateNormal];
                    rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
                }
                //设置图片
                if (normalImage && normalImage.length > 0) {
                    [rightButton setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
                    [rightButton setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
                    [rightButton setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
                }
            }
        }
            break;
        default:
            break;
    }
}

#pragma mark - TabBar
- (void)tabBarShow {
    _myTabBarController = (DHF_BaseTabBarController *)self.tabBarController;
    [_myTabBarController tabBarAppear];
}

- (void)tabBarHide {
    _myTabBarController = (DHF_BaseTabBarController *)self.tabBarController;
    [_myTabBarController tabBarHide];
    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark - UI
- (void)addContentScrollView {
    _contentScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _contentScrollView.backgroundColor = COLOR_BASE_BG;
    _contentScrollView.showsVerticalScrollIndicator = NO;
    _contentScrollView.showsHorizontalScrollIndicator = NO;
    _contentScrollView.bounces = NO;
    [self.view addSubview:_contentScrollView];
}

- (void)addCustomView {
    
}

#pragma mark - Event
- (void)navLeftItemClicked:(id)sender {
    
}

- (void)navRightItemClicked:(id)sender {
    
}

#pragma mark - Touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
