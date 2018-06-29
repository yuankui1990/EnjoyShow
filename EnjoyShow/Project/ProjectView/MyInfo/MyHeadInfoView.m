//
//  MyHeadInfoView.m
//  EnjoyShow
//
//  Created by 达联 on 2018/6/29.
//  Copyright © 2018年 Riber. All rights reserved.
//

#import "MyHeadInfoView.h"

@implementation MyHeadInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *headImage = GetImage(@"headInfo");
        self.frame = CGRectMake(0, 0, WINDOW_W, WINDOW_W*headImage.size.height/headImage.size.width);
        UIImageView *headImgView = [[UIImageView alloc] initWithFrame:self.frame];
        headImgView.image = headImage;
        [self addSubview:headImgView];
    }
    return self;
}

@end
