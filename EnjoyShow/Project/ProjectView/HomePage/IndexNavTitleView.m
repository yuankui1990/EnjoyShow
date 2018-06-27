//
//  IndexNavTitleView.m
//  EnjoyShow
//
//  Created by 达联 on 2018/6/27.
//  Copyright © 2018年 Riber. All rights reserved.
//

#import "IndexNavTitleView.h"

typedef NS_ENUM(NSInteger,TYPE) {
    PEOPLESHOW  = 1,
    SKYSHOW     = 2,
    EARTHSHOW   = 3
};
    

@implementation IndexNavTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.showType = SKYSHOW;
        self.frame = CGRectMake(0, 0, WINDOW_W/2, 30);
        //人秀按钮
        self.peopleShow = [PublicCreateUI buttonWithFrame:CGRectMake(0, 0, WINDOW_W/6, 30) Title:@"人秀" Font:17 Color:[UIColor grayColor]];
        [self.peopleShow addTarget:self action:@selector(peopleShowClick) forControlEvents:UIControlEventTouchUpInside];
        self.peopleShow.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [self addSubview:self.peopleShow];
        //线
        UIView *lineView1 = [PublicCreateUI viewWithFrame:CGRectMake(WINDOW_W/6, 10, 1, 10) BackColor:[UIColor whiteColor]];
        [self addSubview:lineView1];
        //天秀按钮
        self.skyShow = [PublicCreateUI buttonWithFrame:CGRectMake(WINDOW_W/6+1, 0, WINDOW_W/6-2, 30) Title:@"天秀" Font:20 Color:[UIColor whiteColor]];
        [self.skyShow addTarget:self action:@selector(skyShowClick) forControlEvents:UIControlEventTouchUpInside];
        self.skyShow.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [self addSubview:self.skyShow];
        //线
        UIView *lineView2 = [PublicCreateUI viewWithFrame:CGRectMake(WINDOW_W/3-1, 10, 1, 10) BackColor:[UIColor whiteColor]];
        [self addSubview:lineView2];
        //地秀
        self.earthShow = [PublicCreateUI buttonWithFrame:CGRectMake(WINDOW_W/3, 0, WINDOW_W/6, 30) Title:@"地秀" Font:17 Color:[UIColor grayColor]];
        [self.earthShow addTarget:self action:@selector(earthShowClick) forControlEvents:UIControlEventTouchUpInside];
        self.earthShow.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [self addSubview:self.earthShow];
        
    }
    return self;
}

/**
 * 人秀方法点击事件
 */
- (void)peopleShowClick {
    if (self.showType != PEOPLESHOW) {
        self.peopleShow.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [self.peopleShow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.skyShow.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [self.skyShow setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.earthShow.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [self.earthShow setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.showType = PEOPLESHOW;
        if (self.peopleShowBlock) {
            self.peopleShowBlock();
        }
    }
}
/**
 * 天秀按钮点击事件
 */
- (void)skyShowClick {
    if (self.showType != SKYSHOW) {
        self.peopleShow.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [self.peopleShow setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.skyShow.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [self.skyShow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.earthShow.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [self.earthShow setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.showType = SKYSHOW;
        if (self.skyShowBlock) {
            self.skyShowBlock();
        }
    }
}
/**
 * 地秀按钮点击事件
 */
- (void)earthShowClick {
    if (self.showType != EARTHSHOW) {
        self.peopleShow.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [self.peopleShow setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.skyShow.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [self.skyShow setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.earthShow.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [self.earthShow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.showType = EARTHSHOW;
        if (self.earthShowBlock) {
            self.earthShowBlock();
        }
    }
}

@end
