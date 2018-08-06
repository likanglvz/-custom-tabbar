# -custom-tabbar
封装的一个tabbar，可以实现普通样式和中间凸起的样式

###  《 首先调用 》设置普通样式的tabBarController,传入navgation的类名即可，或者传nil 即使用普通Vc
```objective-c
-(void)setupVCWithVCTitleNameinfoArr:(NSArray *)titleNameInfoArr 
                       WithVCImageNameinfoArr:(NSArray *)imageNameInfoArr 
                       WithVCSelectedImageNameinfoArr:(NSArray *)selectedImageNameInfoArr 
                       withNavVCName:(NSString *)nvcName;

```
### 《如果你想中间那个item 凸起，调用下面的方法》  num为item的总数
```objective-c
-(void)setCenterTabWithTitle:(NSString *)centerBtnTitle 
                        withCenterBtnImage:(NSString *)centerBtnImage 
                        withCenterBtnSelectImage:(NSString *)centerBtnSelectImage 
                        withTabbarNum:(int)num;

```
### 调用示例
```objective-c
LKTabBarController *tabbarVC = [[LKTabBarController alloc] init];

[tabbarVC setupVCWithVCTitleNameinfoArr:@[@"第一页",@"第二页",@"第三页",@"第四页"] WithVCImageNameinfoArr:@[@"pc1_normal",@"pc2_normal",@"pc3_normal",@"pc4_normal"] WithVCSelectedImageNameinfoArr:@[@"pc1_selected",@"pc2_selected",@"pc3_selected",@"pc4_selected"] withNavVCName:@""];

[tabbarVC setCenterTabWithTitle:@"发布" withCenterBtnImage:@"MF_goodsSquare_selected" withCenterBtnSelectImage:@"MF_goodsSquare_selected" withTabbarNum:5];//  如果不加这行，即为 第一页 第二页 第三页 第四页。。
依次，否则为第一页 第二页 发布 第三页 第四页

self.window.rootViewController = tabbarVC;

```
### LKTabBarController.m中有两个方法 不要忽视
```objective-c
//中间btn的跳转
-(void)tabBar:(LKTabBar *)tabBar clickCenterButton:(UIButton *)sender{
    
}
//普通tabbar点击事件
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
}

```
