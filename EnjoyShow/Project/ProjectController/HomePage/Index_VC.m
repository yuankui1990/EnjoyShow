//
//  Index_VC.m
//  LittlePig
//
//  Created by 达联 on 2018/6/26.
//  Copyright © 2018年 Riber. All rights reserved.
//

#import "Index_VC.h"
#import "IndexNavTitleView.h"

@interface Index_VC ()

@end

@implementation Index_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
    
}
/**
 * 创建UI
 */
- (void)createUI {
    self.navTitleView = [[IndexNavTitleView alloc] initWithFrame:CGRectZero];
    self.navigationItem.titleView = self.navTitleView;
    [self methodBlock];
}



- (void)methodBlock {
    self.navTitleView.peopleShowBlock = ^{
        NSLog(@"peopleShowBlock");
    };
    self.navTitleView.skyShowBlock = ^{
        NSLog(@"skyShowBlock");
    };
    self.navTitleView.earthShowBlock = ^{
        NSLog(@"earthShowBlock");
    };
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
