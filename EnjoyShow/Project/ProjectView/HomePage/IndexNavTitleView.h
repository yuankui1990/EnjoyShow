//
//  IndexNavTitleView.h
//  EnjoyShow
//
//  Created by 达联 on 2018/6/27.
//  Copyright © 2018年 Riber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexNavTitleView : UIView


@property (nonatomic , strong) UIButton *peopleShow;//**  人秀按钮  */
@property (nonatomic , strong) UIButton *skyShow;//**  天秀按钮  */
@property (nonatomic , strong) UIButton *earthShow;//**  地秀按钮  */

@property (nonatomic , assign) NSInteger showType;//**  当前模式  */

@property (nonatomic , copy) void (^peopleShowBlock)();//**  人秀按钮点击回调  */
@property (nonatomic , copy) void (^skyShowBlock)();//**  天秀点击回调  */
@property (nonatomic , copy) void (^earthShowBlock)();//**  地秀点击回调  */

@end
