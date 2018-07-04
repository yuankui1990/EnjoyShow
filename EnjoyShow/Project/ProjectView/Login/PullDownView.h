//
//  PullDownView.h
//  grain-ios
//
//  Created by 达联 on 2017/3/14.
//  Copyright © 2017年 grain-ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PullDownView : UIView

@property (nonatomic , strong) UIView *backgroundView;//背景色
@property (nonatomic , strong) UIColor *titleColor;//文字颜色

//根据外界传的数组动态的实例化视图
- (id)initWithContents:(NSArray *)contentsArr andRect:(CGRect)rect;

//显示
- (void)showInView:(UIView *)view;

//隐藏
- (void)cancle;

//按钮回传事件
@property (nonatomic, copy) void (^eventTouchSelf)(UIButton *btn);
@property (nonatomic, copy) void (^eventTouchCloseBtn)(UIButton *btn);

@end
