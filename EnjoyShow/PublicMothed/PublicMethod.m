//
//  PublicMothed.m
//  LittlePig
//
//  Created by 达联 on 2018/6/26.
//  Copyright © 2018年 Riber. All rights reserved.
//


#import "PublicMethod.h"

@implementation PublicMethod


/**
 *  这个方法可以抽取到 UIImage 的分类中
 *  将色值转化成图片
 *  color 要转化的颜色
 */
+ (UIImage *)getImgWithColor:(UIColor *)color {
    NSParameterAssert(color != nil);
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
