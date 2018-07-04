//
//  PublicMothed.m
//  EnjoyShow
//
//  Created by 达联 on 2018/7/4.
//  Copyright © 2018年 Riber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicMothed.h"



@implementation PublicMothed





/**
 * 单利对象
 */
+ (PublicMothed *)sharObject {
    static PublicMothed *public = nil;
    if (!public) {
        public = [[PublicMothed alloc] init];
    }
    return public;
}
/**
 *
 * 根据字符数和定高，获取控件的宽度
 * height 控件的高度
 * fontSize  文本的字体大小
 * message  文本内容
 *
 */
+ (CGFloat)getWidthWithFixedHeight:(CGFloat)height andWordFont:(CGFloat)fontSize andMessage:(NSString *)message {
    CGRect rect = [message boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil];
    if (rect.size.width < 20) {
        return 20;
    } else {
        return rect.size.width;
    }
}
/**
 *
 * 根据字符数和定宽，获取控件的宽度
 * width 控件的宽度
 * fontSize  文本的字体大小
 * message  文本内容
 *
 */
+ (CGFloat)getHeightWithFixedWidth:(CGFloat)width andWordFont:(CGFloat)fontSize andMessage:(NSString *)message {
    CGRect rect = [message boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil];
    return rect.size.height;
}
/**
 * 弹出通知界面---alertView
 * titleArr 功能数组
 * titleStr  标题
 * messageStr 提示文本
 */
#pragma mark - 显示alertview在界面上
+ (void)showAlertViewFromScreenWithWithArr:(NSArray *)titleArr andTitle:(NSString *)titleStr andMessage:(NSString *)messageStr andWithMethod:(void(^)(int index))doSomething {
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert];
    for (int i = 0; i < titleArr.count; i++) {
        if ([[titleArr[i] stringByReplacingOccurrencesOfString:@" " withString:@""] isEqualToString:@"取消"] && titleArr.count > 2) {
            UIAlertAction *action = [UIAlertAction actionWithTitle:titleArr[i] style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                doSomething(i);
            }];
            [alertView addAction:action];
        }else{
            UIAlertAction *action = [UIAlertAction actionWithTitle:titleArr[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                doSomething(i);
            }];
            [alertView addAction:action];
        }
    }
    
    [[[PublicMothed sharObject] topViewController] presentViewController:alertView animated:YES completion:nil];
}
/**
 * 弹出通知界面---ActionSheet
 * titleArr 功能数组
 * titleStr  标题
 * messageStr 提示文本
 */
#pragma mark - 显示ActionSheet在界面上
+ (void)showActionSheetViewFromScreenWithArr:(NSArray *)titleArr andTitle:(NSString *)titleStr andMessage:(NSString *)messageStr andWithMethod:(void(^)(int index))doSomething {
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i = 0; i < titleArr.count; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:titleArr[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            doSomething(i);
        }];
        [alertView addAction:action];
    }
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    
    [alertView addAction:cancelAction];
    [[[PublicMothed sharObject] topViewController] presentViewController:alertView animated:YES completion:nil];
}












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
/**
 *
 *  16进制颜色(html颜色值)字符串转为UIColor
 *  stringToConvert  16进制的字符串
 *
 */
+ (UIColor *)colorWithStr:(NSString *)stringToConvert {
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}


/**
 * 获取最表层试图对象
 */
- (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

@end
