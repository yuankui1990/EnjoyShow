//
//  PublicCreateUI.h
//  com.erp.bas
//
//  Created by 陈元奎 on 2017/2/28.
//  Copyright © 2017年 com.erp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PublicCreateUI : NSObject

//创建Lable
+ (UILabel *)lableWithFrame:(CGRect)rect Title:(NSString *)title Font:(CGFloat)bord Color:(UIColor *)color;
//创建button
+ (UIButton *)buttonWithFrame:(CGRect)rect Title:(NSString *)title Font:(CGFloat)bord Color:(UIColor *)color;
//创建textField
+ (UITextField *)textFieldWithFrame:(CGRect)rect Font:(CGFloat)bord Color:(UIColor *)color Type:(UIKeyboardType)type;
//创建textView
+ (UITextView *)textViewWithFrame:(CGRect)rect Font:(CGFloat)bord Color:(UIColor *)color Type:(UIKeyboardType)type;
//创建imageView
+ (UIImageView *)imageViewWithFrame:(CGRect)rect PlaceholdImage:(UIImage *)placeImg;
//创建view
+ (UIView *)viewWithFrame:(CGRect)rect BackColor:(UIColor *)color;
//创建scrollView
+ (UIScrollView *)scrollViewWithFrame:(CGRect)rect showH:(BOOL)hBoo showW:(BOOL)wBoo BackColor:(UIColor *)color;
//创建tableView
+ (UITableView *)tableViewWithFrame:(CGRect)rect showH:(BOOL)hBoo showW:(BOOL)wBoo BackColor:(UIColor *)color;
//创建导航栏头视图
+(UIView *)navigationTitleView:(NSString *)title subTitle:(NSString *)subTitle;
@end
