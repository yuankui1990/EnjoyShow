//
//  FatherView_VC.h
//  LittlePig
//
//  Created by 达联 on 2018/6/26.
//  Copyright © 2018年 Riber. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, MyHidenControlOptions) {
    
    MyHidenControlOptionLeft = 0x01,
    MyHidenControlOptionTitle = 0x01 << 1,
    MyHidenControlOptionRight = 0x01 << 2,
    
};

@interface FatherView_VC : UIViewController

- (void)setNavSubViewsAlpha:(CGFloat)alphaValue andOption:(MyHidenControlOptions)options;
- (void)setKeyScrollView:(UIScrollView * )keyScrollView scrolOffsetY:(CGFloat)scrolOffsetY options:(MyHidenControlOptions)options;




@end
