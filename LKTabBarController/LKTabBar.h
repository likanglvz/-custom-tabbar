//
//  LKTabBar.h
//  LKTabBar
//
//  Created by 李康 on 2018/8/6.
//  Copyright © 2018年 李康. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LKTabBar;

@protocol LKTabBarDelegate <NSObject>

-(void)tabBar:(LKTabBar *)tabBar clickCenterButton:(UIButton *)sender;

@end


@interface LKTabBar : UITabBar

@property (nonatomic, weak) id<LKTabBarDelegate> tabDelegate;
@property (nonatomic, strong) NSString *centerBtnTitle;
@property (nonatomic, strong) NSString *centerBtnImage;
@property (nonatomic, strong) NSString *centerBtnSelectImage;

+(instancetype)instanceCustomTabBarWithNum:(int)num withIsNeedCenterBtn:(BOOL)isNeed;

@end
