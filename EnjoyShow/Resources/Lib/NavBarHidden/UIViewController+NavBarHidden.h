//
//  UIViewController+scrollerHidden.h
//  自定义导航控制器
//
//  Created by HelloYeah on 16/3/12.
//  Copyright © 2016年 HelloYeah--叶良. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_OPTIONS(NSUInteger, HidenControlOptions) {
    
    HidenControlOptionLeft = 0x01,
    HidenControlOptionTitle = 0x01 << 1,
    HidenControlOptionRight = 0x01 << 2,
    
};

@interface UIViewController (NavBarHidden)

- (void)setKeyScrollView:(UIScrollView * )keyScrollView scrolOffsetY:(CGFloat)scrolOffsetY options:(HidenControlOptions)options;
- (void)setNavBarBackgroundImage:(UIImage *)navBarBackgroundImage;

- (void)hy_viewWillAppear:(BOOL)animated;
- (void)hy_viewWillDisappear:(BOOL)animated;
- (void)hy_viewDidDisappear:(BOOL)animated;
@end
