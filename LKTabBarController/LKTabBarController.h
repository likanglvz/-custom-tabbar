//
//  LKTabBarController.h
//  LKTabBar
//
//  Created by 李康 on 2018/8/6.
//  Copyright © 2018年 李康. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKTabBarController : UITabBarController

-(void)setupVCWithVCTitleNameinfoArr:(NSArray *)titleNameInfoArr WithVCImageNameinfoArr:(NSArray *)imageNameInfoArr WithVCSelectedImageNameinfoArr:(NSArray *)selectedImageNameInfoArr withNavVCName:(NSString *)nvcName;

-(void)setCenterTabWithTitle:(NSString *)centerBtnTitle withCenterBtnImage:(NSString *)centerBtnImage withCenterBtnSelectImage:(NSString *)centerBtnSelectImage withTabbarNum:(int)num;

@end
