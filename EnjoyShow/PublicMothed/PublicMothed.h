//
//  PublicMothed.h
//  EnjoyShow
//
//  Created by 达联 on 2018/7/4.
//  Copyright © 2018年 Riber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PublicMothed : NSObject

/**
 * 单利对象
 */
+ (PublicMothed *)sharObject;
/**
 *
 * 根据字符数和定高，获取控件的宽度
 * height 控件的高度
 * fontSize  文本的字体大小
 * message  文本内容
 *
 */
+ (CGFloat)getWidthWithFixedHeight:(CGFloat)height andWordFont:(CGFloat)fontSize andMessage:(NSString *)message;
/**
 *
 * 根据字符数和定宽，获取控件的宽度
 * width 控件的宽度
 * fontSize  文本的字体大小
 * message  文本内容
 *
 */
+ (CGFloat)getHeightWithFixedWidth:(CGFloat)width andWordFont:(CGFloat)fontSize andMessage:(NSString *)message;
/**
 * 弹出通知界面---alertView
 * titleArr 功能数组
 * titleStr  标题
 * messageStr 提示文本
 */
#pragma mark - 显示alertview在界面上
+ (void)showAlertViewFromScreenWithWithArr:(NSArray *)titleArr andTitle:(NSString *)titleStr andMessage:(NSString *)messageStr andWithMethod:(void(^)(int index))doSomething;
/**
 * 弹出通知界面---ActionSheet
 * titleArr 功能数组
 * titleStr  标题
 * messageStr 提示文本
 */
#pragma mark - 显示ActionSheet在界面上
+ (void)showActionSheetViewFromScreenWithArr:(NSArray *)titleArr andTitle:(NSString *)titleStr andMessage:(NSString *)messageStr andWithMethod:(void(^)(int index))doSomething;






/**
 *  这个方法可以抽取到 UIImage 的分类中
 *  将色值转化成图片
 *  color 要转化的颜色
 */
+ (UIImage *)getImgWithColor:(UIColor *)color;
/**
 *
 *  16进制颜色(html颜色值)字符串转为UIColor
 *  stringToConvert  16进制的字符串
 *
 */
+ (UIColor *)colorWithStr:(NSString *)stringToConvert;


@end
