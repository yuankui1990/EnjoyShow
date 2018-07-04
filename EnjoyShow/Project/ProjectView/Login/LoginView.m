//
//  LoginView.m
//  grain-ios
//
//  Created by 达联 on 2017/3/13.
//  Copyright © 2017年 grain-ios. All rights reserved.
//

#import "LoginView.h"
#import "PublicCreateUI.h"
#import "PullDownView.h"
#import "PublicMothed.h"

#define RATIO_W(__value__) (__value__/750.0)*WINDOW_W
#define RATIO_H(__value__) (__value__/1334.0)*WINDOW_H


@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _isLoginFree = YES;
//        _codeStr = Str_Format(@"%.4d",arc4random()%10000);
        _codeStr = [self getRandomStringWithNum:4];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)]];
        self.mainScrollView = [PublicCreateUI scrollViewWithFrame:frame showH:NO showW:NO BackColor:[UIColor whiteColor]];
        [self.mainScrollView setContentSize:CGSizeMake(frame.size.width, frame.size.height)];
        self.mainScrollView.contentOffset = CGPointMake(0, 0);
        [self addSubview:self.mainScrollView];
        UIImageView *loginBgView = [PublicCreateUI imageViewWithFrame:CGRectMake(0, 0, VIEW_W(self.mainScrollView), VIEW_H(self.mainScrollView)) PlaceholdImage:[UIImage imageNamed:@"login_bg"]];
        [self.mainScrollView addSubview:loginBgView];
        
        UIImage *dograin_bg = [UIImage imageNamed:@"dograin_bg"];
        self.headImageView = [PublicCreateUI imageViewWithFrame:CGRectMake((WINDOW_W-dograin_bg.size.width)/2, RATIO_H(134), dograin_bg.size.width, dograin_bg.size.height) PlaceholdImage:dograin_bg];
        [self.mainScrollView addSubview:self.headImageView];
        UILabel *titleLabel = [PublicCreateUI lableWithFrame:CGRectMake(0, VIEW_Y(self.headImageView)+VIEW_H(self.headImageView)+RATIO_H(20), WINDOW_W, RATIO_H(46)+5) Title:@"智能粮库" Font:1 Color:[UIColor whiteColor]];
        titleLabel.font = [UIFont systemFontOfSize:RATIO_H(46)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.mainScrollView addSubview:titleLabel];
        
        CGFloat fontValue = RATIO_H(28);
        UIImage *warnImage = [UIImage imageNamed:@"icon_warn"];
        CGFloat warnWidth = [PublicMothed getWidthWithFixedHeight:fontValue+2 andWordFont:fontValue andMessage:@"登录名或密码错误!"];
        self.warnLabel = [PublicCreateUI lableWithFrame:CGRectMake((WINDOW_W-warnWidth)/2+warnImage.size.width*2/3, VIEW_Y(titleLabel)+VIEW_H(titleLabel)+RATIO_H(96), warnWidth, fontValue+2) Title:@"登录名或密码错误!" Font:fontValue Color:[PublicMothed colorWithStr:@"#fffc01"]];
        self.warnLabel.hidden = YES;
        [self.mainScrollView addSubview:self.warnLabel];
        self.warnImgView = [PublicCreateUI imageViewWithFrame:CGRectMake(0, 0, warnImage.size.width, warnImage.size.height) PlaceholdImage:warnImage];
        self.warnImgView.center = CGPointMake(VIEW_X(self.warnLabel)-warnImage.size.width/2-RATIO_W(14), VIEW_Y(self.warnLabel)+VIEW_H(self.warnLabel)/2);
        self.warnImgView.hidden = YES;
        [self.mainScrollView addSubview:self.warnImgView];
        
        
        UIView *accountBgView = [PublicCreateUI viewWithFrame:CGRectMake((WINDOW_W-RATIO_W(560))/2, VIEW_Y(self.warnLabel)+VIEW_H(self.warnLabel)+RATIO_H(30), RATIO_W(560), RATIO_H(80)) BackColor:[UIColor whiteColor]];
        accountBgView.tag = 200;
        ViewRadius(accountBgView, RATIO_W(40));
        [self.mainScrollView addSubview:accountBgView];
        UIImage *accountImage = [UIImage imageNamed:@"icon_name"];
        UIImageView *accountImageView = [PublicCreateUI imageViewWithFrame:CGRectMake(RATIO_W(50), (VIEW_H(accountBgView)-accountImage.size.height)/2, accountImage.size.width, accountImage.size.height) PlaceholdImage:accountImage];
        [accountBgView addSubview:accountImageView];
        self.userNameTextField = [PublicCreateUI textFieldWithFrame:CGRectMake(VIEW_X(accountImageView)+VIEW_W(accountImageView)+RATIO_W(16), 0, VIEW_W(accountBgView)-RATIO_W(50)-VIEW_W(accountImageView)-RATIO_W(20), VIEW_H(accountBgView)) Font:RATIO_W(30) Color:[PublicMothed colorWithStr:@"#02c690"] Type:UIKeyboardTypeDefault];
        [self.userNameTextField addTarget:self action:@selector(textFieldEditingChanged) forControlEvents:UIControlEventEditingChanged];
        self.userNameTextField.backgroundColor = [UIColor whiteColor];
//        if (nil != nil) {
//            UIButton *rightBtn = [PublicCreateUI buttonWithFrame:CGRectMake(0, 0, 40, 40) Title:@"" Font:15 Color:[UIColor blackColor]];
//            [rightBtn setImage:[UIImage imageNamed:@"icon_login_dropjt"] forState:UIControlStateNormal];
//            [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
//            self.userNameTextField.rightView = rightBtn;
//            self.userNameTextField.rightViewMode = UITextFieldViewModeAlways;
//        }
        self.userNameTextField.delegate = self;
        self.userNameTextField.placeholder = @"请输入账号";
        self.userNameTextField.borderStyle = UITextBorderStyleNone;
        self.userNameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [accountBgView addSubview:self.userNameTextField];
        
        
        UIImage *pswImage = [UIImage imageNamed:@"icon_psw"];
        UIView *pswBgView = [PublicCreateUI viewWithFrame:CGRectMake((WINDOW_W-RATIO_W(560))/2, VIEW_Y(accountBgView)+VIEW_H(accountBgView)+RATIO_H(30), RATIO_W(560), RATIO_H(80)) BackColor:[UIColor whiteColor]];
        ViewRadius(pswBgView, RATIO_W(40));
        [self.mainScrollView addSubview:pswBgView];
        UIImageView *pswImageView = [PublicCreateUI imageViewWithFrame:CGRectMake(RATIO_W(50), (VIEW_H(pswBgView)-pswImage.size.height)/2, pswImage.size.width, pswImage.size.height) PlaceholdImage:pswImage];
        [pswBgView addSubview:pswImageView];
        
        self.userPswTextField = [PublicCreateUI textFieldWithFrame:CGRectMake(VIEW_X(pswImageView)+VIEW_W(pswImageView)+RATIO_W(16), 0, VIEW_W(accountBgView)-RATIO_W(50)-VIEW_W(accountImageView)-RATIO_W(20), VIEW_H(pswBgView)) Font:RATIO_W(30) Color:[PublicMothed colorWithStr:@"#02c690"] Type:UIKeyboardTypeDefault];
        [self.userPswTextField addTarget:self action:@selector(textFieldEditingChanged) forControlEvents:UIControlEventEditingChanged];
        self.userPswTextField.backgroundColor = [UIColor whiteColor];
        self.userPswTextField.delegate = self;
        self.userPswTextField.placeholder = @"请输入密码";
        self.userPswTextField.borderStyle = UITextBorderStyleNone;
        self.userPswTextField.secureTextEntry = YES;
        self.userPswTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [pswBgView addSubview:self.userPswTextField];
        

        self.codeTextField = [PublicCreateUI textFieldWithFrame:CGRectMake(VIEW_X(pswBgView), VIEW_Y(pswBgView)+VIEW_H(pswBgView)+RATIO_H(30), RATIO_W(240), RATIO_H(80)) Font:RATIO_H(30) Color:[PublicMothed colorWithStr:@"#02c690"] Type:UIKeyboardTypeASCIICapable];
        [self.codeTextField addTarget:self action:@selector(textFieldEditingChanged) forControlEvents:UIControlEventEditingChanged];
        self.codeTextField.delegate = self;
        ViewRadius(self.codeTextField, RATIO_W(40));
        self.codeTextField.backgroundColor = [UIColor whiteColor];
        self.codeTextField.textAlignment = NSTextAlignmentCenter;
        self.codeTextField.placeholder = @"请输入验证码";
        [self.mainScrollView addSubview:self.codeTextField];
        
        self.codeImgBtnView = [PublicCreateUI buttonWithFrame:CGRectMake(VIEW_X(self.codeTextField)+VIEW_W(self.codeTextField)+RATIO_W(40), VIEW_Y(self.codeTextField), RATIO_W(150), RATIO_H(80)) Title:_codeStr Font:RATIO_W(30) Color:[PublicMothed colorWithStr:@"#03B182"]];
        ViewRadius(self.codeImgBtnView, RATIO_W(10));
        self.codeImgBtnView.backgroundColor = [PublicMothed colorWithStr:@"#31F9C3"];
        [self.mainScrollView addSubview:self.codeImgBtnView];
        
        self.codeButton = [PublicCreateUI buttonWithFrame:CGRectMake(VIEW_X(self.codeImgBtnView)+VIEW_W(self.codeImgBtnView)+RATIO_W(40), VIEW_Y(self.codeTextField), VIEW_W(pswBgView)-VIEW_W(self.codeTextField)-VIEW_W(self.codeImgBtnView)-RATIO_W(80), RATIO_H(80)) Title:@"换一张" Font:RATIO_W(26) Color:[UIColor whiteColor]];
        [self.codeButton addTarget:self action:@selector(codeButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.mainScrollView addSubview:self.codeButton];
        
        self.choseButton = [PublicCreateUI buttonWithFrame:CGRectMake(VIEW_X(accountBgView), VIEW_Y(self.codeTextField)+VIEW_H(self.codeTextField)+RATIO_H(30), RATIO_W(34), RATIO_H(34)) Title:@"" Font:1 Color:[UIColor clearColor]];
        ViewRadiusAndLine(self.choseButton, 0, RATIO_W(2), [UIColor whiteColor]);
        [self.choseButton setImage:[UIImage imageNamed:@"icon_chose"] forState:UIControlStateNormal];
        [self.choseButton addTarget:self action:@selector(choseButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.mainScrollView addSubview:self.choseButton];
        
        UILabel *choseTitleLabel = [PublicCreateUI lableWithFrame:CGRectMake(VIEW_X(self.choseButton)+VIEW_W(self.choseButton)+RATIO_W(22), VIEW_Y(self.choseButton), VIEW_W(accountBgView)-80, VIEW_H(self.choseButton)) Title:@"十天内免登录" Font:RATIO_W(26) Color:[UIColor whiteColor]];
        [self.mainScrollView addSubview:choseTitleLabel];
        
        
        UIImage *btnImage = [UIImage imageNamed:@"login_btn"];
        self.loginButton = [PublicCreateUI buttonWithFrame:CGRectMake((WINDOW_W-RATIO_W(560))/2, VIEW_Y(self.choseButton)+VIEW_H(self.choseButton)+RATIO_H(30), RATIO_W(560), RATIO_H(80)) Title:@"" Font:RATIO_W(36) Color:[UIColor whiteColor]];
        ViewRadius(self.loginButton, RATIO_W(40));
        [self.loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
//        [self.loginButton setBackgroundImage:btnImage forState:UIControlStateNormal];
        [self.loginButton setBackgroundImage:[PublicMothed getImgWithColor:[PublicMothed colorWithStr:@"e6e6e6"]] forState:UIControlStateNormal];
        [self.loginButton setTitleColor:[PublicMothed colorWithStr:@"#999999"] forState:UIControlStateNormal];
        [self.mainScrollView addSubview:self.loginButton];
        
        UIImage *imgBg = [UIImage imageNamed:@"icon_bg_img"];
        UIImageView *imgBgView = [PublicCreateUI imageViewWithFrame:CGRectMake((WINDOW_W-imgBg.size.width)/2, VIEW_Y(self.loginButton)+VIEW_H(self.loginButton)+RATIO_H(70), imgBg.size.width, imgBg.size.height) PlaceholdImage:imgBg];
        [self.mainScrollView addSubview:imgBgView];
        
        UIImage *setImage = [UIImage imageNamed:@"icon_security"];
        self.settingButton = [PublicCreateUI buttonWithFrame:CGRectMake(WINDOW_W-setImage.size.width-RATIO_W(30), RATIO_H(68), setImage.size.width, setImage.size.height) Title:@"" Font:11 Color:[UIColor clearColor]];
        [self.settingButton setBackgroundImage:setImage forState:UIControlStateNormal];
        ViewRadiusAndLine(self.settingButton, 5, 0, [UIColor clearColor]);
        [self.mainScrollView addSubview:self.settingButton];
    }
    return self;
}
/**
 * 生成验证码
 */
- (void)codeButtonClick {
//    self.codeStr = Str_Format(@"%.4d",arc4random()%10000);
    self.codeStr = [self getRandomStringWithNum:4];
    [self.codeImgBtnView setTitle:self.codeStr forState:UIControlStateNormal];
}
/**
 * 登录按钮点击事件
 */
- (void)loginButtonClick {
    if (self.loginButtonAction) {
        self.loginButtonAction(self.userNameTextField.text , self.userPswTextField.text);
    }
}
- (void)choseButtonClick {
    if (self.isLoginFree) {
        self.isLoginFree = NO;
        [self.choseButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    } else {
        self.isLoginFree = YES;
        [self.choseButton setImage:[UIImage imageNamed:@"icon_chose"] forState:UIControlStateNormal];
    }
}
/**
 * 文本编辑
 */
- (void)textFieldEditingChanged {
    self.warnLabel.hidden = YES;
    self.warnImgView.hidden = YES;
    if ([self.userNameTextField.text length] > 0 && [self.userPswTextField.text length] > 0 && [self.codeTextField.text length] > 0) {
        [self.loginButton setBackgroundImage:[UIImage imageNamed:@"login_btn"] forState:UIControlStateNormal];
        [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    } else {
        [self.loginButton setBackgroundImage:[PublicMothed getImgWithColor:[PublicMothed colorWithStr:@"e6e6e6"]] forState:UIControlStateNormal];
        [self.loginButton setTitleColor:[PublicMothed colorWithStr:@"#999999"] forState:UIControlStateNormal];
    }
}

- (void)rightBtnClick {
    NSArray *userArr = getObjectFromUserDefault(@"userArr");
    UIView *accountBgView = [self.mainScrollView viewWithTag:200];
    NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:userArr];
    CGRect rect = [self convertRect:accountBgView.frame toView:nil];
    rect = CGRectMake(rect.origin.x, rect.origin.y+VIEW_H(accountBgView), RATIO_W(560), rect.size.height);
    PullDownView *rightView = [[PullDownView alloc] initWithContents:arr andRect:rect];
    __weak PullDownView *weakSelf = rightView;
    //点击事件
    rightView.eventTouchSelf = ^(UIButton *btn){
        self.userNameTextField.text = userArr[btn.tag-100];

        [weakSelf cancle];
    };
    rightView.eventTouchCloseBtn = ^(UIButton *btn){
        [arr removeObjectAtIndex:btn.tag-200];
        [[NSUserDefaults standardUserDefaults] setObject:arr forKey:@"userArr"];

        [weakSelf cancle];
    };
    [rightView showInView:[[UIApplication sharedApplication].delegate window]];
}

- (void)tapAction {
    [self endEditing:YES];
}
- (NSString *)getRandomStringWithNum:(NSInteger)num {
    NSString *string = [[NSString alloc] init];
    for (int i = 0; i < num; i++) {
        int number = arc4random() % 10;
        if (number%2 == 0) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            string = [string stringByAppendingString:tempString];
        }else {
            int figure = (arc4random() % 26) + 65;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        }
    }
    return string;
}
@end
