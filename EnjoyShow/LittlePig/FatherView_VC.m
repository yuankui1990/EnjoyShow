//
//  FatherView_VC.m
//  LittlePig
//
//  Created by 达联 on 2018/6/26.
//  Copyright © 2018年 Riber. All rights reserved.
//

#import "FatherView_VC.h"

@interface FatherView_VC ()

@end

@implementation FatherView_VC {
    
    NSInteger _hidenControlOptions;
    CGFloat _scrolOffsetY;
    UIScrollView * _keyScrollView;
    CGFloat _alpha;
    UIImage * _navBarBackgroundImage;
}
- (void)setKeyScrollView:(UIScrollView * )keyScrollView scrolOffsetY:(CGFloat)scrolOffsetY options:(MyHidenControlOptions)options{
    
    _keyScrollView = keyScrollView;
    _hidenControlOptions = options;
    _scrolOffsetY = scrolOffsetY;
    
    [_keyScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    CGPoint point = _keyScrollView.contentOffset;
    _alpha =  point.y/_scrolOffsetY;
    _alpha = (_alpha <= 0)?0:_alpha;
    _alpha = (_alpha >= 1)?1:_alpha;
    
    [self setNavSubViewsAlpha];
}



- (void)dealloc{
    
    [_keyScrollView removeObserver:self forKeyPath:@"contentOffset" context:nil];
}


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:(BOOL)animated];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _navBarBackgroundImage = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
    });
    
    
    //设置背景图片
    [self.navigationController.navigationBar setBackgroundImage:_navBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
    //清除边框，设置一张空的图片
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    [self setNavSubViewsAlpha];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self setNavSubViewsAlpha];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:1];
    
}

- (void)setNavSubViewsAlpha {
    
    self.navigationItem.leftBarButtonItem.customView.alpha = _hidenControlOptions & 1?_alpha:1;
    self.navigationItem.titleView.alpha = _hidenControlOptions >> 1 & 1 ?_alpha:1;
    self.navigationItem.rightBarButtonItem.customView.alpha = _hidenControlOptions >> 2 & 1?_alpha:1;
    [[[self.navigationController.navigationBar subviews]objectAtIndex:0] setAlpha:_alpha];
}
- (void)setNavSubViewsAlpha:(CGFloat)alphaValue andOption:(MyHidenControlOptions)options {
    _hidenControlOptions = options;
    self.navigationItem.leftBarButtonItem.customView.alpha = _hidenControlOptions & 1?alphaValue:1;
    self.navigationItem.titleView.alpha = _hidenControlOptions >> 1 & 1 ?alphaValue:1;
    self.navigationItem.rightBarButtonItem.customView.alpha = _hidenControlOptions >> 2 & 1?alphaValue:1;
    [[[self.navigationController.navigationBar subviews]objectAtIndex:0] setAlpha:alphaValue];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
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
