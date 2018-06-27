//
//  PublicCreateUI.m
//  com.erp.bas
//
//  Created by 陈元奎 on 2017/2/28.
//  Copyright © 2017年 com.erp. All rights reserved.
//

#import "PublicCreateUI.h"

@implementation PublicCreateUI


//创建Lable
+ (UILabel *)lableWithFrame:(CGRect)rect Title:(NSString *)title Font:(CGFloat)bord Color:(UIColor *)color {
    UILabel *lable = [[UILabel alloc] initWithFrame:rect];
    lable.font = [UIFont systemFontOfSize:bord];
    lable.textColor = color;
    lable.numberOfLines = 0;
    lable.text = title;
    return lable;
}
//创建button
+ (UIButton *)buttonWithFrame:(CGRect)rect Title:(NSString *)title Font:(CGFloat)bord Color:(UIColor *)color {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = rect;
    button.titleLabel.font = [UIFont systemFontOfSize:bord];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}
//创建textField
+ (UITextField *)textFieldWithFrame:(CGRect)rect Font:(CGFloat)bord Color:(UIColor *)color Type:(UIKeyboardType)type {
    UITextField *textField = [[UITextField alloc] initWithFrame:rect];
    textField.keyboardType = type;
    textField.font = [UIFont systemFontOfSize:bord];
    textField.borderStyle = UITextBorderStyleNone;
    textField.textColor = color;
    return textField;
}
//创建textView
+ (UITextView *)textViewWithFrame:(CGRect)rect Font:(CGFloat)bord Color:(UIColor *)color Type:(UIKeyboardType)type {
    UITextView *textView = [[UITextView alloc] initWithFrame:rect];
    textView.keyboardType = type;
    textView.font = [UIFont systemFontOfSize:bord];
    textView.textColor = color;
    return textView;
}

//创建imageView
+ (UIImageView *)imageViewWithFrame:(CGRect)rect PlaceholdImage:(UIImage *)placeImg {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.image = placeImg;
    return imageView;
}
//创建view
+ (UIView *)viewWithFrame:(CGRect)rect BackColor:(UIColor *)color {
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = color;
    return view;
}
//创建scrollView
+ (UIScrollView *)scrollViewWithFrame:(CGRect)rect showH:(BOOL)hBoo showW:(BOOL)wBoo BackColor:(UIColor *)color {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:rect];
    scrollView.showsVerticalScrollIndicator = hBoo;
    scrollView.showsHorizontalScrollIndicator = wBoo;
    scrollView.backgroundColor = color;
    [scrollView setContentOffset:CGPointMake(0, 0)];
    [scrollView setContentSize:CGSizeZero];
    return scrollView;
}
//创建tableView
+ (UITableView *)tableViewWithFrame:(CGRect)rect showH:(BOOL)hBoo showW:(BOOL)wBoo BackColor:(UIColor *)color {
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
    tableView.showsVerticalScrollIndicator = hBoo;
    tableView.showsHorizontalScrollIndicator = wBoo;
    tableView.backgroundColor = color;
    return tableView;
}
//创建导航栏头视图
+(UIView *)navigationTitleView:(NSString *)title subTitle:(NSString *)subTitle
{
    UIView *titleView = [PublicCreateUI viewWithFrame:CGRectMake(0, 0, 200, 64) BackColor:[UIColor clearColor]];
    UILabel *topL = [PublicCreateUI lableWithFrame:CGRectMake(0, 5, CGRectGetWidth(titleView.frame), 20) Title:title Font:16 Color:[UIColor whiteColor]];
    topL.textAlignment = NSTextAlignmentCenter;
    UILabel *bottomL = [PublicCreateUI lableWithFrame:CGRectMake(0, 25, CGRectGetWidth(titleView.frame), 17) Title:subTitle Font:11 Color:[UIColor whiteColor]];
    bottomL.textAlignment = NSTextAlignmentCenter;
    [titleView addSubview:topL];
    [titleView addSubview:bottomL];
    return titleView;
}
@end
