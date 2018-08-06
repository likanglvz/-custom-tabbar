//
//  LKTabBarController.m
//  LKTabBar
//
//  Created by 李康 on 2018/8/6.
//  Copyright © 2018年 李康. All rights reserved.
//

#import "LKTabBarController.h"
#import "LKTabBar.h"

@interface LKTabBarController ()<LKTabBarDelegate,UITabBarDelegate>

@end

@implementation LKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setCenterTabWithTitle:(NSString *)centerBtnTitle withCenterBtnImage:(NSString *)centerBtnImage withCenterBtnSelectImage:(NSString *)centerBtnSelectImage withTabbarNum:(int)num{
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    LKTabBar *tab = [LKTabBar instanceCustomTabBarWithNum:num withIsNeedCenterBtn:YES];
    tab.centerBtnTitle = centerBtnTitle;
    tab.centerBtnImage = centerBtnImage;
    tab.centerBtnSelectImage = centerBtnSelectImage;
    tab.tabDelegate = self;
    [self setValue:tab forKey:@"tabBar"];
}

- (void)setupVCWithVCTitleNameinfoArr:(NSArray *)titleNameInfoArr WithVCImageNameinfoArr:(NSArray *)imageNameInfoArr WithVCSelectedImageNameinfoArr:(NSArray *)selectedImageNameInfoArr withNavVCName:(NSString *)nvcName{
    for (int i = 0; i< titleNameInfoArr.count; i++) {
         [self addChildVc:[[UIViewController alloc] init] title:[titleNameInfoArr objectAtIndex:i] image:[imageNameInfoArr objectAtIndex:i] selectedImage:[selectedImageNameInfoArr objectAtIndex:i] withNavigationVc:nvcName];
    }
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage withNavigationVc:(NSString*)className{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateSelected];
    if (![className isEqualToString:@""]) {
        Class navVCClass = NSClassFromString(className);
        [self addChildViewController:[[navVCClass alloc] initWithRootViewController:childVc]];
    }else{
        [self addChildViewController:childVc];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
//中间btn的跳转
-(void)tabBar:(LKTabBar *)tabBar clickCenterButton:(UIButton *)sender{
    
}
//普通tabbar点击事件
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
}

@end
