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
#import "HobbyCenter_VC.h"
#import "MessageCenter_VC.h"

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
    self.viewControllers = @[[self homePage],[self hobbyCenter],vc,[self messageCenter],[self myInfo]];
    
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
        NSInteger index = [self.tabBar.items indexOfObject:item];
        for (UITabBarItem *tempItem in self.tabBar.items) {
            [tempItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor] ,NSFontAttributeName : [UIFont boldSystemFontOfSize:17]} forState:UIControlStateNormal];
        }
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor] ,NSFontAttributeName : [UIFont boldSystemFontOfSize:20]} forState:UIControlStateNormal];
        _lineView.center = CGPointMake(WINDOW_W*index/5+(WINDOW_W/10), self.view.frame.size.height-2);

        
        [_tabbarViewArr removeAllObjects];
        for (UIView *tempView in self.tabBar.subviews) {
            if ([tempView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [_tabbarViewArr addObject:tempView];
            }
        }
        NSArray *sortArr = [_tabbarViewArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            UIView *tempView1 = obj1;
            UIView *tempView2 = obj2;
            if (VIEW_X(tempView1) < VIEW_X(tempView2)) {
                return NSOrderedAscending;
            } else {
                return NSOrderedDescending;
            }
        }];
        
        [self showTabbarTouchAnimation:sortArr andIndex:index];
    }
    _selectItem = item;
}

/**
 * 执行动画效果
 */
- (void)showTabbarTouchAnimation:(NSArray *)btnArray andIndex:(NSInteger)index {
    //放大效果，并回到原位
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //速度控制函数，控制动画运行的节奏
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.2;       //执行时间
    animation.repeatCount = 1;      //执行次数
    animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
    animation.fromValue = [NSNumber numberWithFloat:0.7];   //初始伸缩倍数
    animation.toValue = [NSNumber numberWithFloat:1.3];     //结束伸缩倍数
    [[btnArray[index] layer] addAnimation:animation forKey:nil];
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
//        [homePage.tabBarItem setImage:[[UIImage imageNamed:@"icon_sy_b_sy_black"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//        [homePage.tabBarItem setSelectedImage:[[UIImage imageNamed:@"icon_sy_b_sy_blue"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [homePage.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -13)];
    }
    return homePage;
}
/**
 * 爱好中心
 */
- (UINavigationController *)hobbyCenter {
    //item1  static
    UINavigationController *hobbyCenter = nil;
    if (!hobbyCenter) {
        HobbyCenter_VC *VC = [[HobbyCenter_VC alloc] init];
        hobbyCenter = [[UINavigationController alloc] initWithRootViewController:VC];
        [hobbyCenter setTitle:@"爱好"];
        hobbyCenter.navigationBar.barStyle = UIBarStyleBlack;
        [hobbyCenter.navigationBar setTintColor:[UIColor whiteColor]];
        [hobbyCenter.navigationBar setBarTintColor:[UIColor blackColor]];
        [hobbyCenter.navigationBar setBackgroundImage:[PublicMethod getImgWithColor:[UIColor blackColor]] forBarMetrics:UIBarMetricsDefault];
        [hobbyCenter.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor] ,NSFontAttributeName : [UIFont boldSystemFontOfSize:17]} forState:UIControlStateNormal];
        [hobbyCenter.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor] ,NSFontAttributeName : [UIFont boldSystemFontOfSize:20]} forState:UIControlStateSelected];
//        [hobbyCenter.tabBarItem setImage:[[UIImage imageNamed:@"icon_sy_b_sy_black"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//        [hobbyCenter.tabBarItem setSelectedImage:[[UIImage imageNamed:@"icon_sy_b_sy_blue"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [hobbyCenter.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -13)];
    }
    return hobbyCenter;
}
/**
 * 消息中心
 */
- (UINavigationController *)messageCenter {
    //item1  static
    UINavigationController *messageCenter = nil;
    if (!messageCenter) {
        MessageCenter_VC *VC = [[MessageCenter_VC alloc] init];
        messageCenter = [[UINavigationController alloc] initWithRootViewController:VC];
        [messageCenter setTitle:@"消息"];
        messageCenter.navigationBar.barStyle = UIBarStyleBlack;
        [messageCenter.navigationBar setTintColor:[UIColor whiteColor]];
        [messageCenter.navigationBar setBarTintColor:[UIColor blackColor]];
        [messageCenter.navigationBar setBackgroundImage:[PublicMethod getImgWithColor:[UIColor blackColor]] forBarMetrics:UIBarMetricsDefault];
        [messageCenter.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor] ,NSFontAttributeName : [UIFont boldSystemFontOfSize:17]} forState:UIControlStateNormal];
        [messageCenter.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor] ,NSFontAttributeName : [UIFont boldSystemFontOfSize:20]} forState:UIControlStateSelected];
//        [messageCenter.tabBarItem setImage:[[UIImage imageNamed:@"icon_sy_b_sy_black"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//        [messageCenter.tabBarItem setSelectedImage:[[UIImage imageNamed:@"icon_sy_b_sy_blue"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [messageCenter.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -13)];
    }
    return messageCenter;
}
/**
 * 个人中心
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
//        [myInfoNav.tabBarItem setImage:[[UIImage imageNamed:@"icon_sy_b_sy_black"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//        [myInfoNav.tabBarItem setSelectedImage:[[UIImage imageNamed:@"icon_sy_b_sy_blue"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
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
