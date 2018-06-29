//
//  MyInfo_VC.h
//  EnjoyShow
//
//  Created by 达联 on 2018/6/27.
//  Copyright © 2018年 Riber. All rights reserved.
//

#import "FatherView_VC.h"
#import "MyHeadInfoView.h"
#import "MyHeadTouchView.h"

@interface MyInfo_VC : FatherView_VC<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , strong) UITableView *mainTableView;//**  底部滑动视图  */
@property (nonatomic , strong) UICollectionView *mainCollectionView;//**  底部视图  */
@property (nonatomic , strong) UIView *headView;//**  头部view  */
@property (nonatomic , strong) MyHeadInfoView *headInfoView;//**  用户信息view  */
@property (nonatomic , strong) MyHeadTouchView *headTouchView;//**  功能点击view  */

@end
