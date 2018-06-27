//
//  PublicMothed.h
//  LittlePig
//
//  Created by 达联 on 2018/6/26.
//  Copyright © 2018年 Riber. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PublicMethod : NSObject


/**
 *  这个方法可以抽取到 UIImage 的分类中
 *  将色值转化成图片
 *  color 要转化的颜色
 */
+ (UIImage *)getImgWithColor:(UIColor *)color;



@end
