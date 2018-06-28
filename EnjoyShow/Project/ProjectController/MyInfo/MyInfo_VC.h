//
//  MyInfo_VC.h
//  EnjoyShow
//
//  Created by 达联 on 2018/6/27.
//  Copyright © 2018年 Riber. All rights reserved.
//

#import "FatherView_VC.h"

@interface MyInfo_VC : FatherView_VC<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , strong) UITableView *mainTableView;//**  底部滑动视图  */
@property (nonatomic , strong) UICollectionView *mainCollectionView;//**  底部视图  */
@property (nonatomic , strong) UIView *headView;//**  头部view  */


@end
