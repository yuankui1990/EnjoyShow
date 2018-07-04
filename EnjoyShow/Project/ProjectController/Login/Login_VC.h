//
//  Login_VC.h
//  grain-ios
//
//  Created by 达联 on 2017/3/13.
//  Copyright © 2017年 grain-ios. All rights reserved.
//

#import "FatherView_VC.h"
#import "LoginView.h"

@interface Login_VC : FatherView_VC

@property (nonatomic , strong) NSString *sysUrl;
@property (nonatomic , strong) LoginView *loginView;
@property (nonatomic , copy) void(^loginOk)();
@property (nonatomic , assign) BOOL isShowSet;


@end
