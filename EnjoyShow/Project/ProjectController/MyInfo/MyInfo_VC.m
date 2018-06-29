//
//  MyInfo_VC.m
//  EnjoyShow
//
//  Created by 达联 on 2018/6/27.
//  Copyright © 2018年 Riber. All rights reserved.
//

#import "MyInfo_VC.h"
#import "UIViewController+NavBarHidden.h"
#import "CollectionViewFlowLayout.h"

@interface MyInfo_VC ()<UICollectionViewDelegate,UICollectionViewDataSource> {
    UIImageView *headImageView;
}

@end

@implementation MyInfo_VC


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self hy_viewDidDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    [self hy_viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self hy_viewWillDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self createUI];
}



/**
 * 创建UI
 */
- (void)createUI {
    
    self.headView = [PublicCreateUI viewWithFrame:CGRectMake(0, 0, WINDOW_W, VIEW_H(self.headInfoView)+60) BackColor:[UIColor blackColor]];
    [self.view addSubview:self.headView];
    [self.headView addSubview:self.headInfoView];

    
    self.mainCollectionView.frame = CGRectMake(0, VIEW_H(self.headView), WINDOW_W, WINDOW_H-VIEW_H(self.headView)-49);
//    self.mainCollectionView.frame = CGRectMake(0, 0, WINDOW_W, WINDOW_H);
    [self.view addSubview:self.mainCollectionView];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"更多" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemAction)];
    
    //设置当有导航栏自动添加64的高度的属性为NO
    self.automaticallyAdjustsScrollViewInsets = NO;
    //导航栏的透明和不透明
//    [self setKeyScrollView:self.mainCollectionView scrolOffsetY:600 options:MyHidenControlOptionLeft | MyHidenControlOptionTitle];
}

#pragma mark -------------按钮点击事件----------------
- (void)rightBarButtonItemAction {
    
}



#define mark ------------tableView 的代理方法------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



#define mark ----------collectView代理方法---------------
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
////    if (section == 0) {
////        return CGSizeMake(WINDOW_W, VIEW_H(self.headInfoView));
////    }else{
////    }
//    return CGSizeMake(WINDOW_W, 60);
//}
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
////    if (indexPath.section == 0) {
////        return self.headInfoView;
////    } else {
////    }
//    self.headTouchView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headTouch" forIndexPath:indexPath];
//    self.headTouchView.backgroundColor = [UIColor redColor];
//    return self.headTouchView;
//}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    if (indexPath.row%2 == 0) {
        cell.backgroundColor = [UIColor orangeColor];
    } else {
        cell.backgroundColor = [UIColor grayColor];
    }
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((WINDOW_W-40)/3, (WINDOW_W-40)/3);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);//分别为上、左、下、右
}
//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}






- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.mainCollectionView.contentOffset.y>0) {
        if (VIEW_Y(self.headView)>-VIEW_H(self.headView)+124) {
            CGFloat headView_Y = VIEW_Y(self.headView)-self.mainCollectionView.contentOffset.y;
            if (headView_Y<-VIEW_H(self.headView)+124) {
                headView_Y = -VIEW_H(self.headView)+124;
            }
            self.headView.frame = CGRectMake(0, headView_Y, VIEW_W(self.headView), VIEW_H(self.headView));
            self.mainCollectionView.contentOffset = CGPointMake(0, 0);
            self.mainCollectionView.frame = CGRectMake(0, VIEW_H(self.headView)+headView_Y, VIEW_W(self.mainCollectionView), WINDOW_H-VIEW_H(self.headView)-headView_Y-49);
            CGFloat alphaValue = ABS(headView_Y)/(VIEW_H(self.headView)-124);
            self.headInfoView.alpha = 1.0-alphaValue;
            [self setNavSubViewsAlpha:alphaValue andOption:MyHidenControlOptionLeft];
        }
    } else {
        if (VIEW_Y(self.headView) < 0) {
            CGFloat headView_Y = VIEW_Y(self.headView)-self.mainCollectionView.contentOffset.y;
            if (headView_Y>0) {
                headView_Y = 0;
            }
            self.headView.frame = CGRectMake(0, headView_Y, VIEW_W(self.headView), VIEW_H(self.headView));
            self.mainCollectionView.contentOffset = CGPointMake(0, 0);
            self.mainCollectionView.frame = CGRectMake(0, VIEW_H(self.headView)+VIEW_Y(self.headView), VIEW_W(self.mainCollectionView), WINDOW_H-headView_Y-49);
            CGFloat alphaValue = ABS(headView_Y)/(VIEW_H(self.headView)-124);
            self.headInfoView.alpha = 1.0-alphaValue;
            [self setNavSubViewsAlpha:alphaValue andOption:MyHidenControlOptionLeft];
        }
    }
    
}
/**
 * mainTableView 的get方法
 */
- (UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [PublicCreateUI tableViewWithFrame:CGRectMake(0, 0, WINDOW_W, WINDOW_H) showH:NO showW:NO BackColor:[UIColor whiteColor]];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}
/**
 * colectionView的get方法
 */
- (UICollectionView *)mainCollectionView {
    if (!_mainCollectionView) {
        CollectionViewFlowLayout *layout = [CollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.naviHeight = 0;
        layout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WINDOW_W, WINDOW_H) collectionViewLayout:layout];
        _mainCollectionView.delegate = self;
        _mainCollectionView.dataSource = self;
        _mainCollectionView.bounces = YES;
        [_mainCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
        [_mainCollectionView registerClass:[MyHeadInfoView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headInfo"];
        [_mainCollectionView registerClass:[MyHeadTouchView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headTouch"];
     }
    return _mainCollectionView;
}
/**
 * 用户信息View
 */
- (MyHeadInfoView *)headInfoView {
    if (!_headInfoView) {
        _headInfoView = [[MyHeadInfoView alloc] initWithFrame:CGRectZero];
    }
    return _headInfoView;
}
/**
 * 功能点击事件View
 */
- (MyHeadTouchView *)headTouchView {
    if (!_headTouchView) {
        _headTouchView = [[MyHeadTouchView alloc] initWithFrame:CGRectMake(0, VIEW_H(_headInfoView), VIEW_W(_headTouchView), 60)];
    }
    return _headTouchView;
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
