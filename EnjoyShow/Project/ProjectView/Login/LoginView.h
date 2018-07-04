//
//  LoginView.h
//  grain-ios
//
//  Created by 达联 on 2017/3/13.
//  Copyright © 2017年 grain-ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView<UITextFieldDelegate>

@property (nonatomic , strong) UIScrollView *mainScrollView;//底部view
@property (nonatomic , strong) UIImageView *headImageView;//头像ImageView
@property (nonatomic , strong) UIImageView *warnImgView;//警告提示图片
@property (nonatomic , strong) UILabel *warnLabel;//提示文本
@property (nonatomic , strong) UITextField *userNameTextField;//用户名
@property (nonatomic , strong) UITextField *userPswTextField;//用户密码
@property (nonatomic , strong) UITextField *codeTextField;//验证码文本
@property (nonatomic , strong) UIButton *codeImgBtnView;//验证码图片
@property (nonatomic , strong) UIButton *codeButton;//换一张验证码按钮
@property (nonatomic , assign) BOOL isLoginFree;//是否为免登陆
@property (nonatomic , strong) UIButton *choseButton;//选择按钮

@property (nonatomic , strong) UIButton *loginButton;//登录按钮
@property (nonatomic , strong) UIButton *settingButton;//设置按钮
@property (nonatomic , strong) NSString *codeStr;//验证码

@property (nonatomic , copy) void(^loginButtonAction)();//登录回调

@end
