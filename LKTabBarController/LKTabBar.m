//
//  LKTabBar.m
//  LKTabBar
//
//  Created by 李康 on 2018/8/6.
//  Copyright © 2018年 李康. All rights reserved.
//

#import "LKTabBar.h"

@interface LKTabBar()
@property(nonatomic, strong) UIButton *centerButton;
@property(nonatomic, strong) UILabel *centerTitle;
@property (nonatomic,assign) int tabbarButtonNum;

@end

@implementation LKTabBar

+(instancetype)instanceCustomTabBarWithNum:(int)num withIsNeedCenterBtn:(BOOL)isNeed{
    LKTabBar *tabBar = [[LKTabBar alloc] init];
    tabBar.tabbarButtonNum = num;
    if (isNeed) {
        [tabBar setCenterBtn];
    }
    return tabBar;
}

-(void)setCenterBtn{
    self.translucent = NO;
    UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.centerButton = plusBtn;
    [plusBtn addTarget:self action:@selector(plusBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:plusBtn];
    
    UILabel *lblTitle = [[UILabel alloc] init];
    self.centerTitle = lblTitle;
    lblTitle.font = [UIFont systemFontOfSize:10];
    lblTitle.textColor = [UIColor blackColor];
    lblTitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:lblTitle];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    return self;
}

-(void)plusBtnDidClick{
    if (self.tabDelegate && [self.tabDelegate respondsToSelector:@selector(tabBar:clickCenterButton:)]) {
        [self.tabDelegate tabBar:self clickCenterButton:self.centerButton];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.frame.size.width/self.tabbarButtonNum;
    Class class = NSClassFromString(@"UITabBarButton");
    for (UIView *view in self.subviews) {
        if ([view isEqual:self.centerTitle]) {
            view.frame = CGRectMake(0, 0, width, 15);
            view.center = CGPointMake(self.frame.size.width/2, self.frame.size.height - view.frame.size.height + 8);
        }else if ([view isEqual:self.centerButton]) {
            view.frame = CGRectMake(0, 0, width, self.frame.size.height);
            [view sizeToFit];
            view.center = CGPointMake(self.frame.size.width/2, 10);
        }else if ([view isKindOfClass:class]){
            CGRect frame = view.frame;
            int indexFromOrign = view.frame.origin.x/width;
            if (indexFromOrign >= (self.tabbarButtonNum - 1) / 2) {
                indexFromOrign++;
            }
            CGFloat x = indexFromOrign * width;
            view.frame = CGRectMake(x, view.frame.origin.y, width, frame.size.height);
        }
    }
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.isHidden == NO) {
        CGPoint newP = [self convertPoint:point toView:self.centerButton];
        if ( [self.centerButton pointInside:newP withEvent:event]) {
            return self.centerButton;
        }else{
            return [super hitTest:point withEvent:event];
        }
    }
    else {
        return [super hitTest:point withEvent:event];
    }
}

-(void)setCenterBtnImage:(NSString *)centerBtnImage{
    _centerBtnImage = centerBtnImage;
    [self.centerButton setBackgroundImage:[UIImage imageNamed:self.centerBtnImage] forState:UIControlStateNormal];
}

-(void)setCenterBtnSelectImage:(NSString *)centerBtnSelectImage{
    _centerBtnSelectImage = centerBtnSelectImage;
    [self.centerButton setBackgroundImage:[UIImage imageNamed:self.centerBtnSelectImage] forState:UIControlStateHighlighted];
}

-(void)setCenterBtnTitle:(NSString *)centerBtnTitle{
    _centerBtnTitle = centerBtnTitle;
    self.centerTitle.text = centerBtnTitle;
}

@end
