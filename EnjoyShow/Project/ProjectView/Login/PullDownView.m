//
//  PullDownView.m
//  grain-ios
//
//  Created by 达联 on 2017/3/14.
//  Copyright © 2017年 grain-ios. All rights reserved.
//

#import "PullDownView.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
#define RATIO_W(__value__) (__value__/750.0)*WINDOW_W
#define RATIO_H(__value__) (__value__/1334.0)*WINDOW_H


@interface PullDownView () {
    
}
@end

@implementation PullDownView

- (id)initWithContents:(NSArray *)contentsArr andRect:(CGRect)rect{
    if (self = [super init]) {
        self.frame = [[UIApplication sharedApplication].delegate window].bounds;
        //背景图片
        _backgroundView = [[UIImageView alloc] init];
        _backgroundView.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, contentsArr.count*RATIO_H(80)+9);
        _backgroundView.userInteractionEnabled = YES;
        _backgroundView.backgroundColor = [UIColor clearColor];
        [self addSubview:_backgroundView];
        UIImageView *arrowImgView = [PublicCreateUI imageViewWithFrame:CGRectMake(rect.size.width-60, 0, 19, 9) PlaceholdImage:GetImage(@"img_horn")];
        [_backgroundView addSubview:arrowImgView];
        
        UIImageView *shadowView = [PublicCreateUI imageViewWithFrame:CGRectMake(0, 8, rect.size.width, contentsArr.count*RATIO_H(80)) PlaceholdImage:nil];
        //添加四个边阴影
        UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:shadowView.bounds];
        shadowView.layer.masksToBounds = NO;
        shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
        shadowView.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
        shadowView.layer.shadowOpacity = 0.5f;
        shadowView.layer.shadowPath = shadowPath.CGPath;
        [_backgroundView addSubview:shadowView];
        
        UIImageView *bgImgView = [PublicCreateUI imageViewWithFrame:CGRectMake(0, 8, rect.size.width, contentsArr.count*RATIO_H(80)) PlaceholdImage:[PublicMothed getImgWithColor:[PublicMothed colorWithStr:@"#e6e6e6"]]];
        ViewRadius(bgImgView, 6);
        [_backgroundView addSubview:bgImgView];
        //循环按钮
        for (NSInteger i = 0; i < contentsArr.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag                        = 100 + i;
            btn.titleLabel.font            = [UIFont systemFontOfSize:RATIO_W(30)];
            [btn setTitleColor:[PublicMothed colorWithStr:@"#02C690"] forState:UIControlStateNormal];
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            [btn setTitle:[NSString stringWithFormat:@"%@",contentsArr[i]] forState:UIControlStateNormal];
            btn.hidden = YES;
            [btn setBackgroundImage:[UIImage imageNamed:@"backImg"] forState:UIControlStateHighlighted];
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            btn.frame = CGRectMake(2, RATIO_H(80)*i+8, _backgroundView.frame.size.width-34, RATIO_H(80));
            [_backgroundView addSubview:btn];
            if (i != 0) {
                //循环创建线条
                UILabel *line = [[UILabel alloc] init];
                line.frame = CGRectMake(btn.frame.origin.x+5, btn.frame.origin.y, btn.frame.size.width+20, 1);
                line.backgroundColor = RGB(220, 220, 220);
                [_backgroundView addSubview:line];
            }
            UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            closeBtn.tag                        = 200 + i;
            closeBtn.titleLabel.font            = [UIFont systemFontOfSize:15];
            [closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            closeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            [closeBtn setImage:[UIImage imageNamed:@"icon_close"] forState:UIControlStateNormal];
            [closeBtn addTarget:self action:@selector(clickCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
            closeBtn.hidden = YES;
            closeBtn.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
            closeBtn.frame = CGRectMake(_backgroundView.frame.size.width-32, RATIO_H(80)*i+(RATIO_H(80)-30)/2+8, 30, 30);
            [_backgroundView addSubview:closeBtn];
            
        }
        
        //添加手势
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidden:)]];
    }
    return self;
}

- (void)setTitleColor:(UIColor *)titleColor {
    for (UIButton *titleButton in _backgroundView.subviews) {
        [titleButton setTitleColor:_titleColor forState:UIControlStateNormal];
    }
}

//显示
- (void)showInView:(UIView *)view {
    CGRect fram = _backgroundView.frame;
    for (UIView *subview in view.subviews) {
        if ([subview isKindOfClass:[self class]]) {
            [subview removeFromSuperview];
        }
    }
    [view addSubview:self];
    for (UIView *subView in _backgroundView.subviews) {
        subView.hidden = YES;
    }
    _backgroundView.frame = CGRectMake(_backgroundView.frame.origin.x, _backgroundView.frame.origin.y, _backgroundView.frame.size.width, 40);
    [UIView animateWithDuration:0.2 animations:^{
        _backgroundView.frame = fram;
        
    } completion:^(BOOL finished) {
        for (UIView *subView in _backgroundView.subviews) {
            subView.hidden = NO;
        }
    }];
}

#pragma mark - UIbuttonEvent
- (void)clickBtn:(UIButton *)btn {
    if (_eventTouchSelf) {
        _eventTouchSelf(btn);
    }
}

- (void)clickCloseBtn:(UIButton *)btn {
    if (self.eventTouchCloseBtn) {
        self.eventTouchCloseBtn(btn);
    }
}

- (void)hidden:(UITapGestureRecognizer *)tap {
    CGPoint point = [tap locationInView:self];
    
    if (CGRectContainsPoint(_backgroundView.frame, point)) {
        return;
    }
    
    [self cancle];
}

//消失
- (void)cancle {
    [UIView animateWithDuration:0.35 animations:^{
        self.alpha = 0;
        _backgroundView.frame = CGRectMake(_backgroundView.frame.origin.x, _backgroundView.frame.origin.y, _backgroundView.frame.size.width, 40);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
