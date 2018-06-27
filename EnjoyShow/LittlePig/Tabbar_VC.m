//
//  Tabbar_VC.m
//  LittlePig
//
//  Created by 达联 on 2018/6/26.
//  Copyright © 2018年 Riber. All rights reserved.
//

#import "Tabbar_VC.h"
#import "Index_VC.h"
#import "PublicMethod.h"
#import "MyInfo_VC.h"

@interface Tabbar_VC () {
    UIButton *_addButton;
    UITabBarItem *_selectItem;
    NSMutableArray *_tabbarViewArr;
    UIView *_lineView;
}

@end

@implementation Tabbar_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    _tabbarViewArr = [[NSMutableArray alloc] init];
    
    
    self.tabBar.backgroundColor = [UIColor blackColor];
    [self.tabBarItem setTitlePositionAdjustment:UIOffsetMake(3, 13)];

    [self.tabBar setBackgroundImage:GetImage(@"tabbar")];
    UIViewController *vc = [[UIViewController alloc] init];
    self.viewControllers = @[[self homePage],[self homePage],vc,[self homePage],[self myInfo]];

    _addButton = [PublicCreateUI buttonWithFrame:CGRectMake(0, 0, 70, 70) Title:@"" Font:0 Color:[UIColor redColor]];
    [_addButton setImage:GetImage(@"addImg") forState:UIControlStateNormal];
    [_addButton addTarget:self action:@selector(addbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    CGFloat heightDifference = _addButton.frame.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0) {
        _addButton.center = self.tabBar.center;
    } else {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0-5;
        _addButton.center = center;
    }
    [self.view addSubview:_addButton];
    
    _lineView = [PublicCreateUI viewWithFrame:CGRectMake(0, 0, WINDOW_W/5-35, 2) BackColor:[UIColor whiteColor]];
    _lineView.center = CGPointMake((WINDOW_W)/10, self.view.frame.size.height-2);
    [self.view addSubview:_lineView];
    
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if (_selectItem != item) {
        int itemIndex = 0;
        for (int i = 0; i < self.tabBar.items.count; i++) {
            UITabBarItem *tempItem = self.tabBar.items[i];
            [tempItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor] ,NSFontAttributeName : [UIFont boldSystemFontOfSize:17]} forState:UIControlStateNormal];
            if (tempItem == item) {
                itemIndex = i;
            }
        }
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor] ,NSFontAttributeName : [UIFont boldSystemFontOfSize:20]} forState:UIControlStateNormal];
//        [UIView animateWithDuration:0.25 animations:^{
            _lineView.center = CGPointMake(WINDOW_W*itemIndex/5+(WINDOW_W/10), self.view.frame.size.height-2);
//        }];
    }
    _selectItem = item;
}


/**
 * 首页
 */
- (UINavigationController *)homePage {
    //item1  static
    UINavigationController *homePage = nil;
    if (!homePage) {
        Index_VC *VC = [[Index_VC alloc] init];
        homePage = [[UINavigationController alloc] initWithRootViewController:VC];
        [homePage setTitle:@"首页"];
        homePage.navigationBar.barStyle = UIBarStyleBlack;
        [homePage.navigationBar setTintColor:[UIColor whiteColor]];
        [homePage.navigationBar setBarTintColor:[UIColor blackColor]];
        [homePage.navigationBar setBackgroundImage:[PublicMethod getImgWithColor:[UIColor blackColor]] forBarMetrics:UIBarMetricsDefault];
        [homePage.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor] ,NSFontAttributeName : [UIFont boldSystemFontOfSize:17]} forState:UIControlStateNormal];
        [homePage.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor] ,NSFontAttributeName : [UIFont boldSystemFontOfSize:20]} forState:UIControlStateSelected];
        [homePage.tabBarItem setImage:[[UIImage imageNamed:@"icon_sy_b_sy_black"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [homePage.tabBarItem setSelectedImage:[[UIImage imageNamed:@"icon_sy_b_sy_blue"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [homePage.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -13)];
    }
    return homePage;
}

/**
 * 首页
 */
- (UINavigationController *)myInfo {
    //item1  static
    UINavigationController *myInfoNav = nil;
    if (!myInfoNav) {
        MyInfo_VC *VC = [[MyInfo_VC alloc] init];
        myInfoNav = [[UINavigationController alloc] initWithRootViewController:VC];
        [myInfoNav setTitle:@"我的"];
        myInfoNav.navigationBar.barStyle = UIBarStyleBlack;
        [myInfoNav.navigationBar setTintColor:[UIColor whiteColor]];
        [myInfoNav.navigationBar setBarTintColor:[UIColor blackColor]];
        [myInfoNav.navigationBar setBackgroundImage:[PublicMethod getImgWithColor:[UIColor blackColor]] forBarMetrics:UIBarMetricsDefault];
        [myInfoNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor] ,NSFontAttributeName : [UIFont boldSystemFontOfSize:17]} forState:UIControlStateNormal];
        [myInfoNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor] ,NSFontAttributeName : [UIFont boldSystemFontOfSize:20]} forState:UIControlStateSelected];
        [myInfoNav.tabBarItem setImage:[[UIImage imageNamed:@"icon_sy_b_sy_black"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [myInfoNav.tabBarItem setSelectedImage:[[UIImage imageNamed:@"icon_sy_b_sy_blue"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [myInfoNav.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -13)];
    }
    return myInfoNav;
}


/**
 * 加号按钮点击事件
 */
- (void)addbuttonClick {
    NSLog(@"fsdfsdfsf");
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
