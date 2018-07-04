//
//  Login_VC.m
//  grain-ios
//
//  Created by 达联 on 2017/3/13.
//  Copyright © 2017年 grain-ios. All rights reserved.
//

#import "Login_VC.h"

@interface Login_VC ()<UITextFieldDelegate>

@end

@implementation Login_VC

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillhiddin:) name:UIKeyboardWillHideNotification object:nil];
    if (self.isShowSet) {
        self.loginView.settingButton.hidden = NO;
        self.navigationItem.leftBarButtonItem = nil;
    } else {
        self.loginView.settingButton.hidden = YES;
    }
}
- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
- (void)viewDidDisappear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewDidLoad {
    self.navigationController.navigationBar.hidden = YES;
    [super viewDidLoad];
    self.title = @"登录";
    
    [self createUI];
    
}

- (void)createUI {
    __weak typeof(self)weakSelf = self;
    self.loginView = [[LoginView alloc] initWithFrame:self.view.frame];
    self.loginView.loginButtonAction = ^(NSString *userName,NSString *userPsw){
        if (userName.length == 0) {
            [PublicMothed showAlertViewFromScreenWithWithArr:@[@"知道了"] andTitle:@"提示" andMessage:@"请填写用户名" andWithMethod:^(int index) {
                
            }];
            return;
        }
        if (userPsw.length == 0) {
            [PublicMothed showAlertViewFromScreenWithWithArr:@[@"知道了"] andTitle:@"提示" andMessage:@"请填写用户密码" andWithMethod:^(int index) {
                
            }];
            return;
        }
        if ([weakSelf.loginView.codeTextField.text length] == 0) {
            [[Toast shareInstance] makeToast:@"请输入的验证码!" duration:REMAINDTIME];
            return;
        }
        BOOL result = [weakSelf.loginView.codeTextField.text caseInsensitiveCompare:weakSelf.loginView.codeStr] == NSOrderedSame;
        if (!result) {
            [[Toast shareInstance] makeToast:@"您所输入的验证码有误，请重新输入!" duration:REMAINDTIME];
            return;
        }
        weakSelf.loginView.warnImgView.hidden = YES;
        weakSelf.loginView.warnLabel.hidden = YES;
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
        
    };
    [self.view addSubview:self.loginView];
    
}


- (void)saveUserInfoWithDict:(NSDictionary *)dict {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userInfo"];
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    if ([dict isKindOfClass:[NSString class]]) {
        return;
    }
    for (NSString *key in dict.allKeys) {
        [userInfo setObject:[NSString stringWithFormat:@"%@",dict[key]] forKey:key];
    }
    [userInfo setObject:self.loginView.userPswTextField.text forKey:@"psw"];
    NSString *timeStr = [NSString stringWithFormat:@"%ld",(long)[[NSDate date] timeIntervalSince1970]];
    [userInfo setObject:timeStr forKey:@"loginTime"];
    [[NSUserDefaults standardUserDefaults] setObject:userInfo forKey:@"userInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//点击屏幕关闭键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

//登录按您点击事件
- (void)loginButtonClick {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}




//键盘将要出现
- (void)keyBoardWillShow:(NSNotification *)notificat {
    NSDictionary *keyDic = [notificat userInfo];
    CGFloat keyBoardHeight = [keyDic[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue].size.height;
    [self.loginView.mainScrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+keyBoardHeight)];
}
//键盘将要影藏
- (void)keyBoardWillhiddin:(NSNotification *)notificat {
    self.loginView.mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
